library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity sw_debounce_examples is
end sw_debounce_examples;

architecture Behavioral of sw_debounce_examples is

   component sw_debounce
    Port ( SW_I : in   std_logic_vector (7 downto 0);
           CLK  : in   std_logic;
           SW_O : out  std_logic_vector (7 downto 0));
   end component;

   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
   signal sw_debounce_btn    : std_logic_vector(7 downto 0);
   signal sw_debounce_reset  : std_logic;
   
   signal clk                : std_logic;

begin
   sw_debounce_comp : sw_debounce
   Port map ( SW_I    => ,
              CLK     => clk,
              SW_O    => sw_debounce_sw);

end Behavioral;