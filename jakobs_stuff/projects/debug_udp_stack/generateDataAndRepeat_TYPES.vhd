----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:45 05/28/2015 
-- Design Name: 
-- Module Name:    generateDataAndRepeat_TYPES
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
use IEEE.STD_LOGIC_1164.all;

package generateDataAndRepeat_TYPES is

   function calcMaxValue
	   (clkHz    : integer;
		 periodMs : integer)
		 return integer;

   function calcRegWidth
	   (maxValue  : integer)
	   return integer;

end generateDataAndRepeat_TYPES;

package body generateDataAndRepeat_TYPES is

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
 
end generateDataAndRepeat_TYPES;
