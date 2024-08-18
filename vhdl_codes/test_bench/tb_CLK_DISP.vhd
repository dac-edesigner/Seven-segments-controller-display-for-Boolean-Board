----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 18:37:21
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: tb_CLK_DISP - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: 
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

entity tb_CLK_DISP is
    --Port ( );
end tb_CLK_DISP;

architecture Behavioral of tb_CLK_DISP is

component CLK_DISP
    port (
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       CLK_DISPLAY : out STD_LOGIC
    );
end component;

-- Stimulus inputs
signal clkS, resetS : std_logic;
--Stimulus outputs
signal CLK_DISPLAYS : std_logic;

begin

-- Instantiate the Unit Under Test (UUT)
uut: CLK_DISP PORT MAP (
    reset => resetS,
    clk => clkS,
    CLK_DISPLAY => CLK_DISPLAYS
);

-- Stimulus process
stim_proc: process
begin
    resetS <= '0';
    clkS <= '0';
    wait for 5 ns;
    clkS <= '1';
    wait for 5 ns;
end process;

end Behavioral;
