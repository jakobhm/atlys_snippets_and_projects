----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:48:01 05/29/2015 
-- Design Name: 
-- Module Name:    BRAMExample - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BRAMExample is
end BRAMExample;

architecture Behavioral of BRAMExample is


   --###############################--
   --###        CONSTANTS         ##--
   --###############################--
   ------ BRAM ------
   constant bram_addrWidth_const   : positive := 16;
   constant bram_wordWidth_const   : positive := 8;
   constant bram_cntRows_const     : positive := 256;

   --###############################--
   --###        COMPONENTS        ##--
   --###############################--
   
   component BRAM
   generic(
      addrWidth_gen   : positive;
      wordWidth_gen   : positive;
      cntRows_gen     : positive);
   port(
      clk             : in std_logic;
      en              : in std_logic;
		we              : in std_logic;
		addr            : in std_logic_vector(bram_addrWidth_const-1 downto 0);
		din             : in std_logic_vector(bram_wordWidth_const-1 downto 0);
		dout            : out std_logic_vector(bram_wordWidth_const-1 downto 0));
   end component;

   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
   ------ BRAM ------
   signal bram_dout       : std_logic_vector(bram_wordWidth_const-1 downto 0);

   ------ system ------
   signal system_clk                 : std_logic;

begin
   --###############################--
   --###   PORT- / GENERIC- MAP   ##--
   --###############################--
   BRAM_comp : BRAM
   generic map(
      addrWidth_gen   => bram_addrWidth_const,
      wordWidth_gen   => bram_wordWidth_const,
      cntRows_gen     => bram_cntRows_const)
   port map(
      clk             => system_clk,
      en              => ,
		we              => ,
		addr            => ,
		din             => ,
		dout            => bram_dout);

end Behavioral;

