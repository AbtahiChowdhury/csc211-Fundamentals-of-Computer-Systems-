library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity counter_XY_behavioral is
    Port ( CLK : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end counter_XY_behavioral;

architecture Behavioral of counter_XY_behavioral is
	type state_type is (s0,s1,s2,s3);
	signal state: state_type := s0;
	signal X0,Y0: std_logic := '0';
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			case state is
				when s0 =>
					if X0='0' and Y0='0' then
						state <= s0;
					elsif X0='0' and Y0='1' then
						state <= s1;
					elsif X0='1' and Y0='0' then
						state <= s1;
					elsif X0='1' and Y0='1' then
						state <= s2;
					end if;
				when s1 =>
					if X0='0' and Y0='0' then
						state <= s1;
					elsif X0='0' and Y0='1' then
						state <= s2;
					elsif X0='1' and Y0='0' then
						state <= s2;
					elsif X0='1' and Y0='1' then
						state <= s3;
					end if;
				when s2 =>
					if X0='0' and Y0='0' then
						state <= s2;
					elsif X0='0' and Y0='1' then
						state <= s3;
					elsif X0='1' and Y0='0' then
						state <= s3;
					elsif X0='1' and Y0='1' then
						state <= s0;
					end if;
				when s3 =>
					if X0='0' and Y0='0' then
						state <= s3;
					elsif X0='0' and Y0='1' then
						state <= s0;
					elsif X0='1' and Y0='0' then
						state <= s0;
					elsif X0='1' and Y0='1' then
						state <= s1;
					end if;
			end case;
			
			X0 <= X;
			Y0 <= Y;
		end if;
	end process;
	
	Z <= '1' when state=s0 else'0';
end Behavioral;

