----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 17:25:16
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: mux_4in_4line - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: Not exist
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

entity mux_4in_BUS_4line is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end mux_4in_BUS_4line;

architecture Behavioral of mux_4in_BUS_4line is

begin
process(a,b,c,d,s)
begin
    case s is
        when "00" => y <= a;
        when "01" => y <= b;
        when "10" => y <= c;
        when "11" => y <= d;
        when others => y <= a;
    end case;

end process;

end Behavioral;
