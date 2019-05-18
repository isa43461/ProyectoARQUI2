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

	operation <= "000" when (aluOP = "10" and funct = "100100") else
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



--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
--
--entity AluControl is
--	port (
--		funct: in std_logic_vector(5 downto 0);
--		alu_op: in std_logic_vector(1 downto 0);
--		alu_control_fuct: out std_logic_vector(3 downto 0)
--	);
--end AluControl;
--
--architecture beh of AluControl is
--	signal and_op: std_logic_vector(3 downto 0):= "0000";
--	signal or_op: std_logic_vector(3 downto 0):= "0001";
--	signal add: std_logic_vector(3 downto 0):= "0010";
--	signal subtract_not_equal: std_logic_vector(3 downto 0):= "0011";
--	signal subtract: std_logic_vector(3 downto 0):= "0110";
--	signal set_on_less_than: std_logic_vector(3 downto 0):= "0111";
--
--	begin
--
--	alu_control_fuct <= add when(alu_op="00" or (alu_op="10" and funct="100000")) else
--						subtract when(alu_op="01" or (alu_op="10" and funct="100010")) else
--						subtract_not_equal when(alu_op="11") else
--						and_op when(alu_op="10" and funct="100100") else
--						or_op when(alu_op="10" and funct="100101") else
--						set_on_less_than when(alu_op="10" and funct="101010") else
--						"0000";
--						
--
--end beh;