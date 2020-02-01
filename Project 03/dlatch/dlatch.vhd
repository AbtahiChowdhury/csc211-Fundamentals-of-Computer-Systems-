library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity dlatch is
	port(C: in std_logic;
		  D: in std_logic;
		  Q: out std_logic;
		  QN: out std_logic);
end dlatch;

architecture Behavioral of dlatch is
	signal D_L: std_logic;
	component INV port (I: in std_logic; O: out std_logic);
	end component;
	component srlatchen port(S,R,C: in std_logic; Q,QN: out std_logic);
	end component;
begin
	U0: INV port map(D,D_L);
	U1: srlatchen port map(D,D_L,C,Q,QN);
end Behavioral;

