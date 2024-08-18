----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 18:25:57
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: CLK_DISP - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLK_DISP is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           CLK_DISPLAY : out STD_LOGIC);
end CLK_DISP;

architecture Behavioral of CLK_DISP is

constant count_limit : integer := 200000/2; -- Value to clock divide to achieve a frequenvy of 500Hz, could be modified. It is divided by to because 200000 make reference to the period and the clk wave sould be change each semi period.
signal count: integer:=1;
signal aux : std_logic := '0';

begin
process(clk,reset)
begin
    if (reset = '1') then
        count <= 1;
        aux<= '0';
    elsif (clk'event and clk = '1') then
        count <= count+1;
        if (count = count_limit) then
            aux <= NOT aux;
            count <= 1;
        end if;
    end if;
CLK_DISPLAY <= aux;
end process;


end Behavioral;
