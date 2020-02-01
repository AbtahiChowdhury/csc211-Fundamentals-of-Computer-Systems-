library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity counter_XY_structural is
    Port ( CLK : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end counter_XY_structural;

architecture Behavioral of counter_XY_structural is
	signal Q1,Q1_L,Q2,Q2_L,X_L,Y_L,D1,D2,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9: std_logic;
	component INV port(I: in std_logic;
							 O: out std_logic);
	end component;
	component AND3 port(I2,I1,I0: in std_logic;
							  O: out std_logic);
	end component;
	component OR4 port(I3,I2,I1,I0: in std_logic;
							 O: out std_logic);
	end component;
	component OR6 port(I5,I4,I3,I2,I1,I0: in std_logic;
							 O: out std_logic);
	end component;
	component pet_d_ff
		port(CLK,D: in std_logic;
			  Q,QN: out std_logic);
	end component;
begin
	 U0: pet_d_ff port map(CLK,D1,Q1,Q1_L);
	 U1: pet_d_ff port map(CLK,D2,Q2,Q2_L);
	 U2: Z <= Q1_L and Q2_L;
	 U3: INV port map(X,X_L);
	 U4: INV port map(Y,Y_L);
	 U5: AND3 port map(Q1_L,X,Y,t0);
	 U6: AND3 port map(Q1_L,Q2,Y,t1);
	 U7: AND3 port map(Q1_L,Q2,X,t2);
	 U8: AND3 port map(Q1,X_L,Y_L,t3);
	 U9: AND3 port map(Q1,Q2_L,Y_L,t4);
	U10: AND3 port map(Q1,Q2_L,X_L,t5);
	U11: AND3 port map(Q2_L,X_L,Y,t6);
	U12: AND3 port map(Q2_L,X,Y_L,t7);
	U13: AND3 port map(Q2,X_L,Y_L,t8);
	U14: AND3 port map(Q2,X,Y,t9);
	U15: OR6 port map(t0,t1,t2,t3,t4,t5,D1);
	U16: OR4 port map(t6,t7,t8,t9,D2);
end Behavioral;

