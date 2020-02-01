LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity testbench is
end testbench;
 
architecture behavior of testbench is 
	--Component Declaration
	component dlatch port(
		C : in  std_logic;
		D : in  std_logic;
		Q : out  std_logic;
		QN : out  std_logic);
	end component;

	--Inputs
	signal C : std_logic := '0';
	signal D : std_logic := '0';

	--Outputs
	signal Q : std_logic;
	signal QN : std_logic; 
begin
	uut: dlatch port map(C => C,
								D => D,
								Q => Q,
								QN => QN);
								
	stim_proc: process
	begin
		d <= '0'; c <='1'; wait for 50 ns;
		d <= '1'; c <='1'; wait for 50 ns;
		d <= '0'; c <='0'; wait for 50 ns;
		d <= '1'; c <='0'; wait for 50 ns;
		d <= '0'; c <='1'; wait for 50 ns;
		d <= '1'; c <='1'; wait for 50 ns;
		wait;
	end process;
end;
