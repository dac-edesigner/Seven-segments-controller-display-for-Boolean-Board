----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER 
-- Engineer: Diego Antolín Cañada 
-- 
-- Create Date: 14.08.2024 13:29:46
-- Design Name: Boolean Board 7 Segments Display controller
-- Module Name: boolean_FPGA_connection - Behavioral
-- Project Name: Boolean Board 7 Segments Display controller
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

entity boolean_FPGA_connection is
  Port (    clk : in STD_LOGIC;
            sw : in STD_LOGIC_VECTOR (15 downto 0);
            btn : in STD_LOGIC_VECTOR (3 downto 0);
            D0_SEG : out STD_LOGIC_VECTOR (7 downto 0);
            D0_AN : out STD_LOGIC_VECTOR (3 downto 0)   
        );
end boolean_FPGA_connection;

architecture Behavioral of boolean_FPGA_connection is

component LCD_display_controller
    port (
           clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           a_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           b_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           c_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           d_bcd : in STD_LOGIC_VECTOR (3 downto 0);
           number_digits : in STD_LOGIC_VECTOR (1 downto 0);
           an_com : out STD_LOGIC_VECTOR (3 downto 0);
           seven_seg : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;


signal clkS: STD_LOGIC;
signal resetS: STD_LOGIC;
signal number_digitsS : STD_LOGIC_VECTOR (1 downto 0);
signal an_comS : STD_LOGIC_VECTOR (3 downto 0);
signal seven_segS : STD_LOGIC_VECTOR (6 downto 0);

begin

LCD_controller_Inst : LCD_display_controller
port map 
    (
        clk => clkS,
        reset =>resetS,
        a_bcd => sw(3 downto 0),
        b_bcd => sw(7 downto 4),
        c_bcd => sw(11 downto 8),
        d_bcd => sw(15 downto 12),
        number_digits => number_digitsS,
        an_com => an_comS,
        seven_seg => seven_segS
    );

resetS <= btn(0);
number_digitsS(0) <= btn(1);
number_digitsS(1) <= btn(2);
clkS <= clk;
D0_SEG (6 downto 0) <= seven_segS;
D0_SEG (7)<='1'; -- To turn off the decimal point on display
D0_AN <= an_comS;

end Behavioral;
