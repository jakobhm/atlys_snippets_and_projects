--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:23:25 05/29/2015
-- Design Name:   
-- Module Name:   C:/Users/Jakob Wittmann/Documents/GitHub/atlys_snippets_and_projects/jakobs_stuff/projects/debug_udp_stack/generateDataAndRepeatTB.vhd
-- Project Name:  debug_udp_stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generateDataAndRepeat
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
 
ENTITY generateDataAndRepeatTB IS
END generateDataAndRepeatTB;
 
ARCHITECTURE behavior OF generateDataAndRepeatTB IS

   constant generatePreamble_const  : boolean := true;
   constant inputClkHz_const        : integer := 125000000;
	constant repeatTimeMS_const      : integer := 1;
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   component generateDataAndRepeat
   generic(
      generatePreamble  : boolean;
      inputClkHz        : integer;
	   repeatTimeMS      : integer
      );
   port(
      areset : in  std_logic;
      clk    : in  std_logic;
      data   : out std_logic_vector(7 downto 0);
      dv     : out std_logic
      );
   end component;
    

   --Inputs
   signal areset : std_logic := '0';
   signal clk    : std_logic := '0';

 	--Outputs
   signal data   : std_logic_vector(7 downto 0);
   signal dv     : std_logic;

   -- Clock period definitions
   constant clk_period : time := 8 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   generateDataAndRepeat_comp: generateDataAndRepeat
   generic map(
      generatePreamble => generatePreamble_const,
      inputClkHz       => inputClkHz_const,
      repeatTimeMS     => repeatTimeMS_const
      )
   port map(
      areset => areset,
      clk    => clk,
      data   => data,
      dv     => dv
      );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		areset <= '1';
      wait for 100 ns;
      areset <= '0';		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
