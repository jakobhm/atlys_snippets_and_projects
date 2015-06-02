----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:23:11 04/30/2015 
-- Design Name: 
-- Module Name:    mac_tx - Behavioral 
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
use work.mac_tx_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mac_tx is
	port(
		rst						: in  std_logic;
		en							: in 	std_logic;
		clk_125mhz				: in  std_logic;
		-- UDP to MAC
		mac_tx_tvalid        : in  std_logic;							-- tdata is valid
		mac_tx_tfirst        : in  std_logic;							-- indicates first byte of frame
		mac_tx_tlast         : in  std_logic;							-- indicates last byte of frame
		mac_tx_tdata         : in  std_logic_vector(7 downto 0);	-- data byte to tx
		mac_tx_tready        : out std_logic;							-- mac is ready to accept data

		mk_hdr_mode				: in 	std_logic;							-- if true the mac makes the header
		mac_hdr					: in 	mac_tx_header_type;
		-- MAC to PHY
		phytxen					: out std_logic;
		phytxer					: out std_logic;
		phyTXD					: out std_logic_vector(7 downto 0);
		-- flow Control
		flow_ctrl_e				: in std_logic;
		flow_ctrl_btime		: in std_logic_vector(15 downto 0)
	);
end mac_tx;

architecture Behavioral of mac_tx is
	-- State Definition 
	-- State encoding mit 4 bit da 9 States => 16 moegliche states
	-- => fuege noch CRC0,CRC1,CRC2,CRC3 hinzu => weniger logic und flipflops(nur mit crc_ctr) 
	-- verkleinere aber Hammingdistatz diese ist aber ohnehin 1!?
	-- state fu
	type state_t is (	IDLE, PREAMBLE, SFD, ETH_HEADER,
							DATA_FIRST,
							DATA_SMALL, DATA_COMMON, DATA_JUMBO, PADDING, 
							CRC3, CRC2, CRC1, CRC0, 
							FLOW_CONTROL_TIME, INTERFRAME_GAP, ERROR);
	signal state_s, state_next_s 					: state_t := IDLE;
	--attribute fsm_encoding : string;
	--attribute fsm_encoding of state_s : signal is "speed1";
	--attribute safe_implementation : string;
	--attribute safe_implementation of state_s : signal is "yes";
	--attribute safe_recovery_state : string;
	--attribute safe_recovery_state of state_s : signal is "RECOVERY";
	
	-- Zaehler
	type ctr_state_t is (SET_CTR, COUNT);
	signal ctr_state_s								: ctr_state_t := SET_CTR;
	signal global_ctr_s 								: integer range 0 to 2**GLOBAL_CTR_SIZE-1 := 0;
	signal global_ctr_set_val						: integer range 0 to 2**GLOBAL_CTR_SIZE-1 := 0;
	
	-- to PHY Signale
	signal out_comb_phytxen_s						: std_logic := '0';
	signal out_comb_phytxer_s						: std_logic := '0';
	signal phyTXD_s									: std_logic_vector(7 downto 0) := x"00";
	
	-- to UDP Signal
	signal out_comb_mac_tx_tready_s				: std_logic := '0';
	
	-- CRC 
	signal crc_reg_crc_s, crc_comb_crc_new_s	: std_logic_vector(31 downto 0) := CRC_INITIAL_VALUE; 
	
	-- UDP to MAC mapping signals
	signal mac_tx_tvalid_s        				: std_logic := '0';							-- tdata is valid
	signal mac_tx_tfirst_s        				: std_logic := '0';							-- indicates first byte of frame
	signal mac_tx_tlast_s         				: std_logic := '0';							-- indicates last byte of frame
	signal mac_tx_tdata_s         				: std_logic_vector(7 downto 0) := x"00";	-- data byte to tx
	--signal mac_tx_tready_s        				: std_logic := '0';							-- mac is ready to accept data

	signal mk_hdr_mode_s								: std_logic := '0';							-- if true the mac makes the header
	signal mac_hdr_s									: mac_tx_header_type;
	
	-- flow control
	signal flow_ctrl_e_s								: std_logic;
	signal flow_ctrl_btime_s						: std_logic_vector(15 downto 0);
	signal saved_flow_ctrl_btime_s				: std_logic_vector(15 downto 0);
	signal rst_flow_ctrl_btime_reg_s				: std_logic;
	
	-- first data buffer signals
	signal buffering_en_s : std_logic := '0';
	signal bufferd_data_is_last_s : std_logic := '0';
	signal data_input_buf_on_s : std_logic := '1';
	signal buffered_data_s : std_logic_vector(7 downto 0) := x"00";
begin

-- signal to port mapping
	mac_tx_tvalid_s		<= mac_tx_tvalid;
	mac_tx_tfirst_s		<= mac_tx_tfirst;
	mac_tx_tlast_s			<= mac_tx_tlast;
	mac_tx_tdata_s			<= mac_tx_tdata when data_input_buf_on_s = '0' else buffered_data_s;
	mac_tx_tready			<= out_comb_mac_tx_tready_s;
	
	mk_hdr_mode_s			<= mk_hdr_mode;
	mac_hdr_s				<=	mac_hdr;		

	flow_ctrl_e_s			<= flow_ctrl_e;
	flow_ctrl_btime_s		<= flow_ctrl_btime;
-----------------------------------------------------------------------------------
--ethernet-frame	:	|preamble|preamble|preamble|preamble|
--byte-position 	:	|0       |1       |2       |3       |  
--
--ethernet-frame	:	|preamble|preamble|preamble|SFD     |
--byte-position 	:	|4       |5       |6       |7       |  

--ethernet-frame	:	|dst-mac |dst-mac |dst-mac |dst-mac |
--byte-position 	:	|8       |9       |10      |11      |  

--ethernet-frame	:	|dst-mac |dst-mac |src-mac |src-mac |
--byte-position 	:	|12      |13      |14      |15      |

--ethernet-frame	:	|src-mac |src-mac |src-mac |src-mac |
--byte-position 	:	|16      |17      |18      |19      |

--ethernet-frame	:	|len/type|len/type|data ...         |
--byte-position 	:	|20      |21      |22   ...         |

--ethernet-frame	:	|CRC3   |CRC2    |CRC1     |CRC0    |
--byte-position 	:	|n      |n+1     |n+2      |n+3     |

------------------------------------------------------------------------------------
--state	: IDLE_____________|PREAMBLE_SFD___________|DATA___________________|CRC/PAD
--clk		: _____|"""""|_____|"""""|_____|"""""|_____|"""""|_____|"""""|_____|"""""|_
--tready	: """""""""""""""""\_______________________/"""""""""""""""""""""""\_______
--tvalid	: ______/""""""""""\_______________________/"""""""""""""""""""""""\_______
--tfirst	: _________________/""""""""""""""""""""""""\______________________________
--tlast	: _____________________________________________________/"""""""""""\_______
--tdata	: _________________/ddddd...............ddd/eeeeeeeeeee/fffffffffff\_______
------------------------------------------------------------------------------------

-- combinatorial processes
	-- calculate the next state
	in_comb : process(
							-- internal signals
							state_s, crc_reg_crc_s, global_ctr_s, saved_flow_ctrl_btime_s,
							-- external signals
							mac_tx_tvalid_s, mac_tx_tfirst_s, mac_tx_tlast_s, 
							mac_tx_tdata_s, mk_hdr_mode_s, mac_hdr_s)
	begin
		-- default initialisation
		rst_flow_ctrl_btime_reg_s <= '0';
		ctr_state_s <= SET_CTR;
		-- calculate state_next_s signal
		case state_s is
			when IDLE 				=>
				state_next_s <= IDLE;
				if mac_tx_tvalid_s = '1'	then 
					state_next_s <= PREAMBLE;	
				end if;
			when PREAMBLE 			=>
				ctr_state_s <= COUNT;
				state_next_s <= PREAMBLE;
            if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif global_ctr_s = SFD_POS-1	then 
					state_next_s <= SFD;
				end if;
			when SFD 				=>
				state_next_s <= ETH_HEADER;
				if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif mk_hdr_mode_s = '0' then--and mac_tx_tfirst_s = '1'	then 
					state_next_s <= DATA_FIRST;			
				--elsif mk_hdr_mode_s = '0' then 	-- unnuetze abfrage
					--state_next_s <= ERROR;	
				end if;
			when ETH_HEADER 			=>
				ctr_state_s <= COUNT;
				state_next_s <= ETH_HEADER;
				if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif global_ctr_s = DATA_FIELD_POS-1 then --and mac_tx_tfirst_s = '1' then ??? geht noch nicht
					state_next_s <= DATA_FIRST;
				else 
					state_next_s <= ERROR;
				end if;
			when DATA_FIRST 			=>
				ctr_state_s <= COUNT;
				state_next_s <= DATA_SMALL;
				if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif bufferd_data_is_last_s = '1' then
					state_next_s <= PADDING;
				end if;
			when DATA_SMALL			=>
				ctr_state_s <= COUNT;
				state_next_s <= DATA_SMALL;
				if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif mac_tx_tlast_s = '1' then
					state_next_s <= PADDING;
				elsif global_ctr_s = ETH_FRAME_MIN_LEN-5 then
					state_next_s <= DATA_COMMON;
				end if;
			when DATA_COMMON			=>
				ctr_state_s <= COUNT;
				state_next_s <= DATA_COMMON;
				if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif mac_tx_tlast_s = '1' then
					state_next_s <= CRC3;
				elsif global_ctr_s = ETH_FRAME_MAX_LEN-5 then
					state_next_s <= DATA_JUMBO;
				end if;
			when DATA_JUMBO			=>
				ctr_state_s <= COUNT;
				state_next_s <= DATA_JUMBO;
				if mac_tx_tvalid_s = '0' then
               state_next_s <= ERROR;
            elsif mac_tx_tlast_s = '1' then
					state_next_s <= CRC3;			
				end if;
			when PADDING			=>
				ctr_state_s <= COUNT;
				state_next_s <= PADDING;
				if global_ctr_s = ETH_FRAME_MIN_LEN-5 then 
					state_next_s <= CRC3;			
				end if;
			when CRC3 				=> state_next_s <= CRC2;
			when CRC2 				=> state_next_s <= CRC1;
			when CRC1 				=> state_next_s <= CRC0;
			when CRC0 				=> state_next_s <= INTERFRAME_GAP;
			when INTERFRAME_GAP 	=>
				ctr_state_s <= COUNT;
				state_next_s <= INTERFRAME_GAP;
				if global_ctr_s = INTERFRAME_GAP_BITTIME-1 then
					ctr_state_s <= SET_CTR;
					state_next_s <= IDLE;
					if unsigned(saved_flow_ctrl_btime_s) /= 0 then 
						state_next_s <= FLOW_CONTROL_TIME;
						rst_flow_ctrl_btime_reg_s <= '1';
					elsif mac_tx_tvalid_s = '1' then 
						state_next_s <= PREAMBLE; 
					end if;
				end if;
			when FLOW_CONTROL_TIME =>
				ctr_state_s <= COUNT;
				state_next_s <= FLOW_CONTROL_TIME;
				if global_ctr_s = FLOCTRL_CHEK_VAL then
					state_next_s <= IDLE;
					if mac_tx_tvalid_s = '1' then 
						ctr_state_s <= SET_CTR;
						state_next_s <= PREAMBLE; 
					end if;
				end if;
			when ERROR				=>
				state_next_s <= INTERFRAME_GAP;
		end case;
		
	end process in_comb;
	
	-- calculate the outputsignals
	out_comb : process(
								-- internal signals
								state_s, global_ctr_s, crc_reg_crc_s, saved_flow_ctrl_btime_s,
								-- external signals
								mac_hdr_s, mac_tx_tdata_s, mk_hdr_mode_s
								)
	variable txd_v : std_logic_vector(7 downto 0);
	begin
		-- default initialisation
		phyTXD_s <= x"00";
		out_comb_mac_tx_tready_s <= '0';
		out_comb_phytxen_s <= '0';
		out_comb_phytxer_s <= '0';
		data_input_buf_on_s <= '0';
		global_ctr_set_val <= 0;
		buffering_en_s <= '0';
		-- calculate outputsignals signal 
		case state_s is
			when IDLE 				=>
				phyTXD_s <= x"00";
				out_comb_mac_tx_tready_s <= '1';
				buffering_en_s <= '1';
				out_comb_phytxen_s <= '0';
			when PREAMBLE 			=>
				phyTXD_s <= x"55";
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
			when SFD 				=>
				phyTXD_s <= x"D5";
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				
				if mk_hdr_mode_s = '0' then 
					out_comb_mac_tx_tready_s <= '0'; 
				end if;
			when ETH_HEADER 			=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				case global_ctr_s is
					-- Destination-MAC-Adress
					when 8 	=> 	phyTXD_s <= mac_hdr_s.dst_mac_addr(47 downto 40);
					when 9 	=> 	phyTXD_s <= mac_hdr_s.dst_mac_addr(39 downto 32);
					when 10 	=> 	phyTXD_s <= mac_hdr_s.dst_mac_addr(31 downto 24);
					when 11 	=> 	phyTXD_s <= mac_hdr_s.dst_mac_addr(23 downto 16);
					when 12 	=> 	phyTXD_s <= mac_hdr_s.dst_mac_addr(15 downto  8);
					when 13 	=> 	phyTXD_s <= mac_hdr_s.dst_mac_addr( 7 downto  0);
					-- Srouce-MAC-Adress
					when 14 	=> 	phyTXD_s <= mac_hdr_s.src_mac_addr(47 downto 40);
					when 15 	=> 	phyTXD_s <= mac_hdr_s.src_mac_addr(39 downto 32);
					when 16 	=> 	phyTXD_s <= mac_hdr_s.src_mac_addr(31 downto 24);
					when 17 	=> 	phyTXD_s <= mac_hdr_s.src_mac_addr(23 downto 16);
					when 18 	=> 	phyTXD_s <= mac_hdr_s.src_mac_addr(15 downto  8);
					when 19 	=> 	phyTXD_s <= mac_hdr_s.src_mac_addr( 7 downto  0);
					-- Type/Length
					when 20 	=> 	phyTXD_s <= mac_hdr_s.typ_len_field(15 downto  8);
					when 21 	=> 	phyTXD_s <= mac_hdr_s.typ_len_field( 7 downto  0);
					when others => null;
				end case;
			when DATA_FIRST 			=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				data_input_buf_on_s <= '1';
				phyTXD_s <= mac_tx_tdata_s;
			when DATA_SMALL 				=>
				out_comb_mac_tx_tready_s <= '1';
				out_comb_phytxen_s <= '1';
				phyTXD_s <= mac_tx_tdata_s;
			when DATA_COMMON 				=>
				out_comb_mac_tx_tready_s <= '1';
				out_comb_phytxen_s <= '1';
				phyTXD_s <= mac_tx_tdata_s;
			when DATA_JUMBO 				=>
				out_comb_mac_tx_tready_s <= '1';
				out_comb_phytxen_s <= '1';
				phyTXD_s <= mac_tx_tdata_s;
			when PADDING			=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				phyTXD_s <= x"00";
			when CRC3 				=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				phyTXD_s <=	not REVERSED(crc_reg_crc_s(31 downto 24)); 
			when CRC2 				=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				phyTXD_s <=	not REVERSED(crc_reg_crc_s(23 downto 16));
			when CRC1 				=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				phyTXD_s <=	not REVERSED(crc_reg_crc_s(15 downto  8));
			when CRC0 				=>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '1';
				phyTXD_s <=	not REVERSED(crc_reg_crc_s( 7 downto  0));
			when INTERFRAME_GAP 	=> 
				global_ctr_set_val <= to_integer(unsigned(not(saved_flow_ctrl_btime_s & "000000")));
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '0';
				phyTXD_s <= x"00";
			when FLOW_CONTROL_TIME =>
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '0';
				phyTXD_s <= x"00";
			when ERROR				=> 
				out_comb_mac_tx_tready_s <= '0';
				out_comb_phytxen_s <= '0';
				phyTXD_s <= x"00";
			when others => 
		end case;
	end process out_comb;
	
	-- save the crc 
	crc_comb : process(phyTXD_s, crc_reg_crc_s)
	begin
		crc_comb_crc_new_s <= NEXTCRC32_D8(phyTXD_s,crc_reg_crc_s);
	end process crc_comb;

-----------------------------------------------------------------------------------
-- register processes

	-- safe and switch the state
	state_reg : process(rst, en, clk_125mhz)
	begin 
		if rst = '1' then
			state_s <= IDLE;
		elsif en = '0' then null;
		elsif rising_edge(clk_125mhz) then
			state_s <= state_next_s;
		end if;		
	end process state_reg;
	
	-- safe and switch the crc
	crc_reg : process(rst, en, clk_125mhz)
	begin
		if rst = '1' then
			crc_reg_crc_s <= CRC_INITIAL_VALUE;
		elsif en = '0' then null;
		elsif rising_edge(clk_125mhz) then
			case state_s is
				when PREAMBLE =>
					crc_reg_crc_s <= CRC_INITIAL_VALUE;
				when ETH_HEADER | DATA_FIRST | DATA_SMALL | DATA_COMMON | DATA_JUMBO | PADDING =>
					crc_reg_crc_s <= crc_comb_crc_new_s;
				when others => null;
			end case;
		end if;	
	end process crc_reg;
	
	-- safe and switch the counters
	ctr_reg : process(rst, en, ctr_state_s, clk_125mhz)
	begin
		if rst = '1' then null;
			--global_ctr_s <= 0;
		elsif en = '0' then null;
		elsif rising_edge(clk_125mhz) then
			case ctr_state_s is
				when SET_CTR =>	global_ctr_s 	<= global_ctr_set_val;
				when COUNT	 => 	global_ctr_s  	<= global_ctr_s + 1;
				when others  => 	null;
			end case;
		end if;
	end process ctr_reg;
	
	-- delay the PHY output
	delay_phy_out_reg : process(rst, en, clk_125mhz)
	begin
		if rst = '1' or en = '0' then
			phytxen							<= '0';
			phytxer							<= '0';
			phyTXD							<= x"00";	
		elsif falling_edge(clk_125mhz) then
			phytxen							<= out_comb_phytxen_s;
			phytxer							<= out_comb_phytxer_s;
			phyTXD							<= phyTXD_s;	
		end if;	
	end process delay_phy_out_reg;
	
	-- save the flowcontorl bittime
	save_bittime : process(rst, clk_125mhz, state_s)
	begin
		if rst = '1' then
			saved_flow_ctrl_btime_s <= x"0000";
		elsif clk_125mhz'event and clk_125mhz ='1' then
			if flow_ctrl_e_s = '1' then
				saved_flow_ctrl_btime_s <= flow_ctrl_btime_s;
			elsif rst_flow_ctrl_btime_reg_s = '1' then
				saved_flow_ctrl_btime_s <= x"0000";
			end if;
		end if;
	end process save_bittime;
			
	-- input buffer only for first byte
	input_buffer : process(clk_125mhz)
	begin
		if clk_125mhz'event and clk_125mhz = '1' then
			if buffering_en_s = '1' then
				bufferd_data_is_last_s <= mac_tx_tlast_s;
				buffered_data_s <= mac_tx_tdata;
			end if;
		end if;
	end process input_buffer;

end Behavioral;

