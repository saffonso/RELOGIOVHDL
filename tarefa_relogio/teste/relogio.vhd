LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
-- SANTIAGO SARAVIA AFFONSO & CAIO GASTAL PETER
Entity Relogio is
Port(c, reset, carga: in std_logic;
 hora_ajuste_unidade, min_ajuste_unidade, min_ajuste_dezena: in std_logic_vector(3 downto 0);
 led : out std_logic;
 hora_ajuste_dezena: in std_logic_vector(2 downto 0);
segmento_hora_dezena: out std_logic_vector(6 downto 0); 
segmento_hora_unidade: out std_logic_vector(6 downto 0);
segmento_min_dezena: out std_logic_vector(6 downto 0);
segmento_min_unidade: out std_logic_vector(6 downto 0)
);
end relogio;


architecture arq of relogio is
signal div27m : std_logic_vector(24 downto 0);
signal seg : std_logic_vector(3 downto 0);
signal min : std_logic_vector(3 downto 0);
signal hora : std_logic_vector(3 downto 0);
signal hora_dezena : std_logic_vector(2 downto 0);
signal min_dezena : std_logic_vector(3 downto 0);


begin 
led <= div27m(21);
process(c,reset, div27m)
begin 
if reset = '1' or (div27m = x"19BFCC0") then
	div27m <= (others => '0');
	elsif rising_edge(c) then
	div27m <= div27m + 1 ;
	end if;
end process;

--process(reset, carga, seg, div27m(21), min, hora, hora_dezena, min_dezena)
--       
--		begin
--		if reset = '1' then
--		seg <= "0000";
--		min <= "0001";
--		hora <= "0000";
--		min_dezena <= "0000";
--		hora_dezena <= "000";
--		
--		elsif rising_edge(div27m(21)) then
--		   
--			if (seg = x"3C") then 
--		     seg <= "000000";
--		     min <= min + 1;
--			elsif (min = x"A") then 
--		    min <= "0000";
--		    min_dezena <= min_dezena + 1;
--			elsif (min_dezena = x"6") then 
--		    min_dezena <= "0000";
--		    hora <= hora + 1;
--			elsif (hora = x"A") then
--			hora <= "0000";
--			hora_dezena <= hora_dezena + 1;
--			else
--			  seg <= seg + 1;
--			end if;
--		end if;
--		end process;
		
		
	DUT:process(div27m(21),reset)
	begin
	if reset = '1' then
		seg <= "0000";
	elsif rising_edge(div27m(21)) then
		if seg = x"9" then
			seg <= "0000";
		else
		seg <= seg +1;
		end if;
	end if;
	end process;
		
		
	hora_dezena<= "010";
	hora<= "0101";
	min_dezena<= "0101";
	
	
		
	with hora_dezena select
			  segmento_hora_dezena <= "1000000" when "000", -- 0
											"1111001" when "001", -- 1
											"0100100" when "010", -- 2
											"0110000" when "011", -- 3
											"0000000" when others;

    with hora select
        segmento_hora_unidade <= "1000000" when "0000", -- 0
                               "1111001" when "0001", -- 1
                               "0100100" when "0010", -- 2
                               "0110000" when "0011", -- 3
                               "0011001" when "0100", -- 4
                               "0010010" when "0101", -- 5
                               "0000010" when "0110", -- 6
                               "1111000" when "0111", -- 7
                               "0000000" when "1000", -- 8
                               "0010000" when "1001", -- 9
                               "0000000" when others;

    with min_dezena select
        segmento_min_dezena <= "1000000" when "0000", -- 0
                             "1111001" when "0001", -- 1
                             "0100100" when "0010", -- 2
                             "0110000" when "0011", -- 3
                             "0011001" when "0100", -- 4
                             "0010010" when "0101", -- 5
                             "0000000" when others;

    with seg select
        segmento_min_unidade <= "1000000" when "0000", -- 0
                              "1111001" when "0001", -- 1
                              "0100100" when "0010", -- 2
                              "0110000" when "0011", -- 3
                              "0011001" when "0100", -- 4
                              "0010010" when "0101", -- 5
                              "0000010" when "0110", -- 6
                              "1111000" when "0111", -- 7
                              "0000000" when "1000", -- 8
                              "0010000" when "1001", -- 9
                              "0000000" when others;

end arq;





	
