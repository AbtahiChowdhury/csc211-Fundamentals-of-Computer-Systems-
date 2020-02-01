library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
	component v2to4dec
	port (EN: in std_logic;
			I0: in std_logic;
			I1: in std_logic;
			Y0: out std_logic;
			Y1: out std_logic;
			Y2: out std_logic;
			Y3: out std_logic);
	end component;
	
	--inputs
	signal EN : std_logic := '0';
	signal I0 : std_logic := '0';
	signal I1 : std_logic := '0';
	--outputs
	signal Y0 : std_logic;
	signal Y1 : std_logic;
	signal Y2 : std_logic;
	signal Y3 : std_logic;
	
begin
	uut: v2to4dec port map(
				EN => EN,
				I0 => I0,
				I1 => I1,
				Y0 => Y0,
				Y1 => Y1,
				Y2 => Y2,
				Y3 => Y3);
	
	stim_proc: process
	begin
		EN <= '0';
		I1 <= '0'; I0 <= '0'; wait for 10 ns;
		I1 <= '0'; I0 <= '1'; wait for 10 ns;
		I1 <= '1'; I0 <= '0'; wait for 10 ns;
		I1 <= '1'; I0 <= '1'; wait for 10 ns;
		EN <= '1';
		I1 <= '0'; I0 <= '0'; wait for 10 ns;
		I1 <= '0'; I0 <= '1'; wait for 10 ns;
		I1 <= '1'; I0 <= '0'; wait for 10 ns;
		I1 <= '1'; I0 <= '1'; wait for 10 ns;
		wait;
	end process;
end Behavioral;

