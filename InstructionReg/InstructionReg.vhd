Library IEEE;
use IEEE.std_logic_1164.all;

entity InstructionReg is
	port(
		ins : in std_logic_vector(31 downto 0);
		sal : out std_logic_vector(31 downto 0);
		clk : in std_logic;
		irwr : in std_logic
	);
end entity;

architecture InstructionReg_arc of InstructionReg is
---signal tmp : std_logic_vector(31 downto 0);
begin
process(ins, clk, irwr)
	begin
		if(rising_edge(clk) and irwr = '1')then
			sal <= ins;
		end if;
		--sal <= tmp;
end process;
end architecture;
