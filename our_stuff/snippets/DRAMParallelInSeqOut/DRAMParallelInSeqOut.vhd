----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:52 05/29/2015 
-- Design Name: 
-- Module Name:    DRAMParallelInSeqOut - Behavioral 
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

entity DRAMParallelInSeqOut is
generic(
   addrWidth_gen   : positive := 8;
   wordWidth_gen   : positive := 8;
   cntWords_gen    : positive := 16);
port(
   clk   : in std_logic;                                                  -- clock
   load  : in std_logic;                                                  -- parallel load
   addr  : in std_logic_vector(addrWidth_gen-1 downto 0);                 -- address
   din   : in std_logic_vector(wordWidth_gen*cntWords_gen-1 downto 0);    -- data in
   dout  : out std_logic_vector(wordWidth_gen-1 downto 0));               -- data out
end DRAMParallelInSeqOut;

architecture Behavioral of DRAMParallelInSeqOut is

type DRAM_TYPE is array (0 to cntWords_gen) of std_logic_vector(wordWidth_gen-1 downto 0);
signal DRAM : DRAM_TYPE := (others => (others=>'0'));

begin
   process (clk)
   begin
      if rising_edge(clk) then
         if load = '1' then
            for k in 0 to cntWords_gen-1 loop
               DRAM(k) <= din((wordWidth_gen*(k+1))-1 downto wordWidth_gen*k);
            end loop;
         end if;
      end if;
   end process;
   
   dout <= DRAM(to_integer(unsigned(addr)));
   
end Behavioral;