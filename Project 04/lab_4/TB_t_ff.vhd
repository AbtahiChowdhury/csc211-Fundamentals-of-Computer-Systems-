LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY TB_t_ff IS
END TB_t_ff;
 
ARCHITECTURE behavior OF TB_t_ff IS 
    COMPONENT t_ff
    PORT(
         CLK : IN  std_logic;
         Q : OUT  std_logic;
         QN : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
 	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: t_ff PORT MAP (
          CLK => CLK,
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
END;
