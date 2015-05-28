----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:17 05/28/2015 
-- Design Name: 
-- Module Name:    atlysWrapperBasic - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 1.00 - functional test successful
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity atlysWrapperBasic is
   PORT(
	   -- IOs
		BTN               : in std_logic_vector(5 downto 0);
		SW                : in std_logic_vector(7 downto 0);
		LED               : out std_logic_vector(7 downto 0);
		
		-- Ethernet Mac
		phyrst            : OUT std_logic;
      phytxclk          : out std_logic;
 
      phyTXD            : OUT  std_logic_vector(7 downto 0);
		phytxen           : OUT  std_logic; 
      phytxer           : OUT  std_logic;
		phygtxclk         : out std_logic;
 
		phyRXD				: in std_logic_vector(7 downto 0);
 
		phyrxdv				: in std_logic;
		phyrxer				: in std_logic;
		phyrxclk				: in STD_LOGIC;
		
      phymdc            : out std_logic;
      phymdi            : inout std_logic;
      phyint            : in std_logic
      );
end atlysWrapperBasic;

architecture Behavioral of atlysWrapperBasic is

   --################################--
   --###   CONSTANTS DEFINITIONS   ##--
   --################################--


   --#################################--
   --###   COMPONENT DECLARATIONS   ##--
   --#################################--

   component btnDebounce
      Port ( BTN_I : in  STD_LOGIC_VECTOR (4 downto 0);
             RESET_I : in std_logic;
             CLK : in  STD_LOGIC;
             BTN_O : out  STD_LOGIC_VECTOR (4 downto 0);
             RESET_O : out std_logic);
   end component;
	
   component swDebounce
    Port ( SW_I : in   std_logic_vector (7 downto 0);
           CLK  : in   std_logic;
           SW_O : out  std_logic_vector (7 downto 0));
   end component;
	
   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
	------ inputs ------
	signal input_btn          : std_logic_vector(5 downto 0);
	signal input_sw           : std_logic_vector(7 downto 0);
	signal input_phyRXD		  : std_logic_vector(7 downto 0);
   signal input_phyrxdv		  : std_logic;
	signal input_phyrxer		  : std_logic;
	signal input_phyrxclk	  : std_logic;
	signal input_phymdi       : std_logic;
   signal input_phyint       : std_logic;
	
	------ outputs ------
	signal output_led         : std_logic_vector(7 downto 0);
	signal output_phyrst      : std_logic;
   signal output_phytxclk    : std_logic;
   signal output_phyTXD      : std_logic_vector(7 downto 0);
	signal output_phytxen     : std_logic;
   signal output_phytxer     : std_logic;
	signal output_phygtxclk   : std_logic;
	signal output_phymdc      : std_logic;
	
	------ btnDebounce ------
	signal btnDebounce_btn    : std_logic_vector(4 downto 0);
   signal btnDebounce_reset  : std_logic;
	
	------ swDebounce ------
   signal swDebounce_sw      : std_logic_vector(7 downto 0);
	
	------ system ------
	signal system_clk         : std_logic;

begin

   --##################################--
   --###   COMPONENT INSTANTIATION   ##--
   --##################################--
   btnDebounceComp : btnDebounce
   port map ( BTN_I    => input_btn(5 downto 1),
              RESET_I  => input_btn(0),
              CLK      => system_clk,
              BTN_O    => btnDebounce_btn,
              RESET_O  => btnDebounce_reset);
				  
	swDebounceComp : swDebounce
   Port map ( SW_I    => input_sw,
              CLK     => system_clk,
              SW_O    => swDebounce_sw);
				  
	--################################--
   --###   PARALLEL ASSIGNEMENTS   ##--
   --################################--
	
	output_led <= swDebounce_sw;
	
	------ system ------
	system_clk      <= input_phyrxclk;
	output_phyrst   <= '1';
	
	------ inputs ------
	input_btn       <= btn;
	input_sw        <= sw;
	input_phyRXD    <= phyRXD;
   input_phyrxdv   <= phyrxdv;
	input_phyrxer   <= phyrxer;
	input_phyrxclk  <= phyrxclk;
	input_phymdi    <= phymdi;
   input_phyint    <= phyint;
	
	------ outputs ------
	led             <= output_led;
	phyrst          <= output_phyrst;
   phytxclk        <= output_phytxclk;
   phyTXD          <= output_phyTXD;
	phytxen         <= output_phytxen;
   phytxer         <= output_phytxer;
	phygtxclk       <= output_phygtxclk;
	phymdc          <= output_phymdc;

end Behavioral;

