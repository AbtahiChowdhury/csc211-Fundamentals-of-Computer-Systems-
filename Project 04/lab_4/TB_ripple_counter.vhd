LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_ripple_counter IS
END TB_ripple_counter;
 
ARCHITECTURE behavior OF TB_ripple_counter IS 
    COMPONENT ripple_counter
    PORT(
         CLK : IN  std_logic;
         Q0 : OUT  std_logic;
         Q1 : OUT  std_logic;
         Q2 : OUT  std_logic;
         Q3 : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;
   signal Q2 : std_logic;
   signal Q3 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: ripple_counter PORT MAP (
          CLK => CLK,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
END;
