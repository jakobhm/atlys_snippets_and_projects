--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MAC_1G_types is

------------------
--     GMII     --
------------------
-- see IEEE802.3, Section 35

-- GMII receive
type gmii_rx_type is record
   RXD        : std_logic_vector(7 downto 0);
	RX_ER      : std_logic;
	RX_DV      : std_logic;	
end record;

-- GMII transmit
type gmii_tx_type is record
   TXD        : std_logic_vector(7 downto 0);
	TX_EN      : std_logic;
	TX_ER      : std_logic;
end record;

-- GMII connection observation
type gmii_con_obs_type is record
   COL        : std_logic;
	CRS        : std_logic;
end record;

-- GMII without full duplex
type gmii_type is record
   gmii_rx        : gmii_rx_type;
	RX_CLK         : std_logic;
	gmii_tx        : gmii_tx_type;
	GTX_CLK        : std_logic;
	gmii_con_obs   : gmii_con_obs_type;
end record;

-- GMII with full duplex
type gmii_fd_type is record
   gmii_rx    : gmii_rx_type;
	RX_CLK     : std_logic;
	gmii_tx    : gmii_tx_type;
	GTX_CLK    : std_logic;
end record;

------------------------
--   RX ERROR CODES   --
------------------------

type mac_1g_rx_error_code_type is (RX_ERROR_NONE,
                                   RX_ERROR_TIMER_ABORT_ERROR,
											  RX_ERROR_FRAME_TOO_LONG_ERROR,
											  RX_ERROR_FRAME_TOO_SMALL_ERROR,
											  RX_ERROR_FRAME_CHECK_ERROR,
											  RX_ERROR_LENGTH_ERROR,
											  RX_ERROR_WRONG_DST_ADDR_ERROR,
											  RX_ERROR_TRANSMISSION_ERROR);

------------------------
--   RX STATE CODES   --
------------------------

type mac_1g_rx_state_code_type is (RX_STATE_IDLE,
                                   RX_STATE_PRE,
								           RX_STATE_FD,
											  RX_STATE_WAIT_FOR_SHIFT_REG,
        								     RX_STATE_DST_ADDR,
			        					     RX_STATE_SRC_ADDR,
						        		     RX_STATE_LENGTH_TYPE,
						          		  RX_STATE_DATA,
											  RX_STATE_TIME_SHIFT,
											  RX_STATE_END_OF_FRAME,
											  RX_STATE_WAIT_FOR_FRAME_END);

-------------------
--   RX OUTPUT   --
-------------------

type mac_1g_rx_hdr_type is record
   rx_dst_addr    : std_logic_vector(47 downto 0);
	rx_src_addr    : std_logic_vector(47 downto 0);
	rx_length_type : std_logic_vector(15 downto 0);
end record;

type mac_1g_rx_frame_type is record
   rx_hdr         : mac_1g_rx_hdr_type;
	rx_data        : std_logic_vector(7 downto 0);
	rx_fcs         : std_logic_vector(31 downto 0);
end record;

type mac_1g_rx_data_interface_type is record
	rx_dv         : std_logic;
	rx_er         : std_logic;
	rx_frame      : mac_1g_rx_frame_type;
end record;

type mac_1g_rx_state_info_interface_type is record
   state_code    : mac_1g_rx_state_code_type;
	error_code    : mac_1g_rx_error_code_type;
end record;

end MAC_1G_types;

package body MAC_1G_types is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end MAC_1G_types;
