----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:52:12 05/21/2015 
-- Design Name: 
-- Module Name:    frameGrabberEthernet - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 1.00 - it works, but looks horrible
-- Revision 1.01 - added model config: useParallelRead; testet, works well
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipv4_types.all;
use work.axi.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frameGrabberEthernet is
generic(
   -- model config
	useParallelRead        : boolean := true;
   -- ram config
   seq_read_byte_cnt      : integer := 10;
	parallel_read_byte_cnt : integer := 10;
	ram_addr_width         : integer := 11;
	-- udp config
	udp_dst_ip_addr     : std_logic_vector(31 downto 0) := X"FFFFFFFF";
	udp_dst_port        : std_logic_vector(15 downto 0) := X"FFFF";
	udp_src_port        : std_logic_vector(15 downto 0) := X"FFFF";
	--udp_data_length     : std_logic_vector(15 downto 0);
	udp_checksum        : std_logic_vector(15 downto 0) := X"0000");
port(
   areset     : in std_logic;
	clk_en     : in std_logic;
	clk        : in std_logic;
	-- data input
	d_parallel_in  : in std_logic_vector((parallel_read_byte_cnt*8)-1 downto 0);
	d_seq_in       : in std_logic_vector(7 downto 0);
	dv         : in std_logic;
	-- udp interface
	udp_tx_start			 : out std_logic;
	udp_txi					 : out udp_tx_type;
	udp_tx_result			 : in std_logic_vector (1 downto 0);
	udp_tx_data_out_ready : in std_logic);
end frameGrabberEthernet;

--udp_txi.hdr.dst_ip_addr 		   : STD_LOGIC_VECTOR (31 downto 0);
--udp_txi.hdr.dst_port	 			   : STD_LOGIC_VECTOR (15 downto 0);
--udp_txi.hdr.src_port	 			   : STD_LOGIC_VECTOR (15 downto 0);
--udp_txi.hdr.data_length			   : STD_LOGIC_VECTOR (15 downto 0);	-- user data size, bytes
--udp_txi.hdr.checksum				   : STD_LOGIC_VECTOR (15 downto 0);
--
--udp_txi.data.data_out_valid		: std_logic;								-- indicates data out is valid
--udp_txi.data.data_out_last		   : std_logic;								-- with data out valid indicates the last byte of a frame
--udp_txi.data.data_out				: std_logic_vector (7 downto 0);		-- ethernet frame (from dst mac addr through to last byte of frame)

architecture Behavioral of frameGrabberEthernet is

-- RAM_PARALLEL
type RAM_PARALLEL_TYPE is array (0 to parallel_read_byte_cnt-1) of std_logic_vector(7 downto 0);
signal RAM_PARALLEL : RAM_PARALLEL_TYPE;
signal ram_parallel_addr : std_logic_vector(ram_addr_width-1 downto 0);
signal ram_parallel_din  : RAM_PARALLEL_TYPE;
signal ram_parallel_aload, ram_parallel_read   : std_logic;
signal ram_parallel_dout : std_logic_vector(7 downto 0);

-- RAM_SEQ
type RAM_SEQ_TYPE is array (0 to seq_read_byte_cnt-1) of std_logic_vector(7 downto 0);
signal RAM_SEQ : RAM_SEQ_TYPE;
signal ram_seq_addr : std_logic_vector(ram_addr_width-1 downto 0);
signal ram_seq_en, ram_seq_we, ram_seq_areset   : std_logic;
signal ram_seq_din, ram_seq_dout : std_logic_vector(7 downto 0);

-- fsm
type STATE_TYPE is (STATE_RESET, IDLE, DATA_READ, WAIT_FOR_TX_READY, SEND_PARALLEL_DATA, SEND_PARALLEL_DATA_LAST, SEND_SEQ_DATA, SEND_SEQ_DATA_LAST);
signal next_state, cur_state : STATE_TYPE;

-- counter
signal cnt_out      : std_logic_vector(ram_addr_width-1 downto 0);
signal cnt_apre, cnt_en     : std_logic;
signal cnt_apre_val : std_logic_vector(ram_addr_width-1 downto 0);


begin

----------------------------------------
--        FSM_PROC : PROCESS          --
----------------------------------------
-- INPUTS:
--    d_seq_in
--    d_parallel_in
--    dv
--    udp_tx_result
--    udp_tx_data_out_ready
--    ram_parallel_dout
--    ram_seq_dout
--    cur_state
--    cnt_out
--    useParallelRead
-- OUTPUTS:
--    udp_txi.hdr.dst_ip_addr
--    udp_txi.hdr.dst_port
--    udp_txi.hdr.src_port
--    udp_txi.hdr.data_length
--    udp_txi.hdr.checksum
--    udp_txi.data.data_out_valid
--    udp_txi.data.data_out_last
--    udp_txi.data.data_out
--    udp_tx_start
--    cnt_en
--    cnt_apre
--    cnt_apre_val
--    ram_seq_areset
--    ram_seq_en
--    ram_seq_addr
--    ram_seq_din
--    ram_seq_we
--    ram_parallel_read
--    ram_parallel_addr
--    ram_parallel_din
--    ram_parallel_aload
--    next_state
----------------------------------------
fsm_proc : process(d_seq_in, d_parallel_in, dv, udp_tx_result, udp_tx_data_out_ready, ram_parallel_dout, ram_seq_dout, cur_state, cnt_out)
   variable ram_seq_last_addr     : std_logic_vector(ram_addr_width-1 downto 0) := (others=>'0');
begin
   ----------------------
   -- default values:  --
	----------------------
	-- udp output
	udp_txi.hdr.dst_ip_addr     <= udp_dst_ip_addr;
   udp_txi.hdr.dst_port        <= udp_dst_port;
   udp_txi.hdr.src_port        <= udp_src_port;
   udp_txi.hdr.data_length     <= (others=>'0');
   udp_txi.hdr.checksum        <= (others=>'0');
   udp_txi.data.data_out_valid <= '0';
   udp_txi.data.data_out_last  <= '0';
   udp_txi.data.data_out       <= (others=>'0');
   udp_tx_start                    <= '0';
	-- counter
	cnt_en                          <= '0';
	cnt_apre                        <= '0';
	cnt_apre_val                    <= (others=>'0');
	-- ram_seq
	ram_seq_areset                  <= '0';
	ram_seq_en                      <= '0';
	ram_seq_addr                    <= (others=>'0');
	ram_seq_din                     <= (others=>'0');
	ram_seq_we                      <= '0';
	-- ram_parallel
	ram_parallel_read               <= '0';
	ram_parallel_addr               <= (others=>'0');
	ram_parallel_din                <= (others=>(others=>'0'));
	ram_parallel_aload              <= '0';
	
	next_state                      <= STATE_RESET;
   case cur_state is
	   when STATE_RESET =>
		   cnt_apre                        <= '1';  -- preset counter
			cnt_apre_val                    <= (others=>'0');  -- preset with 0
	      ram_parallel_aload              <= '1';  -- parallel load of ram_parallel
	      ram_parallel_din                <= (others=>(others=>'0'));
	      ram_seq_areset                  <= '1';  -- reset ram_seq
			ram_seq_last_addr               := (others=>'0');
			
			if dv = '0' then
		      next_state                   <= IDLE;
			else
			   next_state                   <= STATE_RESET;
			end if;
	   when IDLE =>
		   ram_seq_en                      <= '1';
			ram_seq_addr                    <= cnt_out;
			ram_seq_din                     <= d_seq_in;
			if dv = '1' then
			   ram_seq_we                   <= '1';
				cnt_en                       <= '1';
			
			   next_state                   <= DATA_READ;
			else
			   next_state                   <= IDLE;
			end if;
		when DATA_READ =>
			if dv = '1' then
			   ram_seq_we                   <= '1';
			   ram_seq_en                   <= '1';
			   ram_seq_addr                 <= cnt_out;
			   ram_seq_din                  <= d_seq_in;
		      cnt_en                       <= '1';
			
			   next_state                   <= DATA_READ;
			else
			   for k in 0 to parallel_read_byte_cnt-1 loop
				   ram_parallel_din(k)       <= d_parallel_in(((k+1)*8)-1 downto k*8);
				end loop;
	         ram_parallel_aload           <= '1';
				ram_seq_last_addr            := cnt_out;
			
			   next_state                   <= WAIT_FOR_TX_READY;
			end if;
		when WAIT_FOR_TX_READY =>
   		udp_txi.hdr.data_length         <= std_logic_vector(unsigned(cnt_out) + 1 + to_unsigned(parallel_read_byte_cnt, 16));
   		--udp_txi.data.data_out_valid <= '1';
   		udp_txi.data.data_out           <= ram_parallel(0);
			
			if udp_tx_data_out_ready = '1' then
			   cnt_en                       <= '1';
				udp_txi.data.data_out_valid  <= '1';
			   
				if useParallelRead = true then
			      next_state                   <= SEND_PARALLEL_DATA;
				else
				   next_state                   <= SEND_SEQ_DATA;
				end if;
			else
			   udp_tx_start                 <= '1';
			   cnt_apre                     <= '1';  -- preset counter
				cnt_apre_val                 <= (others=>'0');  -- preset with 0
				
				next_state                   <= WAIT_FOR_TX_READY;
			end if;
			
		when SEND_PARALLEL_DATA =>
		   udp_txi.hdr.data_length         <= std_logic_vector(unsigned(cnt_out) + 1 + to_unsigned(parallel_read_byte_cnt, 16));
   		udp_txi.data.data_out_valid     <= '1';
   		udp_txi.data.data_out           <= ram_parallel(to_integer(unsigned(cnt_out)));
			
		   cnt_en                          <= '1';
			
			if cnt_out = std_logic_vector(to_unsigned(parallel_read_byte_cnt-2, ram_addr_width)) then
			   next_state <= SEND_PARALLEL_DATA_LAST;
			else
			   next_state <= SEND_PARALLEL_DATA;
			end if;
			
		when SEND_PARALLEL_DATA_LAST =>
		   udp_txi.hdr.data_length         <= std_logic_vector(unsigned(cnt_out) + 1 + to_unsigned(parallel_read_byte_cnt, 16));
   		udp_txi.data.data_out_valid     <= '1';
   		udp_txi.data.data_out           <= ram_parallel(parallel_read_byte_cnt-1);
		   cnt_apre                        <= '1';  -- preset counter
			cnt_apre_val                    <= (others=>'0');  -- preset with 0
			next_state                      <= SEND_SEQ_DATA;
		   
		when SEND_SEQ_DATA =>
		   udp_txi.hdr.data_length         <= std_logic_vector(unsigned(cnt_out) + 1 + to_unsigned(parallel_read_byte_cnt, 16));
   		udp_txi.data.data_out_valid     <= '1';
   		udp_txi.data.data_out           <= ram_seq(to_integer(unsigned(cnt_out)));
			
		   cnt_en                          <= '1';
			
			if cnt_out = std_logic_vector(unsigned(ram_seq_last_addr) - 2) then
			   next_state <= SEND_SEQ_DATA_LAST;
			else
			   next_state <= SEND_SEQ_DATA;
			end if;
		
		when SEND_SEQ_DATA_LAST =>
		   udp_txi.hdr.data_length         <= std_logic_vector(unsigned(cnt_out) + 1 + to_unsigned(parallel_read_byte_cnt, 16));
   		udp_txi.data.data_out_valid     <= '1';
   		udp_txi.data.data_out           <= ram_seq(to_integer(unsigned(ram_seq_last_addr)-1));
			udp_txi.data.data_out_last      <= '1';
			
			next_state                      <= STATE_RESET;
		when others =>
		   next_state                      <= STATE_RESET;
	end case;
end process fsm_proc;

----------------------------------------
--         FSM_REG : PROCESS          --
----------------------------------------
-- INPUTS:
--    areset
--    clk_en
--    clk
--    next_state
-- OUTPUTS:
--    cur_state
----------------------------------------
fsm_reg : process(areset, clk_en, clk, next_state)
begin
   if areset = '1' then
      cur_state <= STATE_RESET;
	elsif rising_edge(clk) then
	   if clk_en = '1' then
		   cur_state <= next_state;
		end if;
	end if;
end process fsm_reg;

----------------------------------------
--         COUNTER : PROCESS          --
----------------------------------------
-- INPUTS:
--    cnt_en
--    clk
--    cnt_apre
--    cnt_apre_val
-- OUTPUTS:
--    cnt_out
----------------------------------------
counter : process(cnt_en, clk, cnt_apre, cnt_apre_val)
begin
   if cnt_apre = '1' then
	   cnt_out <= cnt_apre_val;
	elsif rising_edge(clk) then
	   if cnt_en = '1' then
		   cnt_out <= std_logic_vector(unsigned(cnt_out) + 1);
		end if;
	end if;
end process counter;

----------------------------------------
--         RAM_SEQ : PROCESS          --
----------------------------------------
-- INPUTS:
--    clk
--    ram_seq_en
--    ram_seq_addr
--    ram_seq_din
--    ram_seq_we
-- OUTPUTS:
--    ram_seq_dout
----------------------------------------
ram_seq_proc : process(clk, ram_seq_en, ram_seq_addr, ram_seq_we, ram_seq_we)
begin
   if rising_edge(clk) then
	   if ram_seq_en = '1' then
		   if ram_seq_we = '1' then
		      ram_seq(to_integer(unsigned(ram_seq_addr))) <= ram_seq_din;
			else
			   ram_seq_dout <= ram_seq(to_integer(unsigned(ram_seq_addr)));
			end if;
		end if;
	end if;
end process ram_seq_proc;

----------------------------------------
--    RAM_PARALLEL_PROC : PROCESS     --
----------------------------------------
-- INPUTS:
--    clk
--    ram_parallel_read
--    ram_parallel_addr
--    ram_parallel_din
--    ram_parallel_aload
-- OUTPUTS:
--    ram_parallel_dout
----------------------------------------
ram_parallel_proc : process(clk, ram_parallel_read, ram_parallel_addr, ram_parallel_aload)
begin
   if ram_parallel_aload = '1' then
	   ram_parallel <= ram_parallel_din;
	elsif rising_edge(clk) then
	   if ram_parallel_read = '1' then
		   ram_parallel_dout <= ram_parallel(to_integer(unsigned(ram_parallel_addr)));
		end if;
	end if;
end process ram_parallel_proc;

end Behavioral;