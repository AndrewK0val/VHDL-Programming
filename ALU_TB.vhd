LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
signal clk : std_logic := '0';
signal inp_a,inp_b,out_alu : signed(15 downto 0) := (others => '0');
signal sel : std_logic_vector(3 downto 0) := (others => '0');
constant Clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: entity work.alu PORT MAP (
clk => clk,
inp_a => inp_a,
inp_b => inp_b,
sel => sel,
out_alu => out_alu
);

-- Clock process definitions
clk_process :process
begin
clk <= '0';
wait for Clk_period/2;
clk <= '1';
wait for Clk_period/2;
end process;

-- Stimulus process
stim_proc: process
begin 
wait for Clk_period*0.7;
inp_a <= "0111111111111111";
inp_b <= "1110101010101010";
sel <= "0000"; wait for Clk_period;
sel <= "0001"; wait for Clk_period;
sel <= "0010"; wait for Clk_period;
sel <= "0011"; wait for Clk_period;
sel <= "0100"; wait for Clk_period;
sel <= "0101"; wait for Clk_period;
sel <= "0110"; wait for Clk_period;
sel <= "0111"; wait for Clk_period;
sel <= "1000"; wait for Clk_period;
sel <= "1001"; wait for Clk_period;

sel <= "1111"; wait for Clk_period;

--do the rest yourslef
wait;
end process;
END;
