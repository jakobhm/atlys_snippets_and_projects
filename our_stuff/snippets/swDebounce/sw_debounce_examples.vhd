----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:59 04/16/2015 
-- Design Name: 
-- Module Name:    swDebounceExamples - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 1.00 - functional test succesful
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity swDebounceExamples is
end swDebounceExamples;

architecture Behavioral of swDebounceExamples is
   --###############################--
   --###        CONSTANTS         ##--
   --###############################--


   --###############################--
   --###        COMPONENTS        ##--
   --###############################--

   component swDebounce
    Port ( SW_I : in   std_logic_vector (7 downto 0);
           CLK  : in   std_logic;
           SW_O : out  std_logic_vector (7 downto 0));
   end component;

   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
   ------ swDebounce ------
   signal swDebounce_aw      : std_logic_vector(7 downto 0);
   
   ------ system ------
   signal clk                : std_logic;

begin
   --###############################--
   --###   PORT- / GENERIC- MAP   ##--
   --###############################--
   swDebounceComp : swDebounce
   Port map ( SW_I    => ,
              CLK     => clk,
              SW_O    => swDebounce_sw);

end Behavioral;