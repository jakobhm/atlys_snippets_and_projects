library IEEE;
use IEEE.STD_LOGIC_1164.all;

package udpFrameGeneratorOutputFile is

	constant mac_vec_length : integer := 48;
   constant frame_vec_length : integer := 64;
   subtype mac_vec_type is std_logic_vector(mac_vec_length-1 downto 0);
   constant mac_dst_vec : mac_vec_type := X"001999d164b2";
   constant mac_src_vec : mac_vec_type := X"02aaaaaaaaaa";
   subtype byte is std_logic_vector(7 downto 0);
   type frame_vec_t is array (0 to 63) of byte;
   constant frame_vec : frame_vec_t  := (x"00", x"19", x"99", x"d1", x"64", x"b2", x"02", x"aa", x"aa", x"aa", x"aa", x"aa", x"08", x"00", x"45", x"00", x"00", x"1d", x"f6", x"1f", x"40", x"00", x"40", x"11", x"57", x"eb", x"c0", x"a8", x"b2", x"1e", x"a9", x"fe", x"cf", x"ff", x"2b", x"67", x"56", x"ce", x"00", x"09", x"00", x"00", x"01", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"90", x"f2", x"cb", x"49");

end udpFrameGeneratorOutputFile;
