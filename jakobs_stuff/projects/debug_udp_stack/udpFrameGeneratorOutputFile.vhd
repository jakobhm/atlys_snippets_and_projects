library IEEE;
use IEEE.STD_LOGIC_1164.all;

package udpFrameGeneratorOutputFile is

	constant mac_vec_length : integer := 48;
	constant frame_vec_length : integer := 64;
	subtype mac_vec_type is std_logic_vector(mac_vec_length-1 downto 0);
	constant mac_dst_vec : mac_vec_type := X"ffffffffffff";
	constant mac_src_vec : mac_vec_type := X"701a04d18f12";
	subtype byte is std_logic_vector(7 downto 0);
	type frame_vec_t is array (0 to 63) of byte;
	constant frame_vec : frame_vec_t  := (x"ff", x"ff", x"ff", x"ff", x"ff", x"ff", x"70", x"1a", x"04", x"d1", x"8f", x"12", x"08", x"00", x"45", x"00", x"00", x"1d", x"f6", x"1f", x"40", x"00", x"40", x"11", x"d1", x"e9", x"c0", x"a8", x"b2", x"1e", x"ff", x"ff", x"ff", x"ff", x"44", x"5c", x"aa", x"aa", x"00", x"09", x"00", x"00", x"01", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"53", x"1e", x"10", x"66");

end udpFrameGeneratorOutputFile;
