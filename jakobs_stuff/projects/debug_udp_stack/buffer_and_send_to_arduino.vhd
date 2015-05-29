----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:53 05/19/2015 
-- Design Name: 
-- Module Name:    buffer_and_send_to_arduino - Behavioral 
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

entity buffer_and_send_to_arduino is
port (
	clk                  : in std_logic;
	reset                : in std_logic;
	start                : in std_logic;
   -- data interface
	d_in                 : in std_logic_vector(7 downto 0);
	dv                   : in std_logic;
	-- arduino interface
	serial_txd_out       : out std_logic_vector(3 downto 0);
	serial_en_out        : out std_logic;
	serial_clk_out       : out std_logic);
end buffer_and_send_to_arduino;

architecture Behavioral of buffer_and_send_to_arduino is

   COMPONENT frame_logger
   PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         start : IN  std_logic;
         dv : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         last_address : OUT  std_logic_vector(10 downto 0);
         ram_en : IN  std_logic;
         ram_addr : IN  std_logic_vector(10 downto 0);
         ram_dout : OUT  std_logic_vector(7 downto 0);
         ext_ram_read_en : OUT  std_logic
        );
   END COMPONENT;
	 
	COMPONENT send_to_arduino
   PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         ram_ready : IN  std_logic;
         ram_addr_rd : OUT  std_logic_vector(10 downto 0);
         ram_en : OUT  std_logic;
         ram_data : IN  std_logic_vector(7 downto 0);
         ram_last_addr : IN  std_logic_vector(10 downto 0);
         so_txd_out : OUT  std_logic_vector(3 downto 0);
         so_en_out : OUT  std_logic;
         so_clk_out : OUT  std_logic
        );
   END COMPONENT;
	
-- frame_logger Inputs
signal fl_reset : std_logic := '0';
signal fl_clk : std_logic := '0';
signal fl_start : std_logic := '0';
signal fl_dv : std_logic := '0';
signal fl_din : std_logic_vector(7 downto 0) := (others => '0');
signal fl_ram_en : std_logic := '0';
signal fl_ram_addr : std_logic_vector(10 downto 0) := (others => '0');

-- frame_logger Outputs
signal fl_last_address : std_logic_vector(10 downto 0);
signal fl_ram_dout : std_logic_vector(7 downto 0);
signal fl_ext_ram_read_en : std_logic;
	
-- send_to_arduino Inputs
signal sta_clk : std_logic := '0';
signal sta_reset : std_logic := '0';
signal sta_ram_ready : std_logic := '0';
signal sta_ram_data : std_logic_vector(7 downto 0) := (others => '0');
signal sta_ram_last_addr : std_logic_vector(10 downto 0) := (others => '0');

-- send_to_arduino Outputs
signal sta_ram_addr_rd : std_logic_vector(10 downto 0);
signal sta_ram_en : std_logic;
signal sta_so_txd_out : std_logic_vector(3 downto 0);
signal sta_so_en_out : std_logic;
signal sta_so_clk_out : std_logic;

-- system
signal HIGH             : std_logic;
signal LOW              : std_logic;


begin

frame_logger_comp: frame_logger 
PORT MAP (-- inputs
          reset => fl_reset,
          clk => fl_clk,
          start => fl_start,  -- starts the logging-proccess
          dv => fl_dv,        -- data valid
          din => fl_din,      -- data in
			 ram_en => fl_ram_en,
          ram_addr => fl_ram_addr,
			 -- outputs
          last_address => fl_last_address,
          ram_dout => fl_ram_dout,
          ext_ram_read_en => fl_ext_ram_read_en);
		  
send_to_arduino_comp: send_to_arduino 
PORT MAP (-- system inputs
          clk => sta_clk,
          reset => sta_reset,
			 -- ram interface
			    -- inputs
          ram_ready => sta_ram_ready,
			 ram_data => sta_ram_data,
          ram_last_addr => sta_ram_last_addr,
			    -- outputs
          ram_addr_rd => sta_ram_addr_rd,
          ram_en => sta_ram_en,
			 -- serial interface outputs
          so_txd_out => sta_so_txd_out,     -- data out
          so_en_out => sta_so_en_out,       -- en out
          so_clk_out => sta_so_clk_out);    -- clk out
			 
   -- mapping system signals
	fl_reset  <= reset;
	sta_reset <= reset;
	fl_clk    <= clk;
	sta_clk   <= clk;
	
	
	-- mapping between components
	-- frame_logger -> send_to_arduino
	sta_ram_ready <= fl_ext_ram_read_en;
	sta_ram_data <= fl_ram_dout;
	sta_ram_last_addr <= fl_last_address;
	-- send_to_arduino -> frame_logger
	fl_ram_en <= sta_ram_en;
	fl_ram_addr <= sta_ram_addr_rd;
	
	-- send_to_arduino
	serial_txd_out <= sta_so_txd_out;
	serial_en_out  <= sta_so_en_out;
	serial_clk_out <= sta_so_clk_out;
	-- frame_logger
	fl_start       <= start;
	fl_dv          <= dv;
	fl_din         <= d_in;

end Behavioral;

