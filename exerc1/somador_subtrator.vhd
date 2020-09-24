library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity somador_subtrator is
        generic(n:integer := 8);
        port(A, B: in   std_logic_vector(n-1 downto 0);
            sel: in     std_logic;
            S: out      std_logic_vector(n-1 downto 0);
            cout: out   std_logic);
end somador_subtrator;

architecture comportamento of somador_subtrator is
    Signal exA, exB, exS: std_logic_vector(n downto 0);
begin
    exA <=  '0' & A;
    exB <=  '0' & B;

    exS <=  exA + exB               when sel = '0' else
            exA + ((not exB) + sel);

    S <=    exS(n-1 downto 0);
    cout <= exS(n);

end comportamento;
