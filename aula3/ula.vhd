library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ula is
        generic(n: integer := 8);
        port(a,b: in 									std_logic_vector(n-1 downto 0);
                  sel: in 								std_logic_vector(2 downto 0);
                  overflow, zero, negative, cout: out	std_logic;
                  s: out 								std_logic_vector(n-1 downto 0)
                );
end ula;

architecture comportamento_ula of ula is
signal exA, exB, exS: std_logic_vector(n downto 0);
begin
        
        exA <= a(n-1) & a;
        exB <= b(n-1) & b;
        
        process(exA, exB, sel)
        begin
                case sel is
                        when "000" =>
                                exS <= exA + exB;
                        when "001" =>
                                exS <= exA - exB;
                        when "010" =>
                                exS <= exA or exB;
                        when "011" =>
                                exS <= exA and exB;
                        when "100" =>
                                exS <= '0' & not(exA(n-1 downto 0));
                        when "101" => 
                                if exA < exB then
                                        exS(n-1 downto 0) <= (others => '1');
                                else
                                        exS(n-1 downto 0) <= (others => '0');
                                end if;
						when "110" =>
								exS <= exA + 1;
                        when others =>
                                exS(n) <= '0';
                                exS(n-1 downto 0) <= (others => 'X');
                end case;
        end process;
        
        zero 		<= '1' when exS = 0 else '0';
        cout	 	<= exS(n);
		overflow	<= 	(exS(n-1) and (not exA(n-1) and not exB(n-1)))  or (not exS(n-1) and (exA(n-1) and exB(n-1)));
		negative 	<= exS(n-1);
        s <= exS(n-1 downto 0);
        
end comportamento_ula;
