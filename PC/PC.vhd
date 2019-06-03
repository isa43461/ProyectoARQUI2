library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
	port(
		PcOl : in std_logic_vector(31 downto 0);
		pcAc : out std_logic_vector(31 downto 0);
		clk : in std_logic;
		band: in std_logic
	);
end entity;

architecture PC_arc of PC is
begin
	process(clk, pcOl, band)
	begin
		if(falling_edge(clk) and band = '1')then
			pcAc <= pcOl;
		end if;
	end process;
end architecture;