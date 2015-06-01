--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:27:04 05/04/2015
-- Design Name:   
-- Module Name:   C:/Users/Jakob Wittmann/Dropbox/ISE_Projects/MAC_1G/mac_1g_rx_tb.vhd
-- Project Name:  MAC_1G
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mac_1g_rx
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mac_1g_types.all;
use work.pck_crc32_d8.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY mac_1g_rx_tb IS
END mac_1g_rx_tb;
 
ARCHITECTURE behavior OF mac_1g_rx_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mac_1g_rx
    PORT(
         rx_en : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         gmii_rx : IN  gmii_rx_type;
         rx_data_interface : OUT  mac_1g_rx_data_interface_type;
         rx_info_interface : OUT  mac_1g_rx_state_info_interface_type
        );
    END COMPONENT;
    

   --Inputs
   signal rx_en : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal gmii_rx : gmii_rx_type;

 	--Outputs
   signal rx_data_interface : mac_1g_rx_data_interface_type;
   signal rx_info_interface : mac_1g_rx_state_info_interface_type;

   -- Clock period definitions
   constant clk_period : time := 8 ns;
	
	-- others
	signal test_info : std_logic_vector(15 downto 0);
	type frame_info_type is (FRAME_INFO_NO_FRAME, FRAME_INFO_PREAMBLE, FRAME_INFO_FRAME_DELIMITER, FRAME_INFO_SRC_ADDR, FRAME_INFO_DST_ADDR, FRAME_INFO_T_L, FRAME_INFO_DATA, FRAME_INFO_FCS, FRAME_INFO_SOMETHING);
	signal frame_info : frame_info_type;
	signal index_info : std_logic_vector(15 downto 0);
	signal fcs        : std_logic_vector(31 downto 0) := (others=>'0');
	
	--###########################  OLD STUFF  ########################################
	constant data_bytes    : integer := 60;
	constant frame_bytes   : integer := data_bytes+4;
	constant data_bits     : integer := 8*data_bytes;
	constant frame_bits    : integer := 8*frame_bytes;

   signal test_data_compl : std_logic_vector(frame_bits-1 downto 0);
	constant test_data     : std_logic_vector(data_bits-1 downto 0) := 
	   (X"FFFFFFFFFFFF02AAAAAAAAAA08004500001d00000000801147b1a9fecfffa9fecf221f401f4000090000010000000000000000000000000000000000");
	
	-- crc calculated with web-tool: https://ghsi.de/CRC/index.php?Polynom=100000100110000010001110110110111&Message=0123456789ABCDEFFEDCBA9876543210
	constant crc           : std_logic_vector(31 downto 0) :=
	   (X"5e24a115");
		
	signal crc_tmp         : std_logic_vector(31 downto 0);
	
	signal fcs_reversed    : std_logic_vector(31 downto 0);
	--################################################################################
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mac_1g_rx PORT MAP (
          rx_en => rx_en,
          reset => reset,
          clk => clk,
          gmii_rx => gmii_rx,
          rx_data_interface => rx_data_interface,
          rx_info_interface => rx_info_interface
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	fcs_reversed(31 downto 24) <= not reversed(fcs(31 downto 24));
	fcs_reversed(23 downto 16) <= not reversed(fcs(23 downto 16));
	fcs_reversed(15 downto 8) <= not reversed(fcs(15 downto 8));
	fcs_reversed(7 downto 0) <= not reversed(fcs(7 downto 0));
 

   -- Stimulus process
   stim_proc: process
	
	type addr_type is array (0 to 5) of std_logic_vector(7 downto 0);
	type type_length_type is array (0 to 1) of std_logic_vector(7 downto 0);
	
	variable cnt_preamble        : integer   := 7;
	variable cnt_frame_delimiter : integer   := 1;
	variable cnt_src_addr        : integer   := 6;
	variable src_addr            : addr_type := (others=>(others=>'0'));
	variable cnt_dst_addr        : integer   := 6;
	variable dst_addr            : addr_type := (others=>(others=>'0'));
	variable cnt_type_length     : integer   := 2;
	variable type_length         : type_length_type := (others=>(others=>'0'));
	variable cnt_data            : integer   := 46;
	variable cnt_fcs             : integer   := 4;
	variable cnt_something       : integer   := 10;
	
	constant cnt_rx_er : integer := 10;
	type rx_er_type is array (0 to cnt_rx_er-1) of integer;
	variable rx_er_vec           : rx_er_type := (others=>-1);
	
	variable rx_dv_start_index   : integer := 8;
	variable rx_dv_end_index     : integer := 72;
	constant cnt_rx_dv : integer := 10;
	type rx_dv_type is array (0 to cnt_rx_dv-1) of integer;
	variable rx_dv_vec           : rx_dv_type := (others=>-1);
	
	variable start_fd_index          : integer := 0;
	variable start_src_addr_index    : integer := 0;
	variable start_dst_addr_index    : integer := 0;
	variable start_type_length_index : integer := 0;
	variable start_data_index        : integer := 0;
	variable start_fcs_index         : integer := 0;
	variable end_frame_index         : integer := 0;
	variable end_index               : integer := 0;
	
	-- others
	variable rx_er_found : boolean := false;
	variable rx_dv_found : boolean := false;
	variable local_index : integer := 0;
	variable rxd         : std_logic_vector(7 downto 0) := (others=>'0');
	
	--#############################  OLD STUFF  ###############################
	variable j : integer := 0;
	variable run : integer := 0;
	--#########################################################################
	
   begin		
      reset <= '1';
      wait for 100 ns;
      reset <= '0';		

      wait for clk_period*9;
		wait for clk_period/2;
		
		
		-- ############################################################### --
		-- ###                       OLD STUFF                         ### --
		-- ############################################################### --
		
		test_data_compl(frame_bits-1 downto 32) <= test_data;
		test_data_compl(31 downto 0) <= crc;
--      for i in 0 to 31 loop
--	      test_data_compl(i) <= not crc(31-i);
--	   end loop;
--	   for i in 0 to 31 loop
--	      test_data_compl(i) <= crc(31-i);
--	   end loop;

      rx_en <= '1';
		gmii_rx.rx_er <= '0';
		fcs <= (others=>'1');
		
		for k in 0 to 7 loop
		   gmii_rx.RXD <= X"55";
			wait for clk_period;
		end loop;
		
		gmii_rx.RXD <= X"D5";
		wait for clk_period;
		
		gmii_rx.rx_dv <= '1';
		
		run := 1;
		j   := frame_bits-1;
		while run = 1 loop
			gmii_rx.RXD <= test_data_compl(j downto j-7);
			
			fcs <= nextCRC32_D8(test_data_compl(j downto j-7), fcs);
			

			
			j := j-8;
			
			
			if j = -1 then
			   run := 0;
			end if;
			wait for clk_period;
		end loop;
		
		gmii_rx.rx_dv <= '0';
		rx_en <= '0';
		fcs        <= (others=>'1');
		
		wait for clk_period*5;
		
		-- ############################################################### --
		-- ###                     END OLD STUFF                       ### --
		-- ############################################################### --
		
		
		-- ############################################################### --
		-- ###                      FRAME: 000                         ### --
		-- ############################################################### --
		------------------------------
      --      Konfigurations      --
		------------------------------
		-- Preamble
	   cnt_preamble        := 7;
		-- Frame Delimiter
	   cnt_frame_delimiter := 1;
		-- Source-Address
	   cnt_src_addr        := -1;
	   src_addr            := (X"02", X"AA", X"AA", X"AA", X"AA", X"AA");
		-- Destination-Address
	   cnt_dst_addr        := -1;
	   dst_addr            := (X"FF", X"FF", X"FF", X"FF", X"FF", X"FF");
		-- Type- /Length-Field
	   cnt_type_length     := -1;
	   type_length         := (X"08", X"00");
		-- Data
	   cnt_data            := 46;
		-- FCS
	   cnt_fcs             := 4;
		-- something
		cnt_something       := 10;
		-- RX_ER
	   rx_er_vec           := (others=>-1);
		-- RX_DV
	   rx_dv_start_index   := 8;
	   rx_dv_end_index     := 71;
	   rx_dv_vec           := (others=>-1);
	
		
      ---------------------------------
      --      calculate indexes      --
		---------------------------------
      start_fd_index          := cnt_preamble;
	   start_dst_addr_index    := start_fd_index + cnt_frame_delimiter;
		if cnt_dst_addr = -1 then
		   start_src_addr_index    := start_dst_addr_index + 6;
		   --start_type_length_index := start_dst_addr_index + 6;
		else
		   start_src_addr_index    := start_dst_addr_index + cnt_dst_addr;
		   --start_type_length_index := start_dst_addr_index + cnt_dst_addr;
		end if;
		if cnt_src_addr = -1 then
	      start_type_length_index    := start_src_addr_index + 6;
		else
		   start_type_length_index    := start_src_addr_index + cnt_src_addr;
		end if;
		if cnt_type_length = -1 then
		   start_data_index        := start_type_length_index + 2;
		else
	      start_data_index        := start_type_length_index + cnt_type_length;
		end if;
	   start_fcs_index         := start_data_index + cnt_data;
	   end_frame_index  := start_fcs_index + cnt_fcs - 1;
		end_index := end_frame_index + cnt_something;
		
		---------------------------------
      --       Static Signals        --
		---------------------------------
		rx_en <= '1';
		
		
		---------------------------------
      --       generate frame        --
		---------------------------------
		for k in 0 to end_index loop
		   ---------------------
         --      RX_DV      --
		   ---------------------
			-- search for index k in rx_dv_vec
			for j in 0 to cnt_rx_dv-1 loop
			   if rx_dv_vec(j) = k then
				   rx_dv_found := true;
				else
				   rx_dv_found := false;
				end if;
			end loop;
			-- if rx_er_vec contains index k, rx_dv = '1'
			if k >= rx_dv_start_index and k <= rx_dv_end_index and rx_dv_found = false then
			   gmii_rx.RX_DV <= '1';
			else
			   gmii_rx.RX_DV <= '0';
			end if;
			---------------------
         --      RX_ER      --
		   ---------------------
			-- search for index k in rx_er_vec
			for j in 0 to cnt_rx_er-1 loop
			   if rx_er_vec(j) = k then
				   rx_er_found := true;
				else
				   rx_er_found := false;
				end if;
			end loop;
			-- if rx_er_vec contains index k, rx_er = '1'
			if rx_er_found = true then
			   gmii_rx.RX_ER <= '1';
			else
			   gmii_rx.RX_ER <= '0';
			end if;
			------------------------
         --      Preamble      --
		   ------------------------
		   if k >= 0 and k < start_fd_index then
			   -- reset local_index when entering section
			   if k = 0 then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
			   rxd := X"55";
				
				frame_info <= FRAME_INFO_PREAMBLE;
				
			-----------------------------
         --  Start-Frame Delimiter  --
		   -----------------------------
		   elsif  k < start_dst_addr_index then
			   -- reset local_index when entering section
			   if k = start_fd_index then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
			   rxd := X"D5";
				
				frame_info <= FRAME_INFO_FRAME_DELIMITER;
				
			-----------------------------
         --   Destination-Address   --
		   -----------------------------
		   elsif  k < start_src_addr_index then
			   -- reset local_index when entering section
			   if k = start_dst_addr_index then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
				if cnt_dst_addr = -1 then
				   rxd := dst_addr(local_index);
				else
				   rxd := std_logic_vector(to_unsigned(local_index, 8));
				end if;
				
				frame_info <= FRAME_INFO_DST_ADDR;
				
				
			------------------------
         --   Source-Address   --
		   ------------------------
		   elsif  k < start_type_length_index then
			   -- reset local_index when entering section
			   if k = start_src_addr_index then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
				if cnt_src_addr = -1 then
				   rxd := src_addr(local_index);
				else
				   rxd := std_logic_vector(to_unsigned(local_index, 8));
				end if;
				
				frame_info <= FRAME_INFO_SRC_ADDR;
			
			
			-------------------------------
         --   Type- / Length- field   --
		   -------------------------------
		   elsif  k < start_data_index then
			   -- reset local_index when entering section
			   if k = start_type_length_index then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
				if cnt_type_length = -1 then
				   rxd := type_length(local_index);
				else
				   rxd := std_logic_vector(to_unsigned(local_index, 8));
				end if;
				
				frame_info <= FRAME_INFO_T_L;
			
         ---------------------------
         --         Data          --
		   ---------------------------
		   elsif  k < start_fcs_index then
			   -- reset local_index when entering section
			   if k = start_data_index then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;

				rxd := std_logic_vector(to_unsigned(local_index, 8));
				
				frame_info <= FRAME_INFO_DATA;
		   
			---------------------
         --       FCS       --
		   ---------------------
		   elsif  k <= end_frame_index then
			   -- reset local_index when entering section
			   if k = start_fcs_index then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
				if local_index = 0 then
					rxd := not reversed(fcs(31 downto 24));
				elsif local_index = 1 then
				   rxd := not reversed(fcs(23 downto 16));
				elsif local_index = 2 then	
					rxd := not reversed(fcs(15 downto 8));
				elsif local_index = 3 then
					rxd := not reversed(fcs(7 downto 0));
				else
				   rxd := X"ab";
				end if;
				
				frame_info <= FRAME_INFO_FCS;
				
			-------------------------
         --     SOMETHING       --
		   -------------------------
			elsif  k <= end_index then
			   -- reset local_index when entering section
			   if k = end_frame_index + 1 then
				   local_index := 0;
				else
				   local_index := local_index + 1;
				end if;
				
				rxd := std_logic_vector(to_unsigned(local_index, 8));
				
				frame_info <= FRAME_INFO_SOMETHING;
				
			end if;
			---------------------
         --  calculate FCS  --
		   ---------------------
			if k >= start_dst_addr_index and k < start_fcs_index then
			   fcs <= nextCRC32_D8(rxd, fcs);
			end if;
			
			
			
			
			gmii_rx.RXD <= rxd;

			index_info <= std_logic_vector(to_unsigned(k, 16));
			
		   wait for clk_period;
		end loop;
		
		-------------------------------
      --      reset variables      --
		-------------------------------
		fcs        <= (others=>'1');
		frame_info <= FRAME_INFO_NO_FRAME;
		wait for clk_period*5;

		-- ############################################################### --
		-- ###                     END FRAME: 000                      ### --
		-- ############################################################### --
      
      wait;
   end process;

END;