----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 14.08.2024 16:04:36
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: tb_boolean_FPGA_connection - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: boolean_FPGA_connection.vhd
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

entity tb_boolean_FPGA_connection is
--  Port ( );
end tb_boolean_FPGA_connection;

architecture Behavioral of tb_boolean_FPGA_connection is

component boolean_FPGA_connection
    port (
            clk : in STD_LOGIC;
            sw : in STD_LOGIC_VECTOR (15 downto 0);
            btn : in STD_LOGIC_VECTOR (3 downto 0);
            D0_SEG : out STD_LOGIC_VECTOR (7 downto 0);
            D0_AN : out STD_LOGIC_VECTOR (3 downto 0) 
    );
end component;

-- Stimulus inputs
signal clkS : std_logic:='1';
signal swS : std_logic_vector(15 downto 0) := (others => '0');
signal btnS : std_logic_vector(3 downto 0) := (others => '0');
 
--Stimulus outputs
signal D0_SEGS : std_logic_vector(7 downto 0);
signal D0_ANS : std_logic_vector(3 downto 0);

begin
uut: boolean_FPGA_connection -- unit under test
    port map 
    (
        clk => clkS,
        btn =>btnS,
        sw => swS,
        D0_SEG => D0_SEGS,
        D0_AN => D0_ANS
    );
    
    --clock signal definition
    clkS <= NOT clkS AFTER 1 ms;
    
    -- Stimulus process
    stim_proc: process
    begin
        swS(3 downto 0)<="1001";
        swS(7 downto 4)<="1000";
        swS(11 downto 8)<="0111";
        swS(15 downto 12)<="0110";
        btnS(0)<='0';
        btnS(2 downto 1)<= "11";
        wait for 100 ms;
        btnS(2 downto 1)<= "01";
        wait for 10 ns;
    end process;

end Behavioral;
