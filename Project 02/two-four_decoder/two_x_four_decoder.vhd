library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity v2to4dec is
	port (EN: in std_logic;
			I0: in std_logic;
			I1: in std_logic;
			Y0: out std_logic;
			Y1: out std_logic;
			Y2: out std_logic;
			Y3: out std_logic);
end v2to4dec;

architecture Behavioral of v2to4dec is
begin
	Y0 <= '1' when EN='1' and I1='0' and I0='0' else '0';
	Y1 <= '1' when EN='1' and I1='0' and I0='1' else '0';
	Y2 <= '1' when EN='1' and I1='1' and I0='0' else '0';
	Y3 <= '1' when EN='1' and I1='1' and I0='1' else '0';
end Behavioral;

