LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_behavioral IS
END TB_behavioral;
 
ARCHITECTURE behavior OF TB_behavioral IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT counter_XY_behavioral
    PORT(
         CLK : IN  std_logic;
         X : IN  std_logic;
         Y : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
 	--Outputs
   signal Z : std_logic;
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: counter_XY_behavioral PORT MAP (
          CLK => CLK,
          X => X,
          Y => Y,
          Z => Z
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		wait for 5 ns;
		-- Test case #1
		X<='0'; Y<='1'; wait for CLK_period*4; X<='0'; Y<='0';
		
		-- Test case #2
		X<='1'; Y<='0'; wait for CLK_period*4; X<='0'; Y<='0'; wait for CLK_period;
		
		-- Test case #3
		X<='1'; Y<='0'; wait for CLK_period; X<='0'; Y<='1'; wait for CLK_period;
		X<='1'; Y<='0'; wait for CLK_period; X<='0'; Y<='1'; wait for CLK_period;
		X<='0'; Y<='0'; wait for CLK_period*2;
		
		-- Test case #4
		X<='0'; Y<='1'; wait for CLK_period; X<='1'; Y<='0'; wait for CLK_period;
		X<='0'; Y<='1'; wait for CLK_period; X<='1'; Y<='0'; wait for CLK_period;
		X<='0'; Y<='0'; wait for CLK_period*2;
		
		-- Test case #5
		X<='0'; Y<='1'; wait for CLK_period; X<='0'; Y<='1'; wait for CLK_period;
		X<='0'; Y<='0'; wait for CLK_period*2;
		X<='0'; Y<='1'; wait for CLK_period; X<='1'; Y<='0'; wait for CLK_period;
		X<='0'; Y<='0'; wait for CLK_period*2;
		
      wait;
   end process;

END;
