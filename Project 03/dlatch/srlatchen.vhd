library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity srlatchen is
	port(S: in std_logic;
		  R: in std_logic;
		  C: in std_logic;
		  Q: out std_logic;
		  QN: out std_logic);
end srlatchen;

architecture Behavioral of srlatchen is
	signal tmp1,tmp2: std_logic;
	component NAND2 port(I1,I0: in std_logic; O: out std_logic);
	end component;
	component srlatch port(R_L,S_L: in std_logic; Q,QN: out std_logic);
	end component;
begin
	U0: NAND2 port map(S,C,tmp1);
	U1: NAND2 port map(R,C,tmp2);
	U2: srlatch port map(tmp2,tmp1,Q,QN);
end Behavioral;
