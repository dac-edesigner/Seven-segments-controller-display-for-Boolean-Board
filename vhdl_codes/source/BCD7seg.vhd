----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 16:53:43
-- Design Name: Boolean Board 7 Segments Display controller
-- Module Name: BCD7seg - Behavioral
-- Project Name: Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board
-- Tool Versions: Vivado 2024.1
-- Description: not enabled for decimal point control
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

entity BCD7seg is
    Port ( BCDctrl : in STD_LOGIC_VECTOR (3 downto 0);
           seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end BCD7seg;

architecture Behavioral of BCD7seg is

begin

process(BCDctrl)
begin
 
case BCDctrl is
    when "0000" => seven_seg_out <= "1000000"; ---0
    when "0001" => seven_seg_out <= "1111001"; ---1
    when "0010" => seven_seg_out <= "0100100"; ---2
    when "0011" => seven_seg_out <= "0110000"; ---3
    when "0100" => seven_seg_out <= "0011001"; ---4
    when "0101" => seven_seg_out <= "0010010"; ---5
    when "0110" => seven_seg_out <= "0000010"; ---6
    when "0111" => seven_seg_out <= "1111000"; ---7
    when "1000" => seven_seg_out <= "0000000"; ---8
    when "1001" => seven_seg_out <= "0010000"; ---9
    when others => seven_seg_out <= "1111111"; ---null
end case;
 
end process;

end Behavioral;
