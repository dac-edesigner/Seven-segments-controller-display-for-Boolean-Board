----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 16:57:38
-- Design Name: Boolean Board 7 Segments Display controller
-- Module Name: tb_BCD7seg - Behavioral
-- Project Name: Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board 
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: BCD7seg.vhd
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

entity tb_BCD7seg is
    
end tb_BCD7seg;

architecture Behavioral of tb_BCD7seg is

component BCD7seg
port (
   BCDctrl : in STD_LOGIC_VECTOR (3 downto 0);
   seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0)
);
end component;

-- Stimulus inputs
signal BCDctrlS : std_logic_vector(3 downto 0) := (others => '0');
--Stimulus outputs
signal seven_seg_outS : std_logic_vector(6 downto 0);

begin

-- Instantiate the Unit Under Test (UUT)
uut: BCD7seg PORT MAP (
    BCDctrl => BCDctrlS,
    seven_seg_out => seven_seg_outS
);
 
-- Stimulus process
stim_proc: process
begin
    BCDctrlS <= "0000";
    wait for 100 ns;
    BCDctrlS <= "0001";
    wait for 100 ns;
    BCDctrlS <= "0010";
    wait for 100 ns;
    BCDctrlS <= "0011";
    wait for 100 ns;
    BCDctrlS <= "0100";
    wait for 100 ns;
    BCDctrlS <= "0101";
    wait for 100 ns;
    BCDctrlS <= "0110";
    wait for 100 ns;
    BCDctrlS <= "0111";
    wait for 100 ns;
    BCDctrlS <= "1000";
    wait for 100 ns;
    BCDctrlS <= "1001";
    wait for 100 ns;
end process;

end Behavioral;
