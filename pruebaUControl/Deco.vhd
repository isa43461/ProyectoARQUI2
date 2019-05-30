library ieee;
use ieee.std_logic_1164.all;

entity Decode is
	port(
		Inmin : in std_logic_vector(15 downto 0);
		outmin : out std_logic_vector(6 downto 0)
		);
end Decode;

architecture Dec of Decode is 
	begin
	with Inmin select
		outmin <="0000001" when "0000000000000000",
		"1001111" when "0000000000000001",
		"0010010" when "0000000000000010",
		"0000110" when "0000000000000011",
		"1001100" when "0000000000000100",
		"0100100" when "0000000000000101",
		"0100000" when "0000000000000110",
		"0001111" when "0000000000000111",
		"0000000" when "0000000000001000",
		"0001100" when "0000000000001001",
		"1111111" when others;
end Dec;