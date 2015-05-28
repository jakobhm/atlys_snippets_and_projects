--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:56:12 05/21/2015
-- Design Name:   
-- Module Name:   C:/Users/Jakob Wittmann/Dropbox/ISE_Projects/tx_test_byte_to_pc_debug/frame_grabber_ethernet_tb.vhd
-- Project Name:  tx_test_byte_to_pc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: frameGrabberEthernetTB
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
use work.ipv4_types.all;
use work.axi.all;
use work.frameGrabberEthernetTB_TYPES.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY frameGrabberEthernetTB IS
END frameGrabberEthernetTB;
 
ARCHITECTURE behavior OF frameGrabberEthernetTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT frameGrabberEthernet
	 generic(
	      -- model config
	      useParallelRead        : boolean := true;
			-- ram config
			seq_read_byte_cnt      : integer := seq_read_byte_cnt;
			parallel_read_byte_cnt : integer := parallel_read_byte_cnt;
			ram_addr_width         : integer := ram_addr_width;
			-- udp config
			udp_dst_ip_addr        : std_logic_vector(31 downto 0) := X"FFFFFFFF";
			udp_dst_port           : std_logic_vector(15 downto 0) := X"FFFF";
			udp_src_port           : std_logic_vector(15 downto 0) := X"FFFF";
			udp_checksum           : std_logic_vector(15 downto 0) := X"0000");
    PORT(
         areset                 : IN  std_logic;
         clk_en                 : IN  std_logic;
         clk                    : IN  std_logic;
         d_parallel_in          : IN  std_logic_vector(parallel_read_byte_cnt*8 - 1 downto 0);
         d_seq_in               : IN  std_logic_vector(7 downto 0);
         dv                     : IN  std_logic;
         udp_tx_start           : OUT  std_logic;
         udp_txi                : OUT  udp_tx_type;
         udp_tx_result          : IN  std_logic_vector(1 downto 0);
         udp_tx_data_out_ready  : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal areset : std_logic := '0';
   signal clk_en : std_logic := '0';
   signal clk : std_logic := '0';
   signal d_parallel_in : std_logic_vector(parallel_read_byte_cnt*8 - 1 downto 0) := (others => '0');
   signal d_seq_in : std_logic_vector(7 downto 0) := (others => '0');
   signal dv : std_logic := '0';
   signal udp_tx_result : std_logic_vector(1 downto 0) := (others => '0');
   signal udp_tx_data_out_ready : std_logic := '0';

 	--Outputs
   signal udp_tx_start : std_logic;
   signal udp_txi : udp_tx_type;

   -- Clock period definitions
   constant clk_en_period : time := 10 ns;
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: frameGrabberEthernet
	   generic map(
		   -- model config
			useParallelRead        => false,
			-- ram config
			seq_read_byte_cnt      => seq_read_byte_cnt,
			parallel_read_byte_cnt => parallel_read_byte_cnt,
			ram_addr_width         => ram_addr_width,
			-- udp config
			udp_dst_ip_addr        => X"00010203",
			udp_dst_port           => X"0405",
			udp_src_port           => X"0607",
			udp_checksum           => X"0809")
		PORT MAP (
          areset => areset,
          clk_en => clk_en,
          clk => clk,
          d_parallel_in => d_parallel_in,
          d_seq_in => d_seq_in,
          dv => dv,
          udp_tx_start => udp_tx_start,
          udp_txi => udp_txi,
          udp_tx_result => udp_tx_result,
          udp_tx_data_out_ready => udp_tx_data_out_ready
        );

   -- Clock process definitions 
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	   constant parallel_data : std_logic_vector((parallel_read_byte_cnt*8)-1 downto 0) := (others=>'0');
   begin		
      areset <= '1';
      wait for 100 ns;
      areset <= '0';
		clk_en <= '1';

      wait for clk_en_period*10;
		
		--###################################--
		--###            BEGIN            ###--
		--###################################--
		
		for k in 0 to parallel_read_byte_cnt-1 loop
		   d_parallel_in(((k+1)*8)-1 downto k*8) <= std_logic_vector(to_unsigned(k,8));
		end loop;
		
		dv <= '1';
		for k in 0 to seq_read_byte_cnt-1 loop
		   d_seq_in <= std_logic_vector(to_unsigned(k,8));
			wait for clk_period;
      end loop;
		d_seq_in <= (others=>'0');
		dv <= '0';
		
		wait for clk_period*4;
		udp_tx_data_out_ready <= '1';
		wait for clk_period;
		udp_tx_data_out_ready <= '0';
		d_parallel_in <= (others=>'0');
		
		wait for clk_period*10;
		
      wait;
   end process;

END;
