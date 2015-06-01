----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:05 05/04/2015 
-- Design Name: 
-- Module Name:    mac_1g_rx - Behavioral 
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
use work.mac_1g_types.all;
use work.mac_1g_rx_types.all;
use work.fcs_check_types.all;
use work.rxd_shift_reg_types.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mac_1g_rx is
port( rx_en    : in std_logic;
      reset    : in std_logic;
		clk      : in std_logic;
		gmii_rx  : in gmii_rx_type;
		rx_data_interface : out mac_1g_rx_data_interface_type;
		rx_info_interface : out mac_1g_rx_state_info_interface_type);
end mac_1g_rx;

architecture Behavioral of mac_1g_rx is

component fsm
port( -- system interface
      clk                              : in std_logic;
      reset                            : in std_logic;
		en                               : in std_logic;
		-- control signals
		rx_en                            : in std_logic;
		-- gmii interface
		gmii_rx_dv_0                     : in std_logic;
		gmii_rx_er_0                     : in std_logic;
		gmii_rxd_0                       : in std_logic_vector(7 downto 0);
		gmii_rxd_5                       : in std_logic_vector(7 downto 0);
		-- others
		length_type_field                : in std_logic_vector(15 downto 0);
		local_mac_addr                   : in std_logic_vector(47 downto 0);
		-- fcs_check interface
		fcs_check_state                  : in fcs_check_state_type;
		fcs_check_reset                  : out std_logic;
		fcs_check_en                     : out std_logic;
		-- shift_reg_buffer interface
		shift_reg_buffer_reset           : out std_logic;
      shift_reg_buffer_hdr_shift_en    : out std_logic;
      shift_reg_buffer_global_shift_en : out std_logic;
		-- rx_state_info_interface
		rx_state_info_interface          : out mac_1g_rx_state_info_interface_type;
		-- data output state
		rx_dv                            : out std_logic;
		rx_er                            : out std_logic);
end component;

component fcs_check
port( reset    : in std_logic;
      clk      : in std_logic;
		en       : in std_logic;
		din      : in std_logic_vector(7 downto 0);
		state    : out fcs_check_state_type);
end component;

component shift_reg_buffer
port ( reset            : in std_logic;
       clk              : in std_logic;
	 	 hdr_shift_en     : in std_logic;
	 	 global_shift_en  : in std_logic;
		 rxd_in           : in std_logic_vector(7 downto 0);
		 frame_out        : out mac_1g_rx_frame_type);
end component;

-- inputs
signal input_rx_en   : std_logic;
signal input_reset   : std_logic;
signal input_clk     : std_logic;
signal input_gmii_rx : gmii_rx_type;

-- fsm
signal fsm_rxd_shift_reg_en                 : std_logic;
signal fsm_fcs_check_reset                  : std_logic;
signal fsm_fcs_check_en                     : std_logic;
signal fsm_shift_reg_buffer_reset           : std_logic;
signal fsm_shift_reg_buffer_hdr_shift_en    : std_logic;
signal fsm_shift_reg_buffer_global_shift_en : std_logic;
signal fsm_rx_dv                            : std_logic;
signal fsm_rx_er                            : std_logic;
signal fsm_rx_info_interface                : mac_1g_rx_state_info_interface_type;

-- fcs_check
signal fcs_check_state  : fcs_check_state_type;
signal fcs_check_reset  : std_logic;
signal fcs_buffer_reset : std_logic;

-- shift_reg_buffer
signal shift_reg_buffer_reset : std_logic;
signal shift_reg_buffer_frame_out : mac_1g_rx_frame_type;

-- error_control
signal error_control_error_code : mac_1g_rx_error_code_type;
signal error_control_rx_er      : std_logic;

-- others
signal HIGH : std_logic;
--signal LOW  : std_logic;
constant local_mac_addr : std_logic_vector(47 downto 0) := X"000102030405";


begin

input_rx_en   <= rx_en;
input_reset   <= reset;
input_clk     <= clk;
input_gmii_rx <= gmii_rx;
			 
			 
fsm_comp : fsm
port map( -- system interface
          clk                              => input_clk,
          reset                            => input_reset,
		    en                               => HIGH,
		    -- control signals
		    rx_en                            => input_rx_en,
		    -- gmii interface
		    gmii_rx_dv_0                     => input_gmii_rx.RX_DV,
		    gmii_rx_er_0                     => input_gmii_rx.RX_ER,
			 gmii_rxd_0                       => input_gmii_rx.RXD,
			 gmii_rxd_5                       => shift_reg_buffer_frame_out.rx_fcs(31 downto 24),
--			 gmii_rxd_4                       => shift_reg_buffer_frame_out.rx_fcs(23 downto 16),
		    -- others
		    length_type_field                => shift_reg_buffer_frame_out.rx_hdr.rx_length_type,
		    local_mac_addr                   => local_mac_addr,
		    -- fcs_check interface
		    fcs_check_state                  => fcs_check_state,
		    fcs_check_reset                  => fsm_fcs_check_reset,
		    fcs_check_en                     => fsm_fcs_check_en,
		    -- shift_reg_buffer interface
	       shift_reg_buffer_reset           => fsm_shift_reg_buffer_reset,
          shift_reg_buffer_hdr_shift_en    => fsm_shift_reg_buffer_hdr_shift_en,
          shift_reg_buffer_global_shift_en => fsm_shift_reg_buffer_global_shift_en,
		    -- rx_state_info_interface
		    rx_state_info_interface          => fsm_rx_info_interface,
		    -- data output state
		    rx_dv                            => fsm_rx_dv,
		    rx_er                            => fsm_rx_er);



fcs_check_reset <= input_reset or fsm_fcs_check_reset;

fcs_check_comp : fcs_check
port map( reset    => fcs_check_reset,
          clk      => input_clk,
		    en       => fsm_fcs_check_en,
		    din      => input_gmii_rx.RXD,
		    state    => fcs_check_state);


shift_reg_buffer_reset <= input_reset or fsm_shift_reg_buffer_reset;

shift_reg_buffer_comp : shift_reg_buffer
port map( reset            => shift_reg_buffer_reset,
          clk              => input_clk,
	 	    hdr_shift_en     => fsm_shift_reg_buffer_hdr_shift_en,
	 	    global_shift_en  => fsm_shift_reg_buffer_global_shift_en,
		    rxd_in           => input_gmii_rx.RXD,
		    frame_out        => shift_reg_buffer_frame_out);

---------------------------------------
---     ERROR_CONTROL : PROCESS     ---
---------------------------------------
-- INPUTS:
--    input_gmii_rx.RX_ER
--    fsm_rx_er
--    fsm_rx_info_interface.error_code
-- OUTPUTS:
--    error_control_rx_er
--    error_control_error_code
----------------------------------------
error_control : process (input_gmii_rx.RX_ER, fsm_rx_er, fsm_rx_info_interface.error_code)
begin
   error_control_rx_er <= input_gmii_rx.RX_ER or fsm_rx_er;
	
   if input_gmii_rx.RX_ER = '1' and fsm_rx_info_interface.error_code /= RX_ERROR_TIMER_ABORT_ERROR then
	   error_control_error_code <= RX_ERROR_TRANSMISSION_ERROR;
	else
	   error_control_error_code <= fsm_rx_info_interface.error_code;
	end if;
end process error_control;


-- output mapping
rx_data_interface.rx_frame <= shift_reg_buffer_frame_out;


---- scheiß lösung. muss unbeding überarbeitet werden!!!
--signal_buffer : process (input_clk, input_reset, fsm_rx_info_interface.state_code, error_control_error_code)
--begin
--if input_reset = '1' then   
--   rx_data_interface.rx_dv <= '0';
--   rx_data_interface.rx_er <= '0';
--   rx_info_interface.state_code <= rx_state_idle;
--   rx_info_interface.error_code <= rx_error_none;
--elsif rising_edge(input_clk) then
   rx_data_interface.rx_dv <= fsm_rx_dv;
   rx_data_interface.rx_er <= error_control_rx_er;
   rx_info_interface.state_code <= fsm_rx_info_interface.state_code;
   rx_info_interface.error_code <= error_control_error_code;
--end if;
--end process signal_buffer;


HIGH <= '1';
--LOW  <= '0';

end Behavioral;