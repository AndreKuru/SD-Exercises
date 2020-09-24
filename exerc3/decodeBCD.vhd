library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;

entity decodBCD is
    port(A,B,C,D: in    std_logic;
        S: out          std_logic_vector(6 downto 0));
end decodBCD;

architecture behavior of decodBCD is
    constant s0 : std_logic_vector(6 downto 0) := "0111111";
    constant s1 : std_logic_vector(6 downto 0) := "0000110";
    constant s2 : std_logic_vector(6 downto 0) := "1011011";
    constant s3 : std_logic_vector(6 downto 0) := "1001111";
    constant s4 : std_logic_vector(6 downto 0) := "1100110";
    constant s5 : std_logic_vector(6 downto 0) := "1101101";
    constant s6 : std_logic_vector(6 downto 0) := "1111100";
    constant s7 : std_logic_vector(6 downto 0) := "0000111";
    constant s8 : std_logic_vector(6 downto 0) := "1111111";
    constant s9 : std_logic_vector(6 downto 0) := "1100111";
    constant sA : std_logic_vector(6 downto 0) := "1110111";
    constant sC : std_logic_vector(6 downto 0) := "0111001";
    constant sE : std_logic_vector(6 downto 0) := "1111001";
    constant sF : std_logic_vector(6 downto 0) := "1110001";
    constant sG : std_logic_vector(6 downto 0) := "1111101";

    Signal abcd : std_logic_vector(3 downto 0);
begin
    abcd <= A & B & C & D;

    S    <= s0 when abcd = "0000" else
            s1 when abcd = "0001" else
            s1 when abcd = "0010" else
            s2 when abcd = "0011" else
            s3 when abcd = "0100" else
            s4 when abcd = "0101" else
            s5 when abcd = "0110" else
            s6 when abcd = "0111" else
            s7 when abcd = "1000" else
            s8 when abcd = "1001" else
            s9 when abcd = "1010" else
            sA when abcd = "1011" else
            sC when abcd = "1100" else
            sE when abcd = "1101" else
            sF when abcd = "1110" else
            sG;
end behavior;
