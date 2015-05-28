----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:38 05/15/2015 
-- Design Name: 
-- Module Name:    processExamples - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.00 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

   --#################################--
   --###   PROCESS WITH REGISTERS   ##--
   --#################################--
   
   ------------------------------------------
   --    doSomethingReg_proc : process     --
   ------------------------------------------
   -- INPUTS:
   --   system_areset            : std_logic;
   --   system_clk               : std_logic;
   -- OUTPUTS:
   --    doSomethingReg_aaaReg   : mySigType0;
   --    doSomethingReg_bbbReg   : mySigType1;
   --    doSomethingReg_ccc      : std_logic;
   ----------------------------------------
   doSomethingReg_proc : process (system_areset, system_clk, input_sw)
   begin
      if system_areset = '0' then
	     doSomethingReg_aaaReg <= '0';
		 doSomethingReg_bbbReg <= '1';
		 doSomethingReg_ccc    <= '1';
	  elsif rising_edge(system_clk) then
	     doSomethingReg_aaaReg <= not doSomethingReg_aaaReg;
		 doSomethingReg_bbbReg <= not doSomethingReg_bbbReg;
	  else
	     doSomethingReg_ccc    <= '0';
	  end if;
   end process doSomethingReg_proc;
   
   
   
   --#################################--
   --###   COMBINATORIAL PROCESSS   ##--
   --#################################--
   
   --------------------------------------
   --    doSomethingComb_proc : process     --
   --------------------------------------
   -- INPUTS:
   --   input_sw
   -- OUTPUTS:
   --    doSomethingComb_ddd
   --    doSomethingComb_eee
   ----------------------------------------
   doSomethingComb_proc : process (input_sw)
   begin
      if input_sw = "01010101" then
	     doSomethingComb_ddd <= '1';
		 doSomethingComb_eee <= '0';
	  elsif input_sw = "10101010" then
	     doSomethingComb_ddd <= '0';
		 doSomethingComb_eee <= '1';
	  else
	     doSomethingComb_ddd <= '0';
		 doSomethingComb_eee <= '0';
	  end if;
   end process doSomethingReg_proc;