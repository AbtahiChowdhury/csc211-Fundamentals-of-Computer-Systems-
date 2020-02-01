LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity testbench is
end testbench;

architecture Behavior of testbench is
	--Component Declaration
	component srlatchen port(S: in std_logic;
									 R: in std_logic;
									 C: in std_logic;
									 Q: out std_logic;
									 QN: out std_logic);
	end component;
	
	--Inputs
	signal S: std_logic := '0';
	signal R: std_logic := '0';
	signal C: std_logic := '0';
	
	--Outputs
	signal Q: std_logic;
	signal QN: std_logic;
begin
	uut: srlatchen port map(S => S,
									R => R,
									C => C,
									Q => Q,
									QN => QN);
	
	stim_proc: process
	begin
		--c is asserted
		s <= '0'; r <= '1'; c <= '1'; wait for 50 ns;
		s <= '0'; r <= '0'; c <= '1'; wait for 50 ns;
		s <= '1'; r <= '0'; c <= '1'; wait for 50 ns;
		s <= '0'; r <= '0'; c <= '1'; wait for 50 ns;
		
		--c is negated
		s <= '0'; r <= '1'; c <= '0'; wait for 50 ns;
		s <= '0'; r <= '0'; c <= '0'; wait for 50 ns;
		s <= '1'; r <= '0'; c <= '0'; wait for 50 ns;
		s <= '0'; r <= '0'; c <= '0'; wait for 50 ns;
		s <= '1'; r <= '1'; c <= '0'; wait for 50 ns;
		
		--c is again asserted
		s <= '1'; r <= '1'; c <= '1'; wait for 50 ns;
		
		wait;
	end process;
end;