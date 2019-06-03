-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;
-- Use clauses import declarations into the current scope.	
-- If more than one use clause imports the same name into the
-- the same scope, none of the names are imported.

-- Commonly imported packages:

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity puertos is

	port
	(
		-- Input ports
		entrada : in std_logic_vector(6 downto 0);
		clk : in std_logic;
		
		-- Output ports
		salida	: out std_logic_vector(6 downto 0)
		
	);
end puertos;

architecture arch_puertos of puertos is

	signal data : std_logic_vector(6 downto 0);

	begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			data <= entrada;
		end if;
	end process;
salida <= data;
end arch_puertos;
