----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:15 06/01/2015 
-- Design Name: 
-- Module Name:    mac1gTx - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mac1gTx is
generic(
   -- model config
   ethFrameMaxLen_gen       : integer := 1518;
   ethFrameMinLen_gen       : integer := 64;
   sfdPos_gen               : integer := 7;
   dataFieldPos_gen         : integer := 22;
   
   globalCntSize_gen        : integer := 16+6;
   flowCtrlCheckVal_gen     : integer := 2**globalCntSize-1;
   interframeGapBittime_gen : integer := 2;
   
   crcInitVal_gen           : std_logic_vector(31 downto 0) := x"ffffffff"
   );
port(
   -- system
   reset      : in std_logic;
   clk        : in std_logic;
   -- data inteface
   txDataInterface   : in mac1gTxDataInterface_type;
   -- gmii interface
   gmii_tx           : out gmii_tx_type;
   -- user interface
   txInfoInterface   : out mac1gTxInfoInterface_type
   );
end mac1gTx;

architecture Behavioral of mac1gTx is

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
	type STATE_TYPE is (STATE_RESET, 
                       STATE_IDLE, 
                       STATE_LOAD_FIRST_BYTE, 
                       STATE_LOAD_SECOND_BYTE,
                       STATE_PREAMBLE,
                       STATE_SFD,
                       STATE_ETH_HEADER,
                       STATE_DATA_FIRST,
                       STATE_DATA_SMALL,
                       STATE_DATA_COMMON,
                       STATE_DATA_JUMBO,
                       STATE_PADDING,
                       STATE_CRC3,
                       STATE_CRC2,
                       STATE_CRC1,
                       STATE_CRC0,
                       STATE_ERROR);
	
   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
	------ input ------
	signal input_reset            : std_logic;
	signal input_clk              : std_logic;
   signal input_txDataInterface  : mac1gTxDataInterface_type;
	
	------ output ------
   signal output_gmii_tx         : gmii_tx_type;
   signal output_txInfoInterface : mac1gTxInfoInterface_type;
	
	------ fsmOutComb ------
	signal fsmOutComb_counterClkEn  : std_logic;
	signal fsmOutComb_counterPre    : std_logic;
	signal fsmOutComb_counterPreVal : std_logic_vector(counterRegWidth_const-1 downto 0);
   
   ------ fsmInComb ------
	signal fsmInComb_nextState      : state_type;
   
	------ fsmReg ------
	signal fsmReg_curStateReg       : state_type;
	
	------ counterReg ------
	signal counterReg_counterReg    : std_logic_vector(counterRegWidth_const-1 downto 0);
	
	------ system ------
	signal system_reset             : std_logic;
	signal system_clk               : std_logic;

begin
   --##################################--
   --###   COMPONENT INSTANTIATION   ##--
   --##################################--


	--#################################--
   --###    PROCESS DEFINITIONS     ##--
   --#################################--
   ---------------------------------------
	--        fsmInComb : PROCESS        --
	---------------------------------------
	-- INPUTS:
	--    fsmReg_curStateReg
	--    counterReg_counterReg
	-- OUTPUTS:
	--    fsmComb_nextState
	---------------------------------------
   fsmInComb_proc : process(fsmReg_curStateReg, counterReg_counterReg)
	begin
	   case fsmReg_curStateReg is
			when STATE_RESET =>
				fsmInComb_nextState     <= STATE_IDLE;
            
         when STATE_IDLE =>				
            if counterReg_counterReg = std_logic_vector(to_unsigned(2**counterRegWidth_const - 2, counterRegWidth_const)) then
				   fsmInComb_nextState     <= STATE_RESET;
            else
               fsmInComb_nextState     <= STATE_IDLE;
            end if;
			
			when others =>
			   fsmInComb_nextState     <= STATE_RESET;
		end case;
	end process fsmInComb_proc;
   
	---------------------------------------
	--       fsmOutComb : PROCESS        --
	---------------------------------------
	-- INPUTS:
	--    fsmReg_curStateReg
	-- OUTPUTS:
	--    fsmComb_counterClkEn
	--    fsmComb_counterPre
	--    fsmComb_counterPreVal
	---------------------------------------
   fsmOutComb_proc : process(fsmReg_curStateReg)
	begin
	   case fsmReg_curStateReg is
			when STATE_RESET =>
			   fsmOutComb_counterClkEn  <= '1';
			   fsmOutComb_counterPre    <= '1';
				fsmOutComb_counterPreVal <= (others=>'0');
            
         when STATE_IDLE =>
			   fsmOutComb_counterClkEn  <= '1';
			   fsmOutComb_counterPre    <= '0';
				fsmOutComb_counterPreVal <= (others=>'0');
				
			when others =>
            fsmOutComb_counterClkEn  <= '1';
			   fsmOutComb_counterPre    <= '1';
				fsmOutComb_counterPreVal <= (others=>'0');
		end case;
	end process fsmOutComb_proc;

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
   fsmReg_proc : process(system_reset, system_clk, fsmInComb_nextState)
	begin
		if rising_edge(system_clk) then
         if system_reset = '1' then
		      fsmReg_curStateReg <= STATE_RESET;
         else
		      fsmReg_curStateReg <= fsmInComb_nextState;
         end if;
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
   counterReg_proc : process(system_clk, fsmOutComb_counterClkEn, fsmOutComb_counterPre, fsmOutComb_counterPreVal)
	begin
      if rising_edge(system_clk) then
		   if fsmOutComb_counterClkEn = '1' then
			   if fsmOutComb_counterPre = '1' then
				   counterReg_counterReg <= fsmOutComb_counterPreVal;
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
	input_reset            <= reset;
	input_clk              <= clk;
   input_txDataInterface  <= txDataInterface;
	
	------ output ------
   gmii_tx                <= output_gmii_tx;
   txInfoInterface        <= output_txInfoInterface;
   
   ------ fsmComb ------
	
	------ system ------
	system_reset    <= input_reset;
	system_clk      <= input_clk;

end Behavioral;

