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

package generateDataAndRepeate_TYPES is

   function calcMaxValue
	   (clkHz    : integer;
		 periodMs : integer)
		 return integer;

   function calcRegWidth
	   (maxValue  : integer)
	   return integer;

end generateDataAndRepeate_TYPES;

package body generateDataAndRepeate_TYPES is

   function calcMaxValue
	   (clkHz    : integer;
		 periodMs : integer)
		 return integer is
	begin
	   return (clkHz/1000)*periodMs;
	end calcMaxValue;

   function calcRegWidth
	   (maxValue  : integer)
	   return integer is
	variable width : integer := 0;
	begin
	   while 2**width <= maxValue loop
		   width := width + 1;
		end loop;
		
		return width;
	end calcRegWidth;
 
end generateDataAndRepeate_TYPES;
