library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flip_flop_jk is
    port(J, K: in           std_logic;
        clk: in             std_logic;
        Q, notQ: buffer     std_logic_vector(3 downto 0);
end flip_flop_jk;

architecture behavior of flip_flop_jk is
    Signal exJK: std_logic_vector(1 downto 0);
    Signal exQ: std_logic_vector (3 downto 0);
begin
    exJK <= J & K;
    process(clk)
    begin
        if clk'event and clk = '1' then
            case (exJK) is
                when "00" => Q <= Q;
                when "01" => Q <= '0';
                when "10" => Q <= '1';
                when "11" => Q <= not Q;
            end case;
            notQ <= not Q;
        end if;

--        if clk'event and clk = '1' then
--            exS <= not ((J and clk)and notQ);
--            exR <= not ((K and clk)and Q);
--            Q   <= not (notQ and exS);
--            notQ <= not (notQ and exS);


    end process;
end behavior;
