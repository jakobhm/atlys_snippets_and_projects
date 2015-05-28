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

entity swDebounce is
    Port ( SW_I : in   STD_LOGIC_VECTOR (7 downto 0);
           CLK  : in   STD_LOGIC;
           SW_O : out  STD_LOGIC_VECTOR (7 downto 0));
end swDebounce;

architecture Behavioral of swDebounce is

constant CNTR_MAX : std_logic_vector(15 downto 0) := (others => '1');

signal sw0_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw1_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw2_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw3_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw4_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw5_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw6_cntr : std_logic_vector(15 downto 0) := (others => '0');
signal sw7_cntr : std_logic_vector(15 downto 0) := (others => '0');

signal sw0_reg : std_logic := '0';
signal sw1_reg : std_logic := '0';
signal sw2_reg : std_logic := '0';
signal sw3_reg : std_logic := '0';
signal sw4_reg : std_logic := '0';
signal sw5_reg : std_logic := '0';
signal sw6_reg : std_logic := '0';
signal sw7_reg : std_logic := '0';

begin

-- SW 0
sw0_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw0_cntr = CNTR_MAX) then
			sw0_reg <= not(sw0_reg);
		end if;
	end if;
end process;

sw0_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw0_reg = '1') xor (SW_I(0) = '1')) then
			if (sw0_cntr = CNTR_MAX) then
				sw0_cntr <= (others => '0');
			else
				sw0_cntr <= sw0_cntr + 1;
			end if;
		else
			sw0_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 1
sw1_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw1_cntr = CNTR_MAX) then
			sw1_reg <= not(sw1_reg);
		end if;
	end if;
end process;

sw1_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw1_reg = '1') xor (SW_I(1) = '1')) then
			if (sw1_cntr = CNTR_MAX) then
				sw1_cntr <= (others => '0');
			else
				sw1_cntr <= sw1_cntr + 1;
			end if;
		else
			sw1_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 2
sw2_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw2_cntr = CNTR_MAX) then
			sw2_reg <= not(sw2_reg);
		end if;
	end if;
end process;

sw2_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw2_reg = '1') xor (SW_I(2) = '1')) then
			if (sw2_cntr = CNTR_MAX) then
				sw2_cntr <= (others => '0');
			else
				sw2_cntr <= sw2_cntr + 1;
			end if;
		else
			sw2_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 3
sw3_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw3_cntr = CNTR_MAX) then
			sw3_reg <= not(sw3_reg);
		end if;
	end if;
end process;

sw3_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw3_reg = '1') xor (SW_I(3) = '1')) then
			if (sw3_cntr = CNTR_MAX) then
				sw3_cntr <= (others => '0');
			else
				sw3_cntr <= sw3_cntr + 1;
			end if;
		else
			sw3_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 4
sw4_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw4_cntr = CNTR_MAX) then
			sw4_reg <= not(sw4_reg);
		end if;
	end if;
end process;

sw4_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw4_reg = '1') xor (SW_I(4) = '1')) then
			if (sw4_cntr = CNTR_MAX) then
				sw4_cntr <= (others => '0');
			else
				sw4_cntr <= sw4_cntr + 1;
			end if;
		else
			sw4_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 5
sw5_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw5_cntr = CNTR_MAX) then
			sw5_reg <= not(sw5_reg);
		end if;
	end if;
end process;

sw5_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw5_reg = '1') xor (SW_I(5) = '1')) then
			if (sw5_cntr = CNTR_MAX) then
				sw5_cntr <= (others => '0');
			else
				sw5_cntr <= sw5_cntr + 1;
			end if;
		else
			sw5_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 6
sw6_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw6_cntr = CNTR_MAX) then
			sw6_reg <= not(sw6_reg);
		end if;
	end if;
end process;

sw6_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw6_reg = '1') xor (SW_I(6) = '1')) then
			if (sw6_cntr = CNTR_MAX) then
				sw6_cntr <= (others => '0');
			else
				sw6_cntr <= sw6_cntr + 1;
			end if;
		else
			sw6_cntr <= (others => '0');
		end if;
	end if;
end process;

-- SW 7
sw7_debounce_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (sw7_cntr = CNTR_MAX) then
			sw7_reg <= not(sw7_reg);
		end if;
	end if;
end process;

sw7_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((sw7_reg = '1') xor (SW_I(7) = '1')) then
			if (sw7_cntr = CNTR_MAX) then
				sw7_cntr <= (others => '0');
			else
				sw7_cntr <= sw7_cntr + 1;
			end if;
		else
			sw7_cntr <= (others => '0');
		end if;
	end if;
end process;


SW_O <= sw7_reg & sw6_reg & sw5_reg & sw4_reg & sw3_reg & sw2_reg & sw1_reg & sw0_reg;

end Behavioral;
