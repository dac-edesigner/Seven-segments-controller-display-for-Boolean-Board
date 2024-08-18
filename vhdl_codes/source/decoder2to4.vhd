----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 14.08.2024 00:50:04
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: dedoder2to4 - Behavioral
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

entity decoder2to4 is
    Port (  s : in STD_LOGIC_VECTOR (1 downto 0);
            out_line : out STD_LOGIC_VECTOR (3 downto 0));
end decoder2to4;

architecture Behavioral of decoder2to4 is

begin

process(s)
begin
    case s is
        when "00" => out_line <= "1110";
        when "01" => out_line <= "1101";
        when "10" => out_line <= "1011";
        when "11" => out_line <= "0111";
        when others => out_line <= "1110";
    end case;
end process;

end Behavioral;
