library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
	component v3to8dec
		port (A : in std_logic_vector (2 downto 0);
				EN: in std_logic;
				O : out std_logic_vector (7 downto 0));
	end component;
	
	--inputs
	signal A: std_logic_vector(2 downto 0) := (others => '0');
	signal EN : std_logic := '0';
	
	--outputs
	signal O : std_logic_vector(7 downto 0);
	
begin
	uut: v3to8dec port map (
				A => A,
				EN => EN,
				O=>O);
			
	stim_proc: process
	begin
		EN<='0'; A<="000"; wait for 10 ns;
		EN<='0'; A<="001"; wait for 10 ns;
		EN<='0'; A<="010"; wait for 10 ns;
		EN<='0'; A<="011"; wait for 10 ns;
		EN<='0'; A<="100"; wait for 10 ns;
		EN<='0'; A<="101"; wait for 10 ns;
		EN<='0'; A<="110"; wait for 10 ns;
		EN<='0'; A<="111"; wait for 10 ns;
		
		EN<='1'; A<="000"; wait for 10 ns;
		EN<='1'; A<="001"; wait for 10 ns;
		EN<='1'; A<="010"; wait for 10 ns;
		EN<='1'; A<="011"; wait for 10 ns;
		EN<='1'; A<="100"; wait for 10 ns;
		EN<='1'; A<="101"; wait for 10 ns;
		EN<='1'; A<="110"; wait for 10 ns;
		EN<='1'; A<="111"; wait for 10 ns;
		wait;
	end process;
	
end Behavioral;

