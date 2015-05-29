----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:46 05/29/2015 
-- Design Name: 
-- Module Name:    frameGrabberEthernet - Behavioral 
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

entity frameGrabberEthernet is
generic(
   -- model config
	useParallelRead_gen        : boolean := true;
   waitForDataOutReady_gen    : boolean := true;
   
   -- ram config
   seqReadByteCnt_gen         : integer := 10;
	parallelReadByteCnt_gen    : integer := 10;
	-- udp config
	udpDstIpAddr_gen           : std_logic_vector(31 downto 0) := X"FFFFFFFF";
	udpDstPort_gen             : std_logic_vector(15 downto 0) := X"FFFF";
	udpSrcPort_gen             : std_logic_vector(15 downto 0) := X"FFFF";
	udpChecksum_gen            : std_logic_vector(15 downto 0) := X"0000");
port(
   reset        : in std_logic;
	clkEn        : in std_logic;
	clk          : in std_logic;
	-- udp input interface
   
   -- mac-adapter input interface
   macRxTdata            : in std_logic_vector(7 downto 0);
   macRxTvalid           : in std_logic;
   macRxTready           : out std_logic;
   macRxTlast            : in std_logic;
   -- mac input interface
   
   -- phy input interface
   phyRXD                : in std_logic_vector(7 downto 0);
   phyrxdv               : in std_logic;
	
	-- udp output interface
	udpTxStart	          : out std_logic;
	udpTxi					 : out udp_tx_type;
	udpTxResult			    : in std_logic_vector (1 downto 0);
	udpTxDataOutReady     : in std_logic;
   -- mac-adapter output interface
   
   -- mac output interface
   
   -- phy output interface
   phyTXD                : out std_logic_vector(7 downto 0);
   phyrxen               : out std_logic   
   );
end frameGrabberEthernet;

architecture Behavioral of frameGrabberEthernet is

   --################################--
   --###   CONSTANTS DEFINITIONS   ##--
   --################################--
	------ counterReg ------
	constant counterRegWidth_const     : integer  := 16;
   
   ------ BRAM ------
   constant bram_addrWidth_const   : positive := 16;
   constant bram_wordWidth_const   : positive := 8;
   constant bram_cntRows_const     : positive := 256;
	
   --#################################--
   --###   COMPONENT DECLARATIONS   ##--
   --#################################--
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
	
	--#############################--
   --###    TYPE DEFINITIONS    ##--
   --#############################--
	------ fsm ------
	type STATE_TYPE is (STATE_RESET, STATE_IDLE, STATE_READ_DATA);
	
   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
	------ input ------
   -- system
	signal input_reset        : std_logic;
   signal input_clkEn        : std_logic;
	signal input_clk          : std_logic;
	-- phy
   signal input_phyRXD             : std_logic_vector(7 downto 0);
   signal input_phyrxdv            : std_logic;
   -- udp
   signal input_udpTxResult		  : std_logic_vector (1 downto 0);
	signal input_udpTxDataOutReady  : std_logic;
   
	------ output ------
   -- udp
   signal output_udpTxStart	     : std_logic;
	signal output_udpTxi			  : udp_tx_type;
	
	------ fsmComb ------
	signal fsmComb_nextState     : state_type;
	signal fsmComb_counterClkEn  : std_logic;
	signal fsmComb_counterPre    : std_logic;
	signal fsmComb_counterPreVal : std_logic_vector(counterRegWidth_const-1 downto 0);
   signal fsmComb_udpTxStart    : std_logic;
   signal fsmComb_udpTxi        : udp_tx_type;
	
	------ fsmReg ------
	signal fsmReg_curStateReg : state_type;
	
	------ counterReg ------
	signal counterReg_counterReg : std_logic_vector(counterRegWidth_const-1 downto 0);
   
   ------ BRAM ------
   signal bram_dout       : std_logic_vector(bram_wordWidth_const-1 downto 0);
	
	------ system ------
	signal system_reset       : std_logic;
	signal system_clk         : std_logic;

begin
   --##################################--
   --###   COMPONENT INSTANTIATION   ##--
   --##################################--
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


	--#################################--
   --###    PROCESS DEFINITIONS     ##--
   --#################################--
	---------------------------------------
	--        fsmComb : PROCESS          --
	---------------------------------------
	-- INPUTS:
	--    fsmReg_curStateReg
	--    counterReg_counterReg
   --    input_phyrxd
   --    input_phyrxdv
	-- OUTPUTS:
	--    fsmComb_nextState
	--    fsmComb_counterClkEn
	--    fsmComb_counterPre
	--    fsmComb_counterPreVal
   --
   --    fsmComb_udpTxi.hdr.dst_ip_addr 		   : STD_LOGIC_VECTOR (31 downto 0);
   --    fsmComb_udpTxi.hdr.dst_port	 			   : STD_LOGIC_VECTOR (15 downto 0);
   --    fsmComb_udpTxi.hdr.src_port	 			   : STD_LOGIC_VECTOR (15 downto 0);
   --    fsmComb_udpTxi.hdr.data_length			   : STD_LOGIC_VECTOR (15 downto 0);
   --    fsmComb_udpTxi.hdr.checksum				   : STD_LOGIC_VECTOR (15 downto 0);
   --
   --    fsmComb_udpTxi.data.data_out_valid		: std_logic;
   --    fsmComb_udpTxi.data.data_out_last		   : std_logic;
   --    fsmComb_udpTxi.data.data_out				: std_logic_vector (7 downto 0);
   --    
	---------------------------------------
   fsmComb_proc : process(fsmReg_curStateReg, counterReg_counterReg)
	begin
      fsmComb_udpTxi.hdr.dst_ip_addr             <= udpDstIpAddr_gen;
      fsmComb_udpTxi.hdr.dst_port                <= udpDstPort_gen;
      fsmComb_udpTxi.hdr.src_port                <= udpSrcPort_gen;
      fsmComb_udpTxi.hdr.checksum                <= udpChecksum_gen;
      
	   case fsmReg_curStateReg is
      
			when STATE_RESET =>
			   fsmComb_counterClkEn                 <= '1';
			   fsmComb_counterPre                   <= '1';
				fsmComb_counterPreVal                <= (others=>'0');
            fsmComb_udpTxi.hdr.data_length	    <= (others=>'0');
            fsmComb_udpTxi.data.data_out_valid   <= '0';
            fsmComb_udpTxi.data.data_out_last    <= '0';
            fsmComb_udpTxi.data.data_out         <= (others=>'0');
				
            if input_phyrxdv = '0' then
				   fsmComb_nextState     <= STATE_IDLE;
            else
               fsmComb_nextState     <= STATE_RESET;
            end if;
            
         when STATE_IDLE =>
            fsmComb_counterClkEn                 <= '1';
			   fsmComb_counterPre                   <= '1';
				fsmComb_counterPreVal                <= (others=>'0');
            fsmComb_udpTxi.hdr.data_length	    <= (others=>'0');
            fsmComb_udpTxi.data.data_out_valid   <= '0';
            fsmComb_udpTxi.data.data_out_last    <= '0';
            fsmComb_udpTxi.data.data_out         <= (others=>'0');
				
				fsmComb_nextState     <= STATE_IDLE;
         when STATE_READ_DATA =>
				
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

