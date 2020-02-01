library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ripple_counter is
    Port ( CLK : in  STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC);
end ripple_counter;

architecture Behavioral of ripple_counter is
	component t_ff port(CLK: in std_logic;
							  Q: out std_logic;
							  QN: out std_logic);
	end component;
	signal Q0_L,Q1_L,Q2_L,Q3_L: std_logic;
begin
	U0: t_ff port map(CLK,Q0,Q0_L);
	U1: t_ff port map(Q0_L,Q1,Q1_L);
	U2: t_ff port map(Q1_L,Q2,Q2_L);
	U3: t_ff port map(Q2_L,Q3,Q3_L);
end Behavioral;

