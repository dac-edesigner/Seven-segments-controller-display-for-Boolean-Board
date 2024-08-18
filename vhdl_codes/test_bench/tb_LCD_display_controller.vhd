----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 14.08.2024 12:03:01
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: tb_LCD_display_controller - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: LCD_display_controller.vhd
-- 
-- Revision: 1.0
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

entity tb_LCD_display_controller is
--  Port ( );
end tb_LCD_display_controller;

architecture Behavioral of tb_LCD_display_controller is

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

-- Stimulus Input Signals
signal clkS : STD_LOGIC := '0';
signal resetS: STD_LOGIC := '0';
signal a_bcdS : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal b_bcdS : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal c_bcdS : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal d_bcdS : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal number_digitsS : STD_LOGIC_VECTOR (1 downto 0):= (others => '1');


-- Stimulus Outputs Signals
signal an_comS : STD_LOGIC_VECTOR (3 downto 0);
signal seven_segS : STD_LOGIC_VECTOR (6 downto 0);


begin
uut: LCD_display_controller -- unit under test
    port map 
    (
        clk => clkS,
        reset => resetS,
        a_bcd => a_bcdS,
        b_bcd => b_bcdS,
        c_bcd => c_bcdS,
        d_bcd => d_bcdS,
        number_digits => number_digitsS,
        an_com => an_comS,
        seven_seg => seven_segS
    );
    
    --clock signal definition
    clkS <= NOT clkS AFTER 1 ns;
    
    -- Stimulus process
    stim_proc: process
    begin
        a_bcdS <= "1001";
        b_bcdS <= "1001";
        c_bcdS <= "1001";
        d_bcdS <= "1001";
        resetS <= '0';
        number_digitsS <= "10";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        
        a_bcdS <= "1001";
        b_bcdS <= "1001";
        c_bcdS <= "1001";
        d_bcdS <= "1001";
        resetS <= '0';
        number_digitsS <= "11";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        a_bcdS <= "1001";
        b_bcdS <= "1000";
        c_bcdS <= "0111";
        d_bcdS <= "0101";
        wait for 10 ms;
        
    end process;

end Behavioral;
