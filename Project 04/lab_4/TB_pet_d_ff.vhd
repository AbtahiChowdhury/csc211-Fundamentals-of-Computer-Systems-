LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_pet_d_ff IS
END TB_pet_d_ff;
 
ARCHITECTURE behavior OF TB_pet_d_ff IS 
    COMPONENT pet_d_ff
    PORT(
         CLK : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic;
         QN : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal D : std_logic := '0';
 	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: pet_d_ff PORT MAP (
          CLK => CLK,
          D => D,
          Q => Q,
          QN => QN
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
		wait for 20 ns;
		d <= '0';
		wait for CLK_period*2;
		d <= '1';
		wait for CLK_period*2;
		d <= '0';
		wait for CLK_period*2;
		d <= '1';
		wait for CLK_period*2;
		wait;
   end process;
END;
