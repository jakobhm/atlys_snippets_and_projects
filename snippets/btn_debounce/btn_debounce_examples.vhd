library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity btn_debounce_examples is
end btn_debounce_examples;

architecture Behavioral of btn_debounce_examples is

   component btn_debounce
      Port ( BTN_I : in  STD_LOGIC_VECTOR (4 downto 0);
             RESET_I : in std_logic;
             CLK : in  STD_LOGIC;
             BTN_O : out  STD_LOGIC_VECTOR (4 downto 0);
             RESET_O : out std_logic);
   end component;

   --###############################--
   --###    SIGNAL DECLARATION    ##--
   --###############################--
   signal btn_debounce_btn    : std_logic_vector(7 downto 0);
   signal btn_debounce_reset  : std_logic;
   
   signal clk                 : std_logic;

begin
   btn_debounce_comp : btn_debounce
      port map ( BTN_I    => ,
                 RESET_I  => ,
                 CLK      => clk,
                 BTN_O    => btn_debounce_btn,
                 RESET_O  => btn_debounce_reset);

end Behavioral;