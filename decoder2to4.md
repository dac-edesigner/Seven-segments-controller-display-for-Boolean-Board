# **Decodificador de 2 líneas de control y 4 líneas de salida.**

Como se describe en la web de RealDigital en la sección donde se describa como implementar el [controlador para el display de 7 Segmentos](https://www.realdigital.org/doc/586fb4c3326dcd493a5774b2a6050f41) cuyo esquema podemos ver a continuación:
 ![Figura 1](https://www.realdigital.org/img/09d82c4ea8e733af88810690bec61669.svg "Esquema de circuito de control para el display de 7 segmentos").

 El decodificador permite controlar cual de los displays se encuentra activo al poner en corte los transistores BJT PNP que se muestran en el esquma sigiuente que se muestra en  [Referemce Manual](https://www.realdigital.org/doc/02013cd17602c8af749f00561f88ae21#seven-segment-display). 
 ![Display de 7 segmentos](https://www.realdigital.org/img/2dc532b24a856b2a0acc7a4f2322f04f.svg "Conexión de la FPGA y los display de 7 segmentos.").

El código que describe el comportamiento del circuito es el siguiente.

```VHDL
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
```

El código del banco de pruebas que permite verificar el funcionamiento del componente anteriormente descrito se encuentra a continuación.

```VHDL
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
```