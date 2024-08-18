----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: 
-- 
-- Create Date: 13.08.2024 17:32:49
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: tb_mux4inBUS4 - Behavioral
-- Project Name:  Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: mux4inBUS4.vhd
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

entity tb_mux_4in_BUS_4line is
--  Port ( );
end tb_mux_4in_BUS_4line;

architecture Behavioral of tb_mux_4in_BUS_4line is

component mux_4in_BUS_4line
    port (
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component; 

-- Stimulus inputs
signal aS,bS,cS,dS : std_logic_vector(3 downto 0) := (others => '0');
signal sS : std_logic_vector(1 downto 0) := (others => '0');
 
--Stimulus outputs
signal yS : std_logic_vector(3 downto 0) := (others => '0');

begin
-- Instantiate the Unit Under Test (UUT)
uut: mux_4in_BUS_4line PORT MAP (
    a => aS,
    b => bS,
    c => cS,
    d => dS,
    s => sS,
    y => yS
);
 
-- Stimulus process
stim_proc: process
begin
    aS <= "0000";
    bS <= "0000";
    cS <= "0000";
    dS <= "0000";
    sS <= "00";
    wait for 100 ns;
    
    aS <= "1000";
    bS <= "0000";
    cS <= "1001";
    dS <= "0000";
    sS <= "00";
    wait for 100 ns;
    
    aS <= "1000";
    bS <= "0000";
    cS <= "1001";
    dS <= "0101";
    sS <= "10";
    wait for 100 ns;
    
    aS <= "1000";
    bS <= "0010";
    cS <= "1001";
    dS <= "0110";
    sS <= "10";
    wait for 100 ns;
    
    aS <= "1000";
    bS <= "0010";
    cS <= "1001";
    dS <= "0110";
    sS <= "01";
    wait for 100 ns;
    
    aS <= "1000";
    bS <= "0010";
    cS <= "1001";
    dS <= "0110";
    sS <= "11";
    wait for 100 ns;
    
    aS <= "0111";
    bS <= "0010";
    cS <= "1001";
    dS <= "0110";
    sS <= "00";
    wait for 100 ns;
    
    aS <= "0111";
    bS <= "0010";
    cS <= "1001";
    dS <= "1110";
    sS <= "11";
    wait for 100 ns;
    
    aS <= "0111";
    bS <= "0010";
    cS <= "0011";
    dS <= "0110";
    sS <= "10";
    wait for 100 ns;
    
    aS <= "1111";
    bS <= "0010";
    cS <= "1001";
    dS <= "0110";
    sS <= "00";
    wait for 100 ns;
end process;

end Behavioral;
