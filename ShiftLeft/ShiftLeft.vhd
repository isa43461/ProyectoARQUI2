library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_1164.all;

entity ShiftLeft is
generic(
	long : natural := 31
);
port(
	w : in std_logic_vector(long downto 0);
	y : out std_logic_vector(long downto 0)
);
end entity;

architecture ShiftLeft_arc of ShiftLeft is
begin
p: process(w) is
	begin
		y(31) <= w(29);
		y(30) <= w(28);
		y(29) <= w(27);
		y(28) <= w(26);
		y(27) <= w(25);
		y(26) <= w(24);
		y(25) <= w(23);
		y(24) <= w(22);
		y(23) <= w(21);
		y(22) <= w(20);
		y(21) <= w(19);
		y(20) <= w(18);
		y(19) <= w(17);
		y(18) <= w(16);
		y(17) <= w(15);
		y(16) <= w(14);
		y(15) <= w(13);
		y(14) <= w(12);
		y(13) <= w(11);
		y(12) <= w(10);
		y(11) <= w(9);
		y(10) <= w(8);
		y(9) <= w(7);
		y(8) <= w(6);
		y(7) <= w(5);
		y(6) <= w(4);
		y(5) <= w(3);
		y(4) <= w(2);
		y(3) <= w(1);
		y(2) <= w(0);
		y(1) <= '0';
		y(0) <= '0';
end process;
end architecture;