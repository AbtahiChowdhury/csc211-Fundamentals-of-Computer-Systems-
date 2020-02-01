library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity srlatch is
    Port (R_L: in std_logic;
          S_L: in std_logic;
          Q: out std_logic;
          QN: out std_logic);
end srlatch;

architecture Behavioral of srlatch is
	signal tmp1,tmp2: std_logic;
	component NAND2 port(I1,I0: in std_logic; O: out std_logic);
	end component;
begin
	U0: NAND2 port map(S_L,tmp2,tmp1);
	U1: NAND2 port map(R_L,tmp1,tmp2);
	Q <= tmp1;
	QN <= tmp2;
end Behavioral;
