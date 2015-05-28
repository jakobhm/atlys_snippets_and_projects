----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:59 04/16/2015 
-- Design Name: 
-- Module Name:    btnDebounceExamples - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 1.00 - functional test successful with btnDebounce Rev1.00
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity btnDebounceExamples is
end btnDebounceExamples;

architecture Behavioral of btnDebounceExamples is

   --###############################--
   --###        CONSTANTS         ##--
   --###############################--


   --###############################--
   --###        COMPONENTS        ##--
   --###############################--

   component btnDebounce
      Port ( BTN_I : in  STD_LOGIC_VECTOR (4 downto 0);
             RESET_I : in std_logic;
             CLK : in  STD_LOGIC;
             BTN_O : out  STD_LOGIC_VECTOR (4 downto 0);
             RESET_O : out std_logic);
   end component;

   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
   ------ btnDebounce ------
   signal btnDebounce_btn    : std_logic_vector(7 downto 0);
   signal btnDebounce_reset  : std_logic;
   
   signal clk                 : std_logic;

begin
   --###############################--
   --###   PORT- / GENERIC- MAP   ##--
   --###############################--
   btnDebounceComp : btnDebounce
   port map ( BTN_I    => ,
              RESET_I  => ,
              CLK      => clk,
              BTN_O    => btnDebounce_btn,
              RESET_O  => btnDebounce_reset);

end Behavioral;