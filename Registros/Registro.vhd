library IEEE;
use IEEE.std_logic_1164.all;

entity Registro is

	port
	(
		-- Input ports
		entrada	: in  std_logic_vector(31 downto 0);
		
		-- Output ports
		salida	: out std_logic_vector(31 downto 0);
		clk		:		std_logic
	);
	
end Registro;

architecture arch_Registro of Registro is

	-- Declarations (optional)
	signal temp : std_logic_vector(31 downto 0);

begin

	process (clk)
		Begin
			if (rising_edge (clk)) then
				temp <= entrada;
			end if;
		end process;
	salida <= temp;
End arch_Registro;