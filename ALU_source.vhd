library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
Port ( clk : in STD_LOGIC;
sel : in STD_LOGIC_VECTOR(3 downto 0);
inp_a : in signed(15 downto 0);
inp_b : in signed(15 downto 0);
out_alu : out signed(15 downto 0));
end ALU;

architecture Behavioral of ALU is
begin

process(inp_a, inp_b, sel, clk)
begin
	if(falling_edge(clk)) then
		case sel is
			when "0000" => 
			out_alu<= inp_a; --alupassOp
			when "0001" => 
			out_alu<= inp_a and inp_b; --andOp
      --do the rest yourself
			when "0010" =>
			  out_alu<= inp_a or inp_b;
			when "0011" =>
			  out_alu<= not inp_a;
			when "0100" =>
			  out_alu<= inp_a xor inp_b;
			when "0101" =>
			  out_alu<= inp_a + inp_b;
			when "0110" =>
			  out_alu<= inp_a - inp_b;
			when "0111" =>
			  out_alu<= inp_a + 1;
			when "1000" =>
			  out_alu<= inp_a - 1;
			when "1001" =>
			  out_alu<= "0000000000000000";
			when others =>
 			NULL;
		end case; 
	end if;
end process;

end Behavioral;
