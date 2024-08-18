## **Decodificacor BCD 7 segmentos.**

La descripción hardware de este componenete se ha hecho siguieno la descripción del funcionamiento del display de la documentación proporcionada por RealDigital sobre el [display de 7 segmentos](https://www.realdigital.org/doc/02013cd17602c8af749f00561f88ae21#seven-segment-display). O bien en la infomación proporcionada para el desarrollo del [controlador para el display de 7 Segmentos](https://www.realdigital.org/doc/586fb4c3326dcd493a5774b2a6050f41).

En la Figura siguiente podemos ver como está conectada la FPGA a los dos display que se encuentran en la Boolean Board.
![Display de 7 segmentos](https://www.realdigital.org/img/2dc532b24a856b2a0acc7a4f2322f04f.svg "Conexión de la FPGA y los display de 7 segmentos.").

Aunque pueda parecer en primera instancia que es neceario realizar la descripción hardware para el control de ambos display o que es necesario realizar una descripción que englobe a ambos, esto es un error ya que no es un diseño modular y gerarquizado.

Otra estrategia mejor es diseñar un controlador para uno de los display que podamos instanciar tantas veces como necesitemos. En el caso de esta tardeja el máximo serían dos.

En esta imágen también podemos observar cual es la númeración de los segmentos para poder desarrollar la descripción hardware del decodificar BCD 7 segmentos.

Por otro lado, si vamos a la imagen donde se representa el decodificador BCD 7 segmentos podemos ver cómo es este decodificador, es decir, con sus salidas activas en nivel bajo. También vemos cual es la conexión del decodificador y el display ![decodificador BCD 7 Segmentos](https://www.realdigital.org/img/48ab4f6b32ae0b47e5d4c519f6ce7c9b.svg "Decodificador BCD 7 segmentos.").

Siguiendo la documentación proporcionada la descripción en VHDL del decodificar puede quedar de la siguiente manera.

```VHDL
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

```

Para verificar el comportamiento de este componente de manera individual se ha generado su propio test bench el cual se muestra a continuación.

```VHDL
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
```