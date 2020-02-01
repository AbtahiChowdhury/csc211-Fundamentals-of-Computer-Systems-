library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity pet_d_ff is
    Port ( CLK : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end pet_d_ff;

architecture Behavioral of pet_d_ff is
	signal CLK_L,Q1,Q2: std_logic;
	component LD
		generic(INIT: bit := '0');
		port(D,G: in std_logic;
			  Q: out std_logic);
	end component;
	component INV port(I: in std_logic; O: out std_logic); end component;
begin
	U0: INV port map(CLK,CLK_L);
	U1: LD port map(D,CLK_L,Q1);
	U2: LD port map(Q1,CLK,Q2);
	U3: Q <= Q2;
	U4: INV port map(Q2,QN);
end Behavioral;