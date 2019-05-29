-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
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

entity AluControl is

	port
	(
		-- Input ports
		funct	: in  std_logic_vector(5 downto 0);
		aluOP	: in  std_logic_vector(1 downto 0);

		-- Output ports
		operation	: out std_logic_vector(2 downto 0)
	);
end AluControl;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_AluControl of AluControl is

	-- Declarations (optional)

begin

	operation <= "000" when (aluOP = "10" and funct = "100010") else
					"001" when (aluOP = "10" and funct = "100101") else
					"010" when (aluOP = "10" and funct = "100000") else
					"011" when (aluOP = "10" and funct = "100111") else
					"100" when (aluOP = "10" and funct = "000000") else
					"101" when (aluOP = "10" and funct = "000010") else
					"110" when (aluOP = "10" and funct = "000010");-- else
					--"010" when (aluOP = "000") else
					--"001" when (aluOP = "001");

	
--		if(aluOP = "000") then operation <= "010";
--		elsif(aluOP = "001") then operation <= "110";
--		elsif(aluOP = "010") then operation <= "010";
--			if(funct = "100000") then operation <= "010";
--			elsif(funct = "100010") then operation <= "110";
--			elsif(funct = "100100") then operation <= "000";
--			elsif(funct = "100101") then operation <= "001";
--			elsif(funct = "100111") then operation <= "011";
--			elsif(funct = "101010") then operation <= "111";
--			elsif(funct = "000000") then operation <= "100";
--			elsif(funct = "000010") then operation <= "101";
--			end if;
--		end if;
--	end process;
--			

end arch_AluControl;
