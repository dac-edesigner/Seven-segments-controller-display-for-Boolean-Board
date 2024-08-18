# **Multiplexor de cuatro canales de entrada, 2 líneas de control y buses de cuatro líneas por canal.**

El código que describe el comportamiento del multiplexor y que se ha utilizado para la implementación se describe a continuación. La particularidad de este mulplexor se encuentra en que tanto la entrada como la salidad de datos se realiza mediante buses de cuatro líneas.

```VHDL
----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 17:25:16
-- Design Name:  Boolean Board 7 Segments Display controller
-- Module Name: mux4inBUS4 - Behavioral
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

entity mux4inBUS4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end mux4inBUS4;

architecture Behavioral of mux4inBUS4 is

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
```

El código que permite simular el componenete anteriormente descrito se encuentra a continuación.

```VHDL
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

entity tb_mux4inBUS4 is
--  Port ( );
end tb_mux4inBUS4;

architecture Behavioral of tb_mux4inBUS4 is

component mux4inBUS4
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
uut: mux4inBUS4 PORT MAP (
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
```