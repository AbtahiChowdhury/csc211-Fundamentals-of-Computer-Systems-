library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity t_ff is
    Port ( CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end t_ff;

architecture Behavioral of t_ff is
	component pet_d_ff port(CLK: in std_logic;
									D: in std_logic;
									Q: out std_logic;
									QN: out std_logic);
	end component;
	signal Q1,Q1_L: std_logic;
begin
	U0: pet_d_ff port map(CLK,Q1_L,Q1,Q1_L);
	U1: Q <= Q1;
	U2: QN <= Q1_L;
end Behavioral;

