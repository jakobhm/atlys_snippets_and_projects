----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:48:36 04/22/2015 
-- Design Name: 
-- Module Name:    send_to_arduino - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity send_to_arduino is
port( clk           : in std_logic;
      reset         : in std_logic;
		-- ram interface
		ram_ready     : in std_logic;  -- low for ready
		ram_addr_rd   : out std_logic_vector(10 downto 0);
		ram_en        : out std_logic;
		ram_data      : in std_logic_vector(7 downto 0);
		ram_last_addr : in std_logic_vector(10 downto 0);
		-- serial interface
		so_txd_out    : out std_logic_vector(3 downto 0);
		so_en_out     : out std_logic;
		so_clk_out    : out std_logic);
end send_to_arduino;

architecture Behavioral of send_to_arduino is

component arduino_tx
port ( txd_in  : in  STD_LOGIC_VECTOR (7 downto 0);
       en_in   : in  STD_LOGIC;
       clk_in  : in  STD_LOGIC;
       txd_out : out  STD_LOGIC_VECTOR (3 downto 0);
       en_out  : out  STD_LOGIC;
       clk_out : out  STD_LOGIC);
end component;

-- FSM
type state_type is (IDLE,EN_HIGH,WAIT_FOR_CLK_HIGH,WAIT_FOR_CLK_LOW,SEND_BYTE_CLK_LOW,SEND_BYTE_CLK_HIGH,SEND_WAIT_CLK_LOW,SEND_WAIT_CLK_HIGH,END_OF_TRANSMISSION,ERROR);
signal cur_state, next_state : state_type;
signal addr_counter : std_logic_vector(10 downto 0);
signal cnt_reset : std_logic;

-- arduino_tx
signal clk_10kHz : std_logic;
signal en_in_s   : std_logic;
signal en_in_s_tmp : std_logic;
signal txd_in_s  : std_logic_vector(7 downto 0);

-- addr_inc
signal inc_addr : std_logic;
signal inc_reset : std_logic;

begin

arduino_tx_comp : arduino_tx
port map( --input ports:
          txd_in => txd_in_s,
          en_in  => en_in_s_tmp,
			 clk_in => clk_10kHz,
			 --output ports:
			 txd_out => so_txd_out,
			 en_out  => so_en_out,
			 clk_out => so_clk_out);
			 
en_in_s_tmp <= en_in_s or reset;   -- arduino_tx has no reset; Its signals are unspecified until en_in is high

clk_gen_125MHz_to_10kHz : process (clk, reset)
constant cnt_max : integer := 12500/2;
variable counter : integer range 0 to cnt_max;
begin
   if reset = '1' then
	   counter := 0;
		clk_10kHz <= '0';
	elsif rising_edge(clk) then
	   counter := counter + 1;
		if counter = cnt_max then
		   counter := 0;
			clk_10kHz <= not clk_10kHz;
		end if;
	end if;
end process clk_gen_125MHz_to_10kHz;

addr_inc : process (inc_addr, inc_reset)
begin
   if inc_reset = '1' then
	   addr_counter <= (others=>'0');
	elsif rising_edge(inc_addr) then
	   addr_counter <= std_logic_vector(unsigned(addr_counter) + 1);
	end if;
end process addr_inc;

fsm_proc : process (cur_state, ram_ready, ram_last_addr, addr_counter, clk_10kHz, RESET)
begin
   if RESET = '1' then
	   -- nothing
	else
	   next_state <= cur_state; -- default
	   case cur_state is
		   when IDLE =>
			   if ram_ready = '1' then
				   next_state <= EN_HIGH;
				end if;
			when EN_HIGH =>
            if ram_ready = '0' then
				   next_state <= WAIT_FOR_CLK_HIGH;
				end if;
			when WAIT_FOR_CLK_HIGH =>
			   if ram_ready = '1' then
				   next_state <= ERROR;
				elsif clk_10kHz = '1' then
				   next_state <= WAIT_FOR_CLK_LOW;
				end if;
			when WAIT_FOR_CLK_LOW =>
			   if ram_ready = '1' then
				   next_state <= ERROR;
				elsif clk_10kHz = '0' then
				   next_state <= SEND_BYTE_CLK_LOW;
				end if;
			when SEND_BYTE_CLK_LOW =>
            if ram_ready = '1' then
				   next_state <= ERROR;
				elsif clk_10kHz = '1' then
				   next_state <= SEND_BYTE_CLK_HIGH;
				end if;
			when SEND_BYTE_CLK_HIGH =>
			   if ram_ready = '1' then
				   next_state <= ERROR;
				elsif clk_10kHz = '0' then
				   next_state <= SEND_WAIT_CLK_LOW;
				end if;
			when SEND_WAIT_CLK_LOW =>
			   if ram_ready = '1' then
				   next_state <= ERROR;
				elsif clk_10kHz = '1' then
				   next_state <= SEND_WAIT_CLK_HIGH;
				end if;
			when SEND_WAIT_CLK_HIGH =>
			   if ram_ready = '1' then
				   next_state <= ERROR;
				elsif clk_10kHz = '0' then
				   next_state <= END_OF_TRANSMISSION;
				end if;
			when END_OF_TRANSMISSION =>
            if addr_counter > ram_last_addr then  -- end of transmission; placed here to be sure that the last byte is completely transmitted
				   next_state <= IDLE;
				else
				   next_state <= SEND_BYTE_CLK_LOW;
				end if;
			when ERROR =>
			   next_state <= IDLE;
		   when others =>
			   next_state <= IDLE;
		end case;
	end if;
end process fsm_proc;


-- input:
--    FSM:
--       cur_state
--    addr_inc:
--       addr_counter
--    ram:
--       ram_data
--    adruino:
-- output:
--    addr_inc:
--       inc_reset
--       inc_addr
--    ram:
--       ram_addr_rd
--       ram_en
--    arduino:
--       en_in
--       txd_in
fsm_comb : process (cur_state, addr_counter, ram_data)
begin
   -- default-values:
   inc_reset   <= '0';
	inc_addr    <= '0';
	ram_addr_rd <= (others => '0');
	ram_en      <= '0';
	en_in_s     <= '0';
	txd_in_s    <= (others => '0');
	-- end default
   case cur_state is
		   when IDLE =>
			   -- default
			when EN_HIGH =>
            inc_reset <= '1';
			when WAIT_FOR_CLK_HIGH =>
			   inc_reset <= '1';
			when WAIT_FOR_CLK_LOW =>
			   inc_reset <= '1';
			when SEND_BYTE_CLK_LOW =>
            ram_addr_rd <= addr_counter;
				ram_en <= '1';
				en_in_s <= '1';
				txd_in_s <= ram_data;
			when SEND_BYTE_CLK_HIGH =>
			   ram_addr_rd <= addr_counter;
				ram_en <= '1';
				en_in_s <= '1';
				txd_in_s <= ram_data;
			when SEND_WAIT_CLK_LOW =>
			   ram_addr_rd <= addr_counter;
				ram_en <= '1';
				en_in_s <= '1';
				txd_in_s <= ram_data;
			when SEND_WAIT_CLK_HIGH =>
			   ram_addr_rd <= addr_counter;
				ram_en <= '1';
				en_in_s <= '1';
				txd_in_s <= ram_data;
			when END_OF_TRANSMISSION =>
			   inc_addr <= '1';-- increment address
            ram_addr_rd <= addr_counter;
				ram_en <= '1';
				en_in_s <= '1';
				txd_in_s <= ram_data;
			when ERROR =>
			   -- default
		   when others =>
			   -- default
		end case;
end process fsm_comb;

fsm_reg : process (CLK, RESET)
begin
   if RESET = '1' then
	   cur_state <= IDLE;
	elsif rising_edge(CLK) then
	   cur_state <= next_state;
	end if;
end process fsm_reg;

end Behavioral;