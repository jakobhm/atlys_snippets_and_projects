----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:45 05/28/2015 
-- Design Name: 
-- Module Name:    generateDataAndRepeat - Behavioral 
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
use work.udpFrameGeneratorOutputFile.all;
use work.generateDataAndRepeat_TYPES.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generateDataAndRepeat is
generic (
   generatePreamble  : boolean := false;
   inputClkHz        : integer := 125000000;  -- input clk in Hz
	repeatTimeMS      : integer := 3000       -- repeat time in ms
   );
port (
   -- system
   areset    : in std_logic;
	clk       : in std_logic;
	-- data output
   data      : out std_logic_vector(7 downto 0);
	dv        : out std_logic
   );
end generateDataAndRepeat;

architecture Behavioral of generateDataAndRepeat is

   --################################--
   --###   CONSTANTS DEFINITIONS   ##--
   --################################--
	------ counterReg ------
	constant counterRegMaxValue_const  : integer  := calcMaxValue(inputClkHz, repeatTimeMS) - 2;
	constant counterRegWidth_const     : integer  := calcRegWidth(counterRegMaxValue_const);
	
   --#################################--
   --###   COMPONENT DECLARATIONS   ##--
   --#################################--
	
	
	--#############################--
   --###    TYPE DEFINITIONS    ##--
   --#############################--
	------ fsm ------
	type STATE_TYPE is (STATE_RESET, STATE_WAIT, STATE_WAIT_TO_PREAMBLE, STATE_PREAMBLE, STATE_WAIT_TO_DATA_OUT, STATE_PREAMBLE_TO_DATA_OUT, STATE_DATA_OUT);
	
   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
	------ input ------
	signal input_areset    : std_logic;
	signal input_clk       : std_logic;
	
	------ output ------
	signal output_data     : std_logic_vector(7 downto 0);
	signal output_dv       : std_logic;
	
	------ fsmComb ------
	signal fsmComb_nextState     : state_type;
	signal fsmComb_counterClkEn  : std_logic;
	signal fsmComb_counterPre    : std_logic;
	signal fsmComb_counterPreVal : std_logic_vector(counterRegWidth_const-1 downto 0);
	signal fsmComb_data          : std_logic_vector(7 downto 0);
	signal fsmComb_dv            : std_logic;
	
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
	--    fsmReg_curState
	--    counterReg_counterReg
	-- OUTPUTS:
	--    fsmComb_nextState
	--    fsmComb_counterClkEn
	--    fsmComb_counterPre
	--    fsmComb_counterPreVal
	--    fsmComb_data
	--    fsmComb_dv
	---------------------------------------
   fsmComb_proc : process(fsmReg_curState, counterReg_counterReg)
	begin
	   case fsmReg_curState is
			when STATE_RESET =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '1';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_data          <= (others=>'0');
				fsmComb_dv            <= '0';
				
				fsmComb_nextState     <= STATE_WAIT;
				
			when STATE_WAIT =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '0';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_data          <= (others=>'0');
				fsmComb_dv            <= '0';
				
				if counterReg_counterReg = std_logic_vector(to_unsigned(counterRegMaxValue_const, counterRegWidth_const)) then
				   if generatePreamble = true then
				      fsmComb_nextState     <= STATE_WAIT_TO_PREAMBLE;
					else
					   fsmComb_nextState     <= STATE_WAIT_TO_DATA_OUT;
					end if;
				else
				   fsmComb_nextState     <= STATE_WAIT;
				end if;
			when STATE_WAIT_TO_PREAMBLE =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '1';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_data          <= (others=>'0');
				fsmComb_dv            <= '0';
				
				fsmComb_nextState     <= STATE_PREAMBLE;
				
			when STATE_WAIT_TO_DATA_OUT => 
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '1';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_data          <= (others=>'0');
				fsmComb_dv            <= '0';
				
				fsmComb_nextState     <= STATE_DATA_OUT;
			
			when STATE_PREAMBLE => 
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '0';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_dv            <= '1';
				fsmComb_data          <= X"55";
				
				if counterReg_counterReg = std_logic_vector(to_unsigned(5-1, counterRegWidth_const)) then
					fsmComb_nextState     <= STATE_PREAMBLE_TO_DATA_OUT;
				else
				   fsmComb_nextState     <= STATE_PREAMBLE;
				end if;
			
			when STATE_PREAMBLE_TO_DATA_OUT =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '1';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_data          <= X"5D";
				fsmComb_dv            <= '1';
				
				fsmComb_nextState     <= STATE_DATA_OUT;
			
			when STATE_DATA_OUT =>
			   fsmComb_counterClkEn  <= '1';
			   fsmComb_counterPre    <= '0';
				fsmComb_counterPreVal <= (others=>'0');
				fsmComb_data          <= frame_vec(to_integer(unsigned(counterReg_counterReg)));
				fsmComb_dv            <= '1';
				
				if counterReg_counterReg = std_logic_vector(to_unsigned(frame_vec_length-1, counterRegWidth_const)) then
				   fsmComb_nextState     <= STATE_RESET;
				else
				   fsmComb_nextState     <= STATE_DATA_OUT;
				end if;
			when others =>
			   fsmComb_nextState     <= STATE_RESET;
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
	--    system_areset
	--    system_clk
	--    fsmComb_counterClkEn
	--    fsmComb_counterPre
	--    fsmComb_counterPreVal
	-- OUTPUTS:
	--    counterReg_counterReg
	---------------------------------------
   counterReg_proc : process(system_areset, system_clk, fsmComb_counterClkEn, fsmComb_counterPre, fsmComb_counterPreVal)
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
	end process fsmReg_proc;
	
	
	--################################--
   --###   PARALLEL ASSIGNEMENTS   ##--
   --################################--
   ------ input ------
	input_areset    <= areset;
	input_clk       <= clk;
	
	------ output ------
	data            <= output_data;
	dv              <= output_dv;
	
	------ system ------
	system_areset   <= input_areset;
	system_clk      <= input_clk;
	
end Behavioral;

