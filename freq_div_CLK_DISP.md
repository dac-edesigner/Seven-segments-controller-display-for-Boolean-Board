# **Divisor de frecuencia para el control de display de 7 segmentos en BOOLEAN BOARD.**

Este divisor defrecuencia va a dividir la frecuencia del reloj de la BOOLEAN BOARD de 100 MHz a una frecuencia entre 250 Hz y 10 kHz como recomienda RealDigital en su documentación concretamente en la página sobre el [control del display de 7 segmentos](https://www.realdigital.org/doc/586fb4c3326dcd493a5774b2a6050f41).

La frecuencia objetivo que se marca para este proyecto es de 500 Hz, por ello debe dividirse la frecuencia por 200000. En terminos de periodos la frecuencia de reloj de 100 MHz tiene un periodo de 10ns, un semiperiodo de 5ns, mientras que el periodo de la señal de 500Hz es de 2ms, 1ms de semiperiodo. 

El código resultante de la implementación del divisor de frecuencia se muestra a continuación, tras el se aclararán ciertas cuestiones que pueden ser de interes.

```VHDL
----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 18:25:57
-- Design Name: Boolean Board 7 Segments Display controller
-- Module Name: CLK_DISP - Behavioral
-- Project Name: Boolean Board 7 Segments Display controller
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLK_DISP is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           CLK_DISPLAY : out STD_LOGIC);
end CLK_DISP;

architecture Behavioral of CLK_DISP is

constant count_limit : integer := 200000/2; -- Value to clock divide to achieve a frequenvy of 500Hz, could be modified. It is divided by to because 200000 make reference to the period and the clk wave sould be change each semi period.
signal count: integer:=1;
signal aux : std_logic := '0';

begin
process(clk,reset)
begin
    if (reset = '1') then
        count <= 1;
        aux<= '0';
    elsif (clk'event and clk = '1') then
        count <= count+1;
        if (count = count_limit) then
            aux <= NOT aux;
            count <= 1;
        end if;
    end if;
CLK_DISPLAY <= aux;
end process;


end Behavioral;

```

Se observa en el código la declaración y uso de la siguiente constante:
```VHDL
constant count_limit : integer := 200000/2;
``` 

Este valor constante se utiliza para poder modificar de forma sencilla la división de frecuencia. Pudiendo utilizarse esta misma implementación para otras posibles divisiones de frecuencia únicamente modificando el valor de esta constante. También pude utilizarse para la misma aplicación y utilizar la frecuncia para controlar la intensidad de brillo de los displays.

El valor se encuentra dividido por 2 ya que se ha escrito el valor por el que es necesario dividir la freciencia para obtener la frecuencia de reloj deseada, pero el control, el cambio de la salida del reloj debe hacerse, no en el periodo de la señal sino en el semiperiodo. Por tanto, esa división por dos es necesaria tal y como está asignado/definido el valor.

El código para la simulación de la descripción hardware anteriore es el siguiente:

```VHDL
----------------------------------------------------------------------------------
-- Company: DAC-EDESIGNER
-- Engineer: Diego Antolín Cañada
-- 
-- Create Date: 13.08.2024 18:37:21
-- Design Name: Boolean Board 7 Segments Display controller
-- Module Name: tb_CLK_DISP - Behavioral
-- Project Name: Boolean Board 7 Segments Display controller
-- Target Devices: Boolean Board
-- Tool Versions: Vivado 2024.1
-- Description: 
-- 
-- Dependencies: CLK_DISP.vhd
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

entity tb_CLK_DISP is
    --Port ( );
end tb_CLK_DISP;

architecture Behavioral of tb_CLK_DISP is

component CLK_DISP
    port (
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       CLK_DISPLAY : out STD_LOGIC
    );
end component;

-- Stimulus inputs
signal clkS, resetS : std_logic;
--Stimulus outputs
signal CLK_DISPLAYS : std_logic;

begin

-- Instantiate the Unit Under Test (UUT)
uut: CLK_DISP PORT MAP (
    reset => resetS,
    clk => clkS,
    CLK_DISPLAY => CLK_DISPLAYS
);

-- Stimulus process
stim_proc: process
begin
    resetS <= '0';
    clkS <= '0';
    wait for 5 ns;
    clkS <= '1';
    wait for 5 ns;
end process;

end Behavioral;
```

En este códgo podemos destacar la necesidad de dar el valor correcto al periodo o semiperiodo del reloj para obtener una frecuencia de reloj que simule  el valor de clk físico de la tarjeta que estemos utilizando, en esta caso la BOOLEAN BOARD. Como ya se ha citado esta frecuencia es de 100MHz por lo que su periodo es de 10ns y el semiperiodo de 5ns. Es por ello que en el proceso que controla los estímulos que se muestra a continuación en la instrucción 
```VHDL 
wait for 5 ns;
``` 
Se utiliza el valor del semiperiodo de la frecuencia de 100MHz.

El código completo del proceso que controla los estimulos se muestra a continuación.
```VHDL
-- Stimulus process
stim_proc: process
begin
    resetS <= '0';
    clkS <= '0';
    wait for 5 ns;
    clkS <= '1';
    wait for 5 ns;
end process;

end Behavioral;
```
Finalmente, se muestra el resultado de la simulación del circuito. En la imagen se puede observar como se han añadido dos marcadores que permiten verificar que el periodo de la señal de salida **CLK_DISP** tiene un periodo de 2ms, es decir, una frecuencia de 500Hz.
![Gráfica de simulación](/images/sim_freq_divider.png "Simulación del divisor de frecuencia para la obtención del reloj del control del Display de 7 segmentos.")