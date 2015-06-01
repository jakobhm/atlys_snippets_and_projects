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

package mac_tx_types is
	-- von Start-mac-Adresse bis einschliesslich CRC
	constant ETH_FRAME_MAX_LEN 		: integer := 1518;
	constant ETH_FRAME_MIN_LEN 		: integer := 64;
	constant SFD_POS						: integer :=  7;
	constant DATA_FIELD_POS				: integer := 22;
	
	constant GLOBAL_CTR_SIZE			: integer := 16+6;
	constant FLOCTRL_CHEK_VAL			: integer := 2**GLOBAL_CTR_SIZE-1;
	constant INTERFRAME_GAP_BITTIME 	: integer :=  2;
	
	constant CRC_INITIAL_VALUE			: std_logic_vector(31 downto 0) := x"ffffffff";
	
	type mac_tx_header_type is record
		dst_mac_addr 		: std_logic_vector(47 downto 0);
		src_mac_addr 		: std_logic_vector(47 downto 0);
		typ_len_field		: std_logic_vector(15 downto 0);
	end record;

		
-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
	function REVERSED(slv: std_logic_vector) 
		return std_logic_vector;
	function NEXTCRC32_D8(DATA: std_logic_vector(7 downto 0); CRC:  std_logic_vector(31 downto 0))
		return std_logic_vector;
	  
end mac_tx_types;

package body mac_tx_types is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
  -- Reverse the input vector.
  -- Fürs CRC im RX-Modus
  function REVERSED(slv: std_logic_vector) return std_logic_vector is
     variable result: std_logic_vector(slv'reverse_range);
  begin
     for i in slv'range loop
       result(i) := slv(i);
     end loop;
     return result;
  end REVERSED;
  
  
  function NEXTCRC32_D8
    (DATA: std_logic_vector(7 downto 0);
    CRC:  std_logic_vector(31 downto 0))
    return std_logic_vector is

    variable D:      std_logic_vector(7 downto 0);
    variable C:      std_logic_vector(31 downto 0);
    variable NEWCRC: std_logic_vector(31 downto 0);
    
  begin
    D := DATA;
    C := CRC;
    NewCRC(0):=C(24) xor C(30) xor D(1) xor D(7); 
    NewCRC(1):=C(25) xor C(31) xor D(0) xor D(6) xor C(24) xor C(30) xor D(1) 
               xor D(7);
    NewCRC(2):=C(26) xor D(5) xor C(25) xor C(31) xor D(0) xor D(6) xor C(24) 
               xor C(30) xor D(1) xor D(7);
    NewCRC(3):=C(27) xor D(4) xor C(26) xor D(5) xor C(25) xor C(31) xor D(0) 
               xor D(6);
    NewCRC(4):=C(28) xor D(3) xor C(27) xor D(4) xor C(26) xor D(5) xor C(24) 
              xor C(30) xor D(1) xor D(7);
    NewCRC(5):=C(29) xor D(2) xor C(28) xor D(3) xor C(27) xor D(4) xor C(25) 
              xor C(31) xor D(0) xor D(6) xor C(24) xor C(30) xor D(1) xor D(7);
    NewCRC(6):=C(30) xor D(1) xor C(29) xor D(2) xor C(28) xor D(3) xor C(26) 
              xor D(5) xor C(25) xor C(31) xor D(0) xor D(6);
    NewCRC(7):=C(31) xor D(0) xor C(29) xor D(2) xor C(27) xor D(4) xor C(26) 
              xor D(5) xor C(24) xor D(7);
    NewCRC(8):=C(0) xor C(28) xor D(3) xor C(27) xor D(4) xor C(25) xor D(6) 
              xor C(24) xor D(7);
    NewCRC(9):=C(1) xor C(29) xor D(2) xor C(28) xor D(3) xor C(26) xor D(5)
              xor C(25) xor D(6);
    NewCRC(10):=C(2) xor C(29) xor D(2) xor C(27) xor D(4) xor C(26) xor D(5) 
              xor C(24) xor D(7);
    NewCRC(11):=C(3) xor C(28) xor D(3) xor C(27) xor D(4) xor C(25) xor D(6) 
              xor C(24) xor D(7);
    NewCRC(12):=C(4) xor C(29) xor D(2) xor C(28) xor D(3) xor C(26) xor D(5) 
              xor C(25) xor D(6) xor C(24) xor C(30) xor D(1) xor D(7);
    NewCRC(13):=C(5) xor C(30) xor D(1) xor C(29) xor D(2) xor C(27) xor D(4) 
              xor C(26) xor D(5) xor C(25) xor C(31) xor D(0) xor D(6);
    NewCRC(14):=C(6) xor C(31) xor D(0) xor C(30) xor D(1) xor C(28) xor D(3) 
              xor C(27) xor D(4) xor C(26) xor D(5);
    NewCRC(15):=C(7) xor C(31) xor D(0) xor C(29) xor D(2) xor C(28) xor D(3) 
              xor C(27) xor D(4);
    NewCRC(16):=C(8) xor C(29) xor D(2) xor C(28) xor D(3) xor C(24) xor D(7);
    NewCRC(17):=C(9) xor C(30) xor D(1) xor C(29) xor D(2) xor C(25) xor D(6);
    NewCRC(18):=C(10) xor C(31) xor D(0) xor C(30) xor D(1) xor C(26) xor D(5);
    NewCRC(19):=C(11) xor C(31) xor D(0) xor C(27) xor D(4);
    NewCRC(20):=C(12) xor C(28) xor D(3);
    NewCRC(21):=C(13) xor C(29) xor D(2);
    NewCRC(22):=C(14) xor C(24) xor D(7);
    NewCRC(23):=C(15) xor C(25) xor D(6) xor C(24) xor C(30) xor D(1) xor D(7);
    NewCRC(24):=C(16) xor C(26) xor D(5) xor C(25) xor C(31) xor D(0) xor D(6);
    NewCRC(25):=C(17) xor C(27) xor D(4) xor C(26) xor D(5);
    NewCRC(26):=C(18) xor C(28) xor D(3) xor C(27) xor D(4) xor C(24) xor C(30) 
              xor D(1) xor D(7);
    NewCRC(27):=C(19) xor C(29) xor D(2) xor C(28) xor D(3) xor C(25) xor C(31) 
              xor D(0) xor D(6);
    NewCRC(28):=C(20) xor C(30) xor D(1) xor C(29) xor D(2) xor C(26) xor D(5);
    NewCRC(29):=C(21) xor C(31) xor D(0) xor C(30) xor D(1) xor C(27) xor D(4);
    NewCRC(30):=C(22) xor C(31) xor D(0) xor C(28) xor D(3);
    NewCRC(31):=C(23) xor C(29) xor D(2);

    return NEWCRC;
  end NEXTCRC32_D8;
 
end mac_tx_types;
