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

entity puertos is

	port
	(
		-- Input ports
		entrada : in std_logic_vector(6 downto 0);
--		sexo	: in  std_logic;
--		peso : in std_logic_vector(6 downto 0);
--		tipo : in std_logic_vector(5 downto 0);
--		cantidad : in std_logic_vector(4 downto 0);
		clk : in std_logic;

		-- Output ports
		salida1	: out std_logic_vector(6 downto 0);
		salida2 : out std_logic_vector(6 downto 0)

	);
end puertos;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_puertos of puertos is

signal sexo, peso, tipo,cantidad : std_logic_vector(6 downto 0);
	-- Declarations (optional)
--type state_type is (sexo,peso,tipo,cantidad);
--signal state : state_type := sexo;
begin

	process(clk)
	
	begin
	if (rising_edge(clk)) then
	
--		case state is
--			when sexo =>
--				if entrada = "0000001" then
--					salida1 <= "1111001";
--				else
--					salida1 <= "1000000";
--				end if;
--			
--			when peso =>
--				if entrada = 
--		end case;
	end if;
end process;



end arch_puertos;
