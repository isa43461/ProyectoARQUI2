library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtend26 is
	port(
		x: in std_logic_vector(25 downto 0);
		res: out std_logic_vector(31 downto 0)
	);
end entity;

architecture SignExtend26_arc of SignExtend26 is
begin
	res(25 downto 0) <= x;
	res(31 downto 26) <= (others => '0');
end architecture;