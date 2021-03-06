----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:58:59 05/28/2015 
-- Design Name: 
-- Module Name:    frameGrabberEthernetExamples - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 1.00 - functional test successful with frameGrabberEthernet Rev1.00
-- Revision 1.01 - updated changes in frameGrabberEthernet Rev1.01
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use work.axi.all;
use work.ipv4_types.all;

entity frameGrabberEthernetExamples is
end frameGrabberEthernetExamples;

architecture Behavioral of frameGrabberEthernetExamples is

   --###############################--
   --###        CONSTANTS         ##--
   --###############################--
   ------ frameGrabberEthernet ------
   constant useParallelRead_const     : boolean := true;
   constant seqReadByteCnt_const      : integer := 2048;
   constant parallelReadByteCnt_const : integer := 11;
   constant ramAddrWidth_const        : integer := 14;
   constant udpDstIpAddr_const        : std_logic_vector(31 downto 0) := X"0A1BC05A";
   constant udpDstPort_const          : std_logic_vector(15 downto 0) := X"0102";
   constant udpSrcPort_const          : std_logic_vector(15 downto 0) := X"0304";
   constant udpChecksum_const         : std_logic_vector(15 downto 0) := X"0000";

   --###############################--
   --###        COMPONENTS        ##--
   --###############################--

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

   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
   ------ frameGrabberEthernet ------
   signal frameGrabberEthernet_udpTxStart          : std_logic;
   signal frameGrabberEthernet_udpTxi              : udp_tx_type;
   
   ------ system ------
   signal system_clk                               : std_logic;
   signal system_areset                            : std_logic;

begin
   --###############################--
   --###   PORT- / GENERIC- MAP   ##--
   --###############################--
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
      clk_en                 => ,
      clk                    => system_clk,
      d_parallel_in          => ,
      d_seq_in               => ,
      dv                     => ,
      udp_tx_start           => frameGrabberEthernet_udpTxStart,
      udp_txi                => frameGrabberEthernet_udpTxi,
      udp_tx_result          => ,
      udp_tx_data_out_ready  => 
      );
      
   --################################--
   --###   PARALLEL ASSIGNEMENTS   ##--
   --################################--

   <= frameGrabberEthernet_udpTxi.hdr.dst_ip_addr; 		   -- STD_LOGIC_VECTOR (31 downto 0);
   <= frameGrabberEthernet_udpTxi.hdr.dst_port;             -- STD_LOGIC_VECTOR (15 downto 0);
   <= frameGrabberEthernet_udpTxi.hdr.src_port;             -- STD_LOGIC_VECTOR (15 downto 0);
   <= frameGrabberEthernet_udpTxi.hdr.data_length;          -- STD_LOGIC_VECTOR (15 downto 0);
   <= frameGrabberEthernet_udpTxi.hdr.checksum;             -- STD_LOGIC_VECTOR (15 downto 0);
   <= frameGrabberEthernet_udpTxi.data.data_out_valid;      -- std_logic;
   <= frameGrabberEthernet_udpTxi.data.data_out_last;       -- std_logic;
   <= frameGrabberEthernet_udpTxi.data.data_out;            -- std_logic_vector (7 downto 0);

end Behavioral;