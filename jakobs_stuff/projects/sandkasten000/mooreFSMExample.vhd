----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:42 05/29/2015 
-- Design Name: 
-- Module Name:    mooreFSMExample - Behavioral 
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

entity mooreFSMExample is
port(
   -- system
   areset         : std_logic;
   clk            : std_logic
   );
end mooreFSMExample;

architecture Behavioral of mooreFSMExample is

   --################################--
   --###   CONSTANTS DEFINITIONS   ##--
   --################################--
	------ counterReg ------
	constant counterRegWidth_const     : integer  := 16;
	
   --#################################--
   --###   COMPONENT DECLARATIONS   ##--
   --#################################--
	
	
	--#############################--
   --###    TYPE DEFINITIONS    ##--
   --#############################--
	------ fsm ------
	type STATE_TYPE is (STATE_RESET, STATE_IDLE);
	
   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
	------ input ------
	signal input_areset    : std_logic;
	signal input_clk       : std_logic;
	
	------ output ------
	
	------ fsmComb ------
	signal fsmComb_nextState     : state_type;
	signal fsmComb_counterClkEn  : std_logic;
	signal fsmComb_counterPre    : std_logic;
	signal fsmComb_counterPreVal : std_logic_vector(counterRegWidth_const-1 downto 0);
	
	------ fsmReg ------
	signal fsmReg_curStateReg : state_type;
	
	------ counterReg ------
	signal counterReg_counterReg : std_logic_vector(counterRegWidth_const-1 downto 0);
	
	------ system ------
	signal system_areset      : std_logic;
	signal system_clk         : std_logic;

begin
   --##################################--
   --###   COMPONENT INSTANTIATION   ##--
   --##################################--


	--#################################--
   --###    PROCESS DEFINITIONS     ##--
   --#################################--
	---------------------------------------
	--        fsmComb : PROCESS          --
	---------------------------------------
	-- INPUTS:
	--    fsmReg_curStateReg
	--    counterReg_counterReg
	-- OUTPUTS:
	--    fsmComb_nextState
	--    fsmComb_counterClkEn
	--    fsmComb_counterPre
	--    fsmComb_counterPreVal
	---------------------------------------
   fsmComb_proc : process(fsmReg_curStateReg, counterReg_counterReg)
	begin
	   case fsmReg_curStateReg is
			when STATE_RESET =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '1';
				fsmComb_counterPreVal <= (others=>'0');
				
				fsmComb_nextState     <= STATE_IDLE;
            
         when STATE_IDLE =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '0';
				fsmComb_counterPreVal <= (others=>'0');
				
            if counterReg_counterReg = std_logic_vector(to_unsigned(2**counterRegWidth_const - 2, counterRegWidth_const)) then
				   fsmComb_nextState     <= STATE_RESET;
            else
               fsmComb_nextState     <= STATE_IDLE;
            end if;
				
			when others =>
			   fsmComb_nextState     <= STATE_RESET;
		end case;
	end process fsmComb_proc;

	---------------------------------------
	--         fsmReg : PROCESS          --
	---------------------------------------
	-- INPUTS:
	--    system_areset
	--    system_clk
	--    fsmComb_nextState
	-- OUTPUTS:
	--    fsmReg_curStateReg
	---------------------------------------
   fsmReg_proc : process(system_areset, system_clk, fsmComb_nextState)
	begin
	   if system_areset = '1' then
		   fsmReg_curStateReg <= STATE_RESET;
		elsif rising_edge(system_clk) then
		   fsmReg_curStateReg <= fsmComb_nextState;
		end if;
	end process fsmReg_proc;
	
	---------------------------------------
	--       counterReg : PROCESS        --
	---------------------------------------
	-- INPUTS:
	--    system_clk
	--    fsmComb_counterClkEn
	--    fsmComb_counterPre
	--    fsmComb_counterPreVal
	-- OUTPUTS:
	--    counterReg_counterReg
	---------------------------------------
   counterReg_proc : process(system_clk, fsmComb_counterClkEn, fsmComb_counterPre, fsmComb_counterPreVal)
	begin
      if rising_edge(system_clk) then
		   if fsmComb_counterClkEn = '1' then
			   if fsmComb_counterPre = '1' then
				   counterReg_counterReg <= fsmComb_counterPreVal;
				else
				   counterReg_counterReg <= std_logic_vector(unsigned(counterReg_counterReg) + 1);
				end if;
			end if;
		end if;
	end process counterReg_proc;
	
	
	--################################--
   --###   PARALLEL ASSIGNEMENTS   ##--
   --################################--
   ------ input ------
	input_areset    <= areset;
	input_clk       <= clk;
	
	------ output ------
   
   ------ fsmComb ------
	
	------ system ------
	system_areset   <= input_areset;
	system_clk      <= input_clk;


end Behavioral;

