library ieee;
use ieee.std_logic_1164.ALL;

entity testbench is
end testbench;

architecture behavior of testbench is
	--Component Declaration
	component srlatch
	port(R_L: in std_logic;
		  S_L: in std_logic;       
		  Q: out std_logic;
		  QN: out std_logic);
	end component;
	
	--Inputs
	signal R_L:  std_logic := '0';
	signal S_L :  std_logic := '0';
	
	--Outputs
	signal Q: std_logic;
	signal QN: std_logic;
begin
	uut: srlatch port map(R_L => R_L,
								 S_L => S_L,
								 Q => Q,
								 QN => QN);
	stim_proc: process
	begin
		s_l <= '0'; r_l <= '0'; wait for 50 ns;
		s_l <= '0'; r_l <= '1'; wait for 50 ns;
		s_l <= '1'; r_l <= '1'; wait for 50 ns;
		s_l <= '1'; r_l <= '0'; wait for 50 ns;
		s_l <= '1'; r_l <= '1'; wait for 50 ns;
		s_l <= '0'; r_l <= '0'; wait for 50 ns;
		wait;
	end process;
end;
