----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:25 06/01/2015 
-- Design Name: 
-- Module Name:    adapterUdpToTxMac - Behavioral 
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
use work.mac_tx_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adapterUdpToTxMac is
port(
   -- system
   clk                    : in std_logic;
   reset                  : in std_logic;
   -- udp interface
   tx_axis_mac_tdata      : in std_logic_vector(7 downto 0);
   tx_axis_mac_tvalid     : in std_logic;
   tx_axis_mac_tlast      : in std_logic;
   tx_axis_mac_tready     : out std_logic;
   -- tx mac interface
   tx_header              : out mac_tx_header_type;
   data                   : out std_logic_vector(7 downto 0);
   dl                     : out std_logic;                        -- data last
   dv                     : out std_logic;                        -- data valid
   mac_ready              : in std_logic
   );
end adapterUdpToTxMac;

architecture Behavioral of adapterUdpToTxMac is

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
	signal input_reset     : std_logic;
	signal input_clk       : std_logic;
   signal input_txAxisMacTdata  : std_logic_vector(7 downto 0);
   signal input_txAxisMacTvalid : std_logic;
   signal input_txAxisMacTlast  : std_logic;
   signal input_macReady        : std_logic;
	
	------ output ------
   signal output_txAxisMacTready : std_logic;
   signal output_txHeader        : mac_tx_header_type;
   signal output_data            : std_logic_vector(7 downto 0);
   signal output_dl              : std_logic;
   signal output_dv              : std_logic;
	
	------ fsmComb ------
	signal fsmComb_nextState     : state_type;
	signal fsmComb_counterClkEn  : std_logic;
	signal fsmComb_counterPre    : std_logic;
	signal fsmComb_counterPreVal : std_logic_vector(counterRegWidth_const-1 downto 0);
	
	------ fsmReg ------
	signal fsmReg_curStateReg : state_type;
	
	------ system ------
	signal system_reset       : std_logic;
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
	-- OUTPUTS:
	--    fsmComb_nextState
	--    
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
	
	--################################--
   --###   PARALLEL ASSIGNEMENTS   ##--
   --################################--
   ------ input ------
	input_reset     <= reset;
	input_clk       <= clk;
	
	------ output ------
   
   ------ fsmComb ------
	
	------ system ------
	system_reset    <= input_reset;
	system_clk      <= input_clk;

end Behavioral;

