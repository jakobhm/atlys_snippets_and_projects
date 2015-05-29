----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:48:01 04/21/2015 
-- Design Name: 
-- Module Name:    BRAM - Behavioral 
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

entity BRAM is
generic( addr_width   : positive := 8;
         word_width   : positive := 8);
port( clk   : in std_logic;                                  -- clock
      en    : in std_logic;                                  -- global enable
		we    : in std_logic;                                  -- write enable
		addr  : in std_logic_vector(addr_width-1 downto 0);    -- address
		din   : in std_logic_vector(word_width-1 downto 0);    -- data in
		dout  : out std_logic_vector(word_width-1 downto 0));  -- data out
end BRAM;

architecture Behavioral of BRAM is

type BRAM_TYPE is array (0 to 255) of std_logic_vector(word_width-1 downto 0);
signal BRAM : BRAM_TYPE := (others => (others=>'0'));

begin

process (clk)
begin
   if rising_edge(clk) then
	   if en = '1' then
		   if we = '1' then  -- write data
			   BRAM(To_integer(unsigned(addr))) <= din;
				dout <= din;
			else  -- read data
			   dout <= BRAM(To_integer(unsigned(addr)));
			end if;
		else
		  -- if en = '0', hold
		end if;
	end if;
end process;

end Behavioral;

