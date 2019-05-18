library IEEE;
-- Use clauses import declarations into the current scope.	
-- If more than one use clause imports the same name into the
-- the same scope, none of the names are imported.

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

entity RegFile is
	generic
	(
		data : natural := 31;
		addr : natural := 4
	);
	port
	(
		-- Input ports
		RS,RT,RD	: in  std_logic_vector(addr downto 0);
		Dato		: in  std_logic_vector(data downto 0);
		regWriteSignal	: in std_logic;
		clk		: in 	std_logic;

		-- Output ports
		regA, regB	: out std_logic_vector(data downto 0)
	);
end RegFile;

architecture arch_RegFile of RegFile is
	type regFile_type is array (0 to 31) of std_logic_vector(31 downto 0);
	signal array_reg : regFile_type; 
begin	
	process(clk)
	begin
	if(rising_edge(clk)) then
		if(regWriteSignal = '1') then
			array_reg(to_integer(unsigned(RD))) <= Dato;
		end if;
	end if;
	regA <= array_reg(to_integer(unsigned(RS)));
	regB <= array_reg(to_integer(unsigned(RT)));
	end process;
end arch_RegFile;