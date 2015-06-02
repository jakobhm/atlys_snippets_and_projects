----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:17 05/28/2015 
-- Design Name: 
-- Module Name:    atlysWrapperDebugUDPStack - Behavioral 
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
use work.axi.all;
use work.ipv4_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity atlysWrapperDebugUDPStack is
   PORT(
	   -- IOs
		BTN               : in std_logic_vector(5 downto 0);
		SW                : in std_logic_vector(7 downto 0);
		LED               : out std_logic_vector(7 downto 0);
		
		-- Ethernet Mac
		phyrst            : OUT std_logic;
      phytxclk          : in std_logic;
 
      phyTXD            : OUT  std_logic_vector(7 downto 0);
		phytxen           : OUT  std_logic; 
      phytxer           : OUT  std_logic;
		phygtxclk         : out std_logic;
 
		phyRXD				: in std_logic_vector(7 downto 0);
 
		phyrxdv				: in std_logic;
		phyrxer				: in std_logic;
		phyrxclk				: in STD_LOGIC;
		
      phymdc            : out std_logic;
      phymdi            : inout std_logic;
      phyint            : in std_logic;
      
      -- serial interface to arduino-board
		serial_txd_out    : out std_logic_vector(3 downto 0);
		serial_clk_out    : out std_logic;
		serial_en_out     : out std_logic
      );
end atlysWrapperDebugUDPStack;

architecture Behavioral of atlysWrapperDebugUDPStack is

   --################################--
   --###   CONSTANTS DEFINITIONS   ##--
   --################################--
   ------ frameGrabberEthernet ------
	constant useParallelRead_const     : boolean := false;
   constant seqReadByteCnt_const      : integer := 2048;
   constant parallelReadByteCnt_const : integer := 11;
   constant ramAddrWidth_const        : integer := 14;
   constant udpDstIpAddr_const        : std_logic_vector(31 downto 0) := X"0A1BC05A";
   constant udpDstPort_const          : std_logic_vector(15 downto 0) := X"0102";
   constant udpSrcPort_const          : std_logic_vector(15 downto 0) := X"0304";
   constant udpChecksum_const         : std_logic_vector(15 downto 0) := X"0000";
   
   ------ generateDataAndRepeat ------
   constant generatePreamble_const  : boolean := true;
   constant inputClkHz_const        : integer := 125000000;
	constant repeatTimeMS_const      : integer := 1;

   --#################################--
   --###   COMPONENT DECLARATIONS   ##--
   --#################################--

   component btnDebounce
      Port ( BTN_I : in  STD_LOGIC_VECTOR (4 downto 0);
             RESET_I : in std_logic;
             CLK : in  STD_LOGIC;
             BTN_O : out  STD_LOGIC_VECTOR (4 downto 0);
             RESET_O : out std_logic);
   end component;
	
   component swDebounce
    Port ( SW_I : in   std_logic_vector (7 downto 0);
           CLK  : in   std_logic;
           SW_O : out  std_logic_vector (7 downto 0));
   end component;
	
   component frameGrabberEthernet
   generic(
      -- model config
      useParallelRead         : boolean;
      -- ram config
      seq_read_byte_cnt       : integer;
      parallel_read_byte_cnt  : integer;
      ram_addr_width          : integer;
      -- udp config
      udp_dst_ip_addr         : std_logic_vector(31 downto 0);
      udp_dst_port            : std_logic_vector(15 downto 0);
      udp_src_port            : std_logic_vector(15 downto 0);
      udp_checksum            : std_logic_vector(15 downto 0));
   port(
      areset                  : IN  std_logic;
      clk_en                  : IN  std_logic;
      clk                     : IN  std_logic;
      d_parallel_in           : IN  std_logic_vector(parallelReadByteCnt_const*8-1 downto 0);
      d_seq_in                : IN  std_logic_vector(7 downto 0);
      dv                      : IN  std_logic;
      udp_tx_start            : OUT  std_logic;
      udp_txi                 : OUT  udp_tx_type;
      udp_tx_result           : IN  std_logic_vector(1 downto 0);
      udp_tx_data_out_ready   : IN  std_logic
      );
   end component;
   
   component generateDataAndRepeat
   generic(
      generatePreamble  : boolean;
      inputClkHz        : integer;
	   repeatTimeMS      : integer
      );
   port(
      areset            : in  std_logic;
      clk               : in  std_logic;
      data              : out std_logic_vector(7 downto 0);
      dv                : out std_logic
      );
   end component;
   
	component buffer_and_send_to_arduino
	port(
	   clk                  : in std_logic;
	   reset                : in std_logic;
	   start                : in std_logic;
		-- data interface
		d_in                 : in std_logic_vector(7 downto 0);
		dv                   : in std_logic;
		-- arduino interface
		serial_txd_out       : out std_logic_vector(3 downto 0);
		serial_en_out        : out std_logic;
		serial_clk_out       : out std_logic);
	end component;
	
   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
	------ inputs ------
	signal input_btn          : std_logic_vector(5 downto 0);
	signal input_sw           : std_logic_vector(7 downto 0);
   signal input_phytxclk     : std_logic;
	signal input_phyRXD		  : std_logic_vector(7 downto 0);
   signal input_phyrxdv		  : std_logic;
	signal input_phyrxer		  : std_logic;
	signal input_phyrxclk	  : std_logic;
	signal input_phymdi       : std_logic;
   signal input_phyint       : std_logic;
	
	------ outputs ------
	signal output_led         : std_logic_vector(7 downto 0);
	signal output_phyrst      : std_logic;
   signal output_phytxer     : std_logic;
   signal output_phyTXD      : std_logic_vector(7 downto 0);
	signal output_phytxen     : std_logic;
	signal output_phygtxclk   : std_logic;
	signal output_phymdc      : std_logic;
   --- serial arduino
   signal output_serialTxdOut  : std_logic_vector(3 downto 0);
	signal output_serialClkOut  : std_logic;
	signal output_serialEnOut   : std_logic;
	
	------ btnDebounce ------
	signal btnDebounce_btn    : std_logic_vector(4 downto 0);
   signal btnDebounce_reset  : std_logic;
	
	------ swDebounce ------
   signal swDebounce_sw      : std_logic_vector(7 downto 0);
	
   ------ frameGrabberEthernet ------
   signal frameGrabberEthernet_udpTxStart          : std_logic;
   signal frameGrabberEthernet_udpTxi              : udp_tx_type;
   
   ------ generateDataAndRepeat ------
   signal generateDataAndRepeat_data    : std_logic_vector(7 downto 0);
   signal generateDataAndRepeat_dv      : std_logic;
   
   ------ bufferAndSendToArduino ------
   signal bufferAndSendToArduino_serialTxdOut  : std_logic_vector(3 downto 0);
	signal bufferAndSendToArduino_serialEnOut   : std_logic;
	signal bufferAndSendToArduino_serialClkOut  : std_logic;
	
	------ system ------
	signal system_clk         : std_logic;
	signal system_areset      : std_logic;

begin

   --##################################--
   --###   COMPONENT INSTANTIATION   ##--
   --##################################--
   btnDebounceComp : btnDebounce
   port map ( BTN_I    => input_btn(5 downto 1),
              RESET_I  => input_btn(0),
              CLK      => system_clk,
              BTN_O    => btnDebounce_btn,
              RESET_O  => btnDebounce_reset);
				  
	swDebounceComp : swDebounce
   Port map ( SW_I    => input_sw,
              CLK     => system_clk,
              SW_O    => swDebounce_sw);
				  
   frameGrabberEthernetComp : frameGrabberEthernet
   generic map(
      -- model config
      useParallelRead        => useParallelRead_const,
	   -- ram config
      seq_read_byte_cnt      => seqReadByteCnt_const,
      parallel_read_byte_cnt => parallelReadByteCnt_const,
      ram_addr_width         => ramAddrWidth_const,
      -- udp config
      udp_dst_ip_addr        => udpDstIpAddr_const,
      udp_dst_port           => udpDstPort_const,
      udp_src_port           => udpSrcPort_const,
      udp_checksum           => udpChecksum_const)
   port map (
      areset                 => system_areset,
      clk_en                 => '1',
      clk                    => system_clk,
      d_parallel_in          => (others=>'0'),
      d_seq_in               => generateDataAndRepeat_data,--input_phyRXD,
      dv                     => generateDataAndRepeat_dv,--input_phyrxdv,
      udp_tx_start           => frameGrabberEthernet_udpTxStart,
      udp_txi                => frameGrabberEthernet_udpTxi,
      udp_tx_result          => (others=>'0'),
      udp_tx_data_out_ready  => '1'
      );
      
   generateDataAndRepeat_comp: generateDataAndRepeat
   generic map(
      generatePreamble => generatePreamble_const,
      inputClkHz       => inputClkHz_const,
      repeatTimeMS     => repeatTimeMS_const
      )
   port map(
      areset           => system_areset,
      clk              => system_clk,
      data             => generateDataAndRepeat_data,
      dv               => generateDataAndRepeat_dv
      );
      
   bufferAndSendToArduino_comp : buffer_and_send_to_arduino
	port map(
	   clk            => system_clk,
	   reset          => system_areset,
	   start          => btnDebounce_btn(4), -- center
      -- data interface
	   d_in           => input_phyRXD,--output_phyTXD,
	   dv             => input_phyrxdv,--output_phytxen,
	   -- arduino interface
	   serial_txd_out => bufferAndSendToArduino_serialTxdOut,
	   serial_en_out  => bufferAndSendToArduino_serialEnOut,
	   serial_clk_out => bufferAndSendToArduino_serialClkOut);
				  
	--################################--
   --###   PARALLEL ASSIGNEMENTS   ##--
   --################################--
	
	output_led(0) <= btnDebounce_btn(4);
   output_led(7 downto 1) <= (others=>'0');
	
	-- redirect RX-phy-data to TX-phy-output
--	output_phyTXD    <= frameGrabberEthernet_udpTxi.data.data_out;
--	output_phytxen   <= frameGrabberEthernet_udpTxi.data.data_out_valid;
	output_phytxer   <= '0';
	output_phygtxclk <= input_phyrxclk;
	output_phyrst    <= '1';
   
   ------ generateDataAndRepeat ------
   output_phyTXD   <= generateDataAndRepeat_data;
   output_phytxen  <= generateDataAndRepeat_dv;

   ------  ------
   output_serialTxdOut <= bufferAndSendToArduino_serialTxdOut;
	output_serialEnOut  <= bufferAndSendToArduino_serialEnOut;
	output_serialClkOut <= bufferAndSendToArduino_serialClkOut;
	
	------ system ------
	system_clk      <= input_phyrxclk;
	system_areset   <= not btnDebounce_reset;
	
	------ inputs ------
	input_btn       <= btn;
	input_sw        <= sw;
   input_phytxclk  <= phytxclk;
	input_phyRXD    <= phyRXD;
   input_phyrxdv   <= phyrxdv;
	input_phyrxer   <= phyrxer;
	input_phyrxclk  <= phyrxclk;
	input_phymdi    <= phymdi;
   input_phyint    <= phyint;
	
	------ outputs ------
	led             <= output_led;
	phyrst          <= output_phyrst;
   phyTXD          <= output_phyTXD;
	phytxen         <= output_phytxen;
   phytxer         <= output_phytxer;
	phygtxclk       <= output_phygtxclk;
	phymdc          <= output_phymdc;
   -- arduino serial
   serial_txd_out  <= output_serialTxdOut;
   serial_en_out   <= output_serialEnOut;
   serial_clk_out  <= output_serialClkOut;

end Behavioral;

