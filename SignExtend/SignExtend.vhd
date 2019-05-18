library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtend is
	port(
		a: in std_logic_vector(15 downto 0);
		res: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of SignExtend is
begin
	res(15 downto 0) <= a;
	res(31 downto 16) <= (others => '0');
end behavior;