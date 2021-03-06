----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:59 04/16/2015 
-- Design Name: 
-- Module Name:    sw_debounce - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 1.00 - functional test succesful
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity btnDebounce is
    Port ( BTN_I : in  STD_LOGIC_VECTOR (4 downto 0);
	        RESET_I : in std_logic;
           CLK : in  STD_LOGIC;
           BTN_O : out  STD_LOGIC_VECTOR (4 downto 0);
			  RESET_O : out std_logic);
end btnDebounce;

architecture Behavioral of btnDebounce is

constant CNTR_MAX : std_logic_vector(15 downto 0) := (others => '1');

signal btn0_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal btn1_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal btn2_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal btn3_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal btn4_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal reset_cntr : std_logic_vector(15 downto 0) := (others => '0');

signal btn0_reg : std_logic := '0';
signal btn1_reg : std_logic := '0';
signal btn2_reg : std_logic := '0';
signal btn3_reg : std_logic := '0';
signal btn4_reg : std_logic := '0';
signal reset_reg : std_logic := '0';

begin

btn0_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btn0_cntr = CNTR_MAX) then
			btn0_reg <= not(btn0_reg);
		end if;
	end if;
end process;

btn0_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((btn0_reg = '1') xor (BTN_I(0) = '1')) then
			if (btn0_cntr = CNTR_MAX) then
				btn0_cntr <= (others => '0');
			else
				btn0_cntr <= btn0_cntr + 1;
			end if;
		else
			btn0_cntr <= (others => '0');
		end if;
	end if;
end process;

btn1_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btn1_cntr = CNTR_MAX) then
			btn1_reg <= not(btn1_reg);
		end if;
	end if;
end process;

btn1_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((btn1_reg = '1') xor (BTN_I(1) = '1')) then
			if (btn1_cntr = CNTR_MAX) then
				btn1_cntr <= (others => '0');
			else
				btn1_cntr <= btn1_cntr + 1;
			end if;
		else
			btn1_cntr <= (others => '0');
		end if;
	end if;
end process;

btn2_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btn2_cntr = CNTR_MAX) then
			btn2_reg <= not(btn2_reg);
		end if;
	end if;
end process;

btn2_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((btn2_reg = '1') xor (BTN_I(2) = '1')) then
			if (btn2_cntr = CNTR_MAX) then
				btn2_cntr <= (others => '0');
			else
				btn2_cntr <= btn2_cntr + 1;
			end if;
		else
			btn2_cntr <= (others => '0');
		end if;
	end if;
end process;

btn3_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btn3_cntr = CNTR_MAX) then
			btn3_reg <= not(btn3_reg);
		end if;
	end if;
end process;

btn3_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((btn3_reg = '1') xor (BTN_I(3) = '1')) then
			if (btn3_cntr = CNTR_MAX) then
				btn3_cntr <= (others => '0');
			else
				btn3_cntr <= btn3_cntr + 1;
			end if;
		else
			btn3_cntr <= (others => '0');
		end if;
	end if;
end process;

btn4_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btn4_cntr = CNTR_MAX) then
			btn4_reg <= not(btn4_reg);
		end if;
	end if;
end process;

btn4_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((btn4_reg = '1') xor (BTN_I(4) = '1')) then
			if (btn4_cntr = CNTR_MAX) then
				btn4_cntr <= (others => '0');
			else
				btn4_cntr <= btn4_cntr + 1;
			end if;
		else
			btn4_cntr <= (others => '0');
		end if;
	end if;
end process;

reset_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (reset_cntr = CNTR_MAX) then
			reset_reg <= not(reset_reg);
		end if;
	end if;
end process;

reset_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((reset_reg = '1') xor (RESET_I = '1')) then
			if (reset_cntr = CNTR_MAX) then
				reset_cntr <= (others => '0');
			else
				reset_cntr <= reset_cntr + 1;
			end if;
		else
			reset_cntr <= (others => '0');
		end if;
	end if;
end process;

BTN_O <= btn4_reg & btn3_reg & btn2_reg & btn1_reg & btn0_reg;
RESET_O <= reset_reg;

end Behavioral;

