----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 20:23:40
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: tb_twoBitsCounter - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: twoBitsCounter.vhd
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

entity tb_two_bits_counter is
--  Port ( );
end tb_two_bits_counter;

architecture Behavioral of tb_two_bits_counter is

component two_bits_counter
    port (
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           count_limit: in STD_LOGIC_VECTOR (1 downto 0);
           count : out STD_LOGIC_VECTOR (1 downto 0)
    );
end component; 

 -- Stimulus inputs   
signal resetS,clkS: std_logic := '0';

-- Stimulus outputs
signal countS, count_limitS:std_logic_vector(1 downto 0):= "00";
    
begin
uut: two_bits_counter -- unit under test
    port map 
    (
        clk => clkS,
        reset =>resetS,
        count_limit => count_limitS,
        count => countS
    );
    
    --clock signal definition
    clkS <= NOT clkS AFTER 10 ns;
    
    -- Stimulus process
    stim_proc: process
    begin
        resetS <= '1';
        count_limitS <= "11";
        wait for 100 ns;
        count_limitS <= "01";
        wait for 100 ns;
    end process;

end Behavioral;
