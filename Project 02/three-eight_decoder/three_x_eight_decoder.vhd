library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.vcomponents.all;


entity v3to8dec is
	port (A : in std_logic_vector (2 downto 0);
			EN: in std_logic;
			O : out std_logic_vector (7 downto 0));
end v3to8dec;

architecture Behavioral of v3to8dec is
	signal A2_L: std_logic;
	signal Y0,Y1,Y2,Y3: std_logic;
	
	component INV port (I: in std_logic; O: out std_logic);
	end component;
	
	component AND3 port (I0,I1,I2: in std_logic; O: out std_logic);
	end component;
	
	component v2to4dec port (EN,I0,I1: in std_logic; Y0,Y1,Y2,Y3: out std_logic);
	end component;
	
begin
		U0: v2to4dec port map(EN,A(0),A(1),Y0,Y1,Y2,Y3);
		U1: INV port map(A(2),A2_L);
		U2: AND3 port map(EN,A2_L,Y0,O(0));
		U3: AND3 port map(EN,A2_L,Y1,O(1));
		U4: AND3 port map(EN,A2_L,Y2,O(2));
		U5: AND3 port map(EN,A2_L,Y3,O(3));
		U6: AND3 port map(EN,A(2),Y0,O(4));
		U7: AND3 port map(EN,A(2),Y1,O(5));
		U8: AND3 port map(EN,A(2),Y2,O(6));
		U9: AND3 port map(EN,A(2),Y3,O(7));
end Behavioral;

