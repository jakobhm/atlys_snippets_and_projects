----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:09 04/22/2015 
-- Design Name: 
-- Module Name:    arduino_tx - Behavioral 
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

entity arduino_tx is
    Port ( txd_in : in  STD_LOGIC_VECTOR (7 downto 0);
           en_in : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           txd_out : out  STD_LOGIC_VECTOR (3 downto 0);
           en_out : out  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end arduino_tx;

architecture Behavioral of arduino_tx is

--type state_t is (IDLE, SEND);
type nibble_t is (LSN, MSN);
--signal state: state_t := IDLE;
signal nibble: nibble_t := LSN; 
begin

	senddata : process
	begin
		wait until rising_edge(clk_in);
		en_out <= '0';
		nibble <= LSN;
		if en_in = '1' then 
			en_out <= '1';
			nibble <= LSN;
			if nibble = LSN then
				txd_out <= txd_in(3 downto 0);
				nibble <= MSN;
			else 
				txd_out <= txd_in(7 downto 4);
			end if;
		end if;
	end process;
				
clk_out <= clk_in;

end Behavioral;



