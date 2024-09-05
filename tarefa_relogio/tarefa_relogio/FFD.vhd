Library IEEE;
USE IEEE.std_logic_1164.all;

Entity FFD is
Port(D,clock : in std_logic;
     Q : out std_logic);
end FFD;

Architecture Arq of FFD is
signal a,b : std_logic;

begin

P1: process(clock,D)

	 begin
	 
	 if clock'event and clock = '1' then
	    Q <= D;
	 end if;	 
	 
	 end process; 

end Arq;	  