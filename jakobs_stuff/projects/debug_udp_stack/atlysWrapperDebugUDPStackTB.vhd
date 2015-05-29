--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:12:22 05/29/2015
-- Design Name:   
-- Module Name:   C:/Users/Jakob Wittmann/Documents/GitHub/atlys_snippets_and_projects/jakobs_stuff/projects/debug_udp_stack/atlysWrapperDebugUDPStackTB.vhd
-- Project Name:  debug_udp_stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: atlysWrapperDebugUDPStack
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY atlysWrapperDebugUDPStackTB IS
END atlysWrapperDebugUDPStackTB;
 
ARCHITECTURE behavior OF atlysWrapperDebugUDPStackTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT atlysWrapperDebugUDPStack
    PORT(
         BTN : IN  std_logic_vector(5 downto 0);
         SW : IN  std_logic_vector(7 downto 0);
         LED : OUT  std_logic_vector(7 downto 0);
         phyrst : OUT  std_logic;
         phytxclk : in  std_logic;
         phyTXD : OUT  std_logic_vector(7 downto 0);
         phytxen : OUT  std_logic;
         phytxer : out  std_logic;
         phygtxclk : OUT  std_logic;
         phyRXD : IN  std_logic_vector(7 downto 0);
         phyrxdv : IN  std_logic;
         phyrxer : IN  std_logic;
         phyrxclk : IN  std_logic;
         phymdc : OUT  std_logic;
         phymdi : INOUT  std_logic;
         phyint : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BTN : std_logic_vector(5 downto 0) := (others => '0');
   signal SW : std_logic_vector(7 downto 0) := (others => '0');
   signal phyRXD : std_logic_vector(7 downto 0) := (others => '0');
   signal phyrxdv : std_logic := '0';
   signal phyrxer : std_logic := '0';
   signal phyrxclk : std_logic := '0';
   signal phyint : std_logic := '0';

	--BiDirs
   signal phymdi : std_logic;

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);
   signal phyrst : std_logic;
   signal phytxclk : std_logic;
   signal phyTXD : std_logic_vector(7 downto 0);
   signal phytxen : std_logic;
   signal phytxer : std_logic;
   signal phygtxclk : std_logic;
   signal phymdc : std_logic;

   -- Clock period definitions
   constant phytxclk_period  : time := 8 ns;
--   constant phygtxclk_period : time := 8 ns;
   constant phyrxclk_period  : time := 8 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: atlysWrapperDebugUDPStack PORT MAP (
          BTN => BTN,
          SW => SW,
          LED => LED,
          phyrst => phyrst,
          phytxclk => phytxclk,
          phyTXD => phyTXD,
          phytxen => phytxen,
          phytxer => phytxer,
          phygtxclk => phygtxclk,
          phyRXD => phyRXD,
          phyrxdv => phyrxdv,
          phyrxer => phyrxer,
          phyrxclk => phyrxclk,
          phymdc => phymdc,
          phymdi => phymdi,
          phyint => phyint
        );

   -- Clock process definitions
   phytxclk_process :process
   begin
		phytxclk <= '0';
		wait for phytxclk_period/2;
		phytxclk <= '1';
		wait for phytxclk_period/2;
   end process;
 
--   phygtxclk_process :process
--   begin
--		phygtxclk <= '0';
--		wait for phygtxclk_period/2;
--		phygtxclk <= '1';
--		wait for phygtxclk_period/2;
--   end process;
 
   phyrxclk_process :process
   begin
		phyrxclk <= '0';
		wait for phyrxclk_period/2;
		phyrxclk <= '1';
		wait for phyrxclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      btn(0) <= '0';
      wait for 100 ns;
      btn(0) <= '1';

      wait for phyrxclk_period*10;

      -- insert stimulus here 

      wait;
   end process;
   
   

END;
