--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package frame_grabber_ethernet_tb_types is

constant seq_read_byte_cnt      : integer := 2048;
constant parallel_read_byte_cnt : integer := 4;
constant ram_addr_width         : integer := 14;

end frame_grabber_ethernet_tb_types;