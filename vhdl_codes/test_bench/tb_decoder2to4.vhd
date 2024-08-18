----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 14.08.2024 00:54:57
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: tb_decoder2to4 - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: dedoder2to4.vhd
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

entity tb_decoder2to4 is
    --Port ( );
end tb_decoder2to4;

architecture Behavioral of tb_decoder2to4 is

component decoder2to4
    port (
           s : in STD_LOGIC_VECTOR (1 downto 0);
           out_line : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component; 

-- Stimulus inputs   
signal sS : std_logic_vector (1 downto 0) := "00";

-- Stimulus outputs
signal out_lineS : std_logic_vector(3 downto 0):= "0000";


begin
uut: decoder2to4 -- unit under test
    port map 
    (
        s => sS,
        out_line => out_lineS
    );
    
    -- Stimulus process
    stim_proc: process
    begin
        sS <= "00";
        wait for 10 ns;
        sS <= "01";
        wait for 10 ns;
        sS <= "10";
        wait for 10 ns;
        sS <= "11";
        wait for 10 ns;
    end process;

end Behavioral;
