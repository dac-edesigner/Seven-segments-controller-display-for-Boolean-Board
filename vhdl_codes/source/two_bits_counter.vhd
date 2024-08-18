----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 23:49:49
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: two_bits_counter - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: Not exits
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity two_bits_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           count_limit : in STD_LOGIC_VECTOR (1 downto 0);
           count : out STD_LOGIC_VECTOR (1 downto 0));
end two_bits_counter;

architecture Behavioral of two_bits_counter is

--This constant can be used to set the count limit value in a fixed way, for this purpose it is necessary to comment out the input port count_limit
--constant count_limit : std_logic_vector(1 downto 0) := "01"; 

signal countS: std_logic_vector(1 downto 0);

begin

process(clk,reset)
    begin
        if (reset = '1') then
            countS <= "00";
        elsif( clk'event and clk = '1') then           
            if (countS < count_limit) then
                countS <= countS + "01";
            else
                countS <= "00";
            end if;    
        end if;
    end process;
count <= countS;

end Behavioral;
