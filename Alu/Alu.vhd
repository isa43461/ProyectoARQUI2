Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Alu is
	port
	(
		OP : in std_logic_vector(2 downto 0);
		A,B : in std_logic_vector(31 downto 0);
		res: out std_logic_vector(31 downto 0);
		br: out std_logic
	);
end entity;

architecture Alu_arc of Alu is
	signal tmp : std_logic_vector(63 downto 0);
begin 
process(OP, A,B, tmp)
	begin
	case OP is 
		when "000" =>
			br <= '0';
			res <= std_logic_vector((unsigned(A) + unsigned(B)));
		when "001" =>
			br <= '0';
			res <= std_logic_vector((unsigned(A) - unsigned(B)));
		when "010" =>
			br <= '0';
			tmp <= std_logic_vector((unsigned(A) * unsigned(B)));
			res <= tmp(31 downto 0);
		when "011" =>
			br <= '0';
			res <= std_logic_vector((unsigned(A) / unsigned(B)));
		when "100" =>
			br <= '0';
			res <= std_logic_vector((unsigned(A) mod unsigned(B)));
		when "101" =>
			if(unsigned(A) - unsigned(B) = 0) then
				br <= '1';
			else
				br <= '0';
			end if;
		when "110" =>
			if(unsigned(A) < unsigned(B)) then
				res(0) <= '1';
				res(31 downto 1) <= (others => '0');
			else
				br <= '0';
			end if;
		when "111" =>
			res <= A;
			br <= '0';
	end case;
end process;
end architecture;
