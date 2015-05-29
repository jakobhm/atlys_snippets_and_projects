----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:55 04/21/2015 
-- Design Name: 
-- Module Name:    frame_logger - Behavioral 
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

entity frame_logger is
generic ( ram_addr_width : positive := 11;
          ram_word_width : positive := 8);
port( reset        : in std_logic;
      clk          : in std_logic;
		start        : in std_logic;   -- for start-signal
		dv           : in std_logic;   -- data valid input
		din          : in std_logic_vector(ram_word_width-1 downto 0);  -- data input
		last_address : out std_logic_vector(ram_addr_width-1 downto 0); -- shows the address of the last read byte
		-- RAM interface
		ram_en       : in std_logic;
		ram_addr     : in std_logic_vector(ram_addr_width-1 downto 0);  -- 2048 addresses
		ram_dout     : out std_logic_vector(ram_word_width-1 downto 0);
		ext_ram_read_en : out std_logic);
end frame_logger;

architecture Behavioral of frame_logger is

component BRAM
generic( addr_width   : positive := 8;
         word_width   : positive := 8);
port( clk   : in std_logic;                                  -- clock
      en    : in std_logic;                                  -- global enable
		we    : in std_logic;                                  -- write enable
		addr  : in std_logic_vector(ram_addr_width-1 downto 0);    -- address
		din   : in std_logic_vector(ram_word_width-1 downto 0);    -- data in
		dout  : out std_logic_vector(ram_word_width-1 downto 0));  -- data out
end component;

-- ram signals
signal ram_en_s : std_logic;
signal ram_we_s : std_logic;
signal ram_addr_s : std_logic_vector(ram_addr_width-1 downto 0);

-- fsm
type state_type is (IDLE,START_PUSHED,WAIT_FOR_SIGNAL,SAVE_SIGNAL);
signal cur_state, next_state : state_type;
signal fsm_ram_en_s : std_logic;

-- ram_manager
signal rm_ram_addr_s : std_logic_vector(ram_addr_width-1 downto 0);
signal rm_ram_en_s : std_logic;
signal rm_hold : std_logic;

-- double FF din
signal din_s : std_logic_vector(ram_word_width-1 downto 0);
signal din_tmp : std_logic_vector(ram_word_width-1 downto 0);

-- FF rm_hold
signal ext_ram_read_en_s : std_logic;

begin

BRAM_comp : BRAM
generic map ( addr_width => ram_addr_width,
              word_width => ram_word_width)
port map ( clk => clk,
           en => ram_en_s,
			  we => rm_ram_en_s,
			  addr => ram_addr_s,
			  din => din_s,
			  dout => ram_dout);
			  
-- mux for BRAM-Signals (choose Signals from RAM-Interface or RAM-Manager)
ram_en_s <= ram_en when rm_ram_en_s = '0' else
            '1';
--ram_we_s <= rm_ram_en_s; -- RAM-Interface only has read operation; RAM-Manager only has write operation
ram_addr_s <= ram_addr when rm_ram_en_s = '0' else
              rm_ram_addr_s;
				  
-- FF din
ff : process (clk)
begin
   if rising_edge(clk) then
	   din_tmp <= din;
		din_s <= din_tmp;
	end if;
end process ff;

			  
fsm_proc : process (cur_state, start, dv, reset)
begin
   if reset = '1' then
	   -- nothing
	else
	   next_state <= cur_state; -- default
	   case cur_state is
		   when IDLE =>
			   if start = '1' then
				   next_state <= START_PUSHED;
				end if;
			when START_PUSHED =>
			   if start = '0' then
				   next_state <= WAIT_FOR_SIGNAL;
				end if;
			when WAIT_FOR_SIGNAL =>
			   if dv = '1' then
				   next_state <= SAVE_SIGNAL;
				end if;
			when SAVE_SIGNAL =>
			   if dv = '0' then
				   next_state <= IDLE;
				end if;
		   when others =>
			   next_state <= IDLE;
		end case;
	end if;
end process fsm_proc;

fsm_comb : process (cur_state)
begin
   fsm_ram_en_s <= '0'; -- default
   case cur_state is
		when IDLE =>
		   -- default
		when START_PUSHED =>
		   -- default
		when WAIT_FOR_SIGNAL =>
		   -- default
		when SAVE_SIGNAL =>
		   fsm_ram_en_s <= '1';
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
	else
	   -- hold
	end if;
end process fsm_reg;

ram_manager : process (CLK, RESET)
begin
   if RESET = '1' then
	   rm_ram_addr_s <= (others => '0');
		rm_hold <= '1';
		rm_ram_en_s <= '0';
	elsif rising_edge(CLK) then
	   if fsm_ram_en_s = '1' then
		   if rm_hold = '1' then  -- start counting
			   rm_hold <= '0';
				rm_ram_addr_s <= (others => '0');
				rm_ram_en_s <= '1';
				--rm_ram_addr_s(0) <= '1';
			else -- counting
			   rm_ram_addr_s <= std_logic_vector(unsigned(rm_ram_addr_s) + 1);
				rm_ram_en_s <= '1';
			end if;
		else
		   if rm_hold = '1' then  -- holding
			   -- hold
			else  -- start holding
			   rm_hold <= '1';
				rm_ram_en_s <= '0';
			end if;
		end if;
	else
	   -- hold
	end if;
end process ram_manager;

-- FF for 1 clk-delay of rm_hold
--ff_rm_hold : process (CLK, RESET)
--begin
--   if RESET = '1' then
--	   ext_ram_read_en_s <= '0';
--	elsif rising_edge(CLK) then
--	   ext_ram_read_en_s <= rm_hold;
--	end if;
--end process ff_rm_hold;

last_address <= rm_ram_addr_s;
-- ext_ram_read_en <= ext_ram_read_en_s;
ext_ram_read_en <= rm_ram_en_s;

end Behavioral;

