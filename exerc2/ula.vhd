library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ula is
    generic(n:integer := 8);
    port(A, B: in   std_logic_vector(n-1 downto 0);
        opcode: in  std_logic_vector(2 downto 0);
        S: out      std_logic_vector(n-1 downto 0);
        cout: out   std_logic);
end ula;

architecture comportamento of ula is
    Signal exA, exB, exS, ex0:   std_logic_vector(n downto 0);
begin
    exA <=  '0' & A;
    exB <=  '0' & B;
    ex0 <=  (others => '0');

    exS <=  exA + exB           when opcode = "000" else
            exA + ((not B) + 1) when opcode = "001" else
            exA or exB          when opcode = "010" else
            exA and exB         when opcode = "011" else
            not exA             when opcode = "100" else
            ex0 + 1             when opcode = "101" and A<B else
            (others => '0');

    S <=    exS(n-1 downto 0);
    cout <= exs(n);
end comportamento;
