----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 14.08.2024 11:28:04
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: LCD_display_controller - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: Not exist
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_display_controller is
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           a_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           b_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           c_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           d_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           number_digits : in STD_LOGIC_VECTOR (1 downto 0);
           an_com : out STD_LOGIC_VECTOR (3 downto 0);
           seven_seg : out STD_LOGIC_VECTOR (6 downto 0)
           );
           
end LCD_display_controller;

architecture Behavioral of LCD_display_controller is

component CLK_DISP
    port (
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       CLK_DISPLAY : out STD_LOGIC
    );
end component;

component two_bits_counter
    port (
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           count_limit: in STD_LOGIC_VECTOR (1 downto 0);
           count : out STD_LOGIC_VECTOR (1 downto 0)
    );
end component;

component decoder2to4
    port (
           s : in STD_LOGIC_VECTOR (1 downto 0);
           out_line : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component; 

component mux_4in_BUS_4line
    port (
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component; 
 
component BCD7seg
port (
   BCDctrl : in STD_LOGIC_VECTOR (3 downto 0);
   seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0)
);
end component;

--Common signals
signal clkS, resetS : std_logic;

-- Clock display signals
signal CLK_DISPLAYS : std_logic;

 -- Two Bits Counter signals.
signal countS, count_limitS:std_logic_vector(1 downto 0):= "00";

--decoder signals
signal out_lineS : std_logic_vector(3 downto 0):= "0000";

-- Mulpliplexer signals
signal aS,bS,cS,dS : std_logic_vector(3 downto 0) := (others => '0');
signal yS : std_logic_vector(3 downto 0) := (others => '0');

-- SevenSegments signals
signal seven_seg_outS : std_logic_vector(6 downto 0);

begin
-- Instantiate clock display
clk_display_inst: CLK_DISP 
    port map 
    (
        reset => resetS,
        clk => clk,
        CLK_DISPLAY => CLK_DISPLAYS
    );
    
-- Instantiate two bits counter
two_bits_count_inst: two_bits_counter -- unit under test
    port map 
    (
        clk => CLK_DISPLAYS,
        reset =>resetS,
        count_limit => count_limitS,
        count => countS
    );

-- Instantiate anode control display
anode_control_dec_inst: decoder2to4 -- unit under test
    port map 
    (
        s => countS,
        out_line => out_lineS
    );

-- Instantiate 4 channels 4 line bus multiplexter
MuxInst: mux_4in_BUS_4line
    port map 
    (
        a => aS,
        b => bS,
        c => cS,
        d => dS,
        s => countS,
        y => yS    
    );

-- Instantiate BCD 7 segments decoder
seven_segments_inst: BCD7seg  
    port map 
    (
        BCDctrl => yS,
        seven_seg_out => seven_seg_outS
    );

seven_seg <= seven_seg_outS;
an_com <= out_lineS;
count_limitS <= number_digits;
resetS <=reset;
aS <= a_bcd;
bS <= b_bcd;
cS <= c_bcd;
dS <= d_bcd;

end Behavioral;