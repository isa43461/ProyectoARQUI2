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

	-- Basic sequential functions and concurrent procedures
	use ieee.VITAL_Primitives.all;


entity salidaMuestra is
--	generic
--	(
--		<name>	: <type>  :=	<default_value>;
--		...
--		<name>	: <type>  :=	<default_value>
--	);


	port
	(
		-- Input ports
		entrada	: in  std_logic_vector(31 downto 0);
		clk	: in  std_logic;

		-- Output ports
		salida1	: out std_logic_vector(17 downto 0)
	);
end salidaMuestra;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_salidaMuestra of salidaMuestra is

	-- Declarations (optional)

begin

	process(entrada,clk)
	
	begin
	if(rising_edge(clk)) then
		salida1 <= entrada(17 downto 0);
	end if;
	-- Process Statement (optional)

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)
	end process;
end arch_salidaMuestra;
