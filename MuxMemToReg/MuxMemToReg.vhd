library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity MuxMemToReg is

	port(
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		salidaMuxMemToReg : out std_logic_vector(31 downto 0)
		);
end MuxMemToReg;

architecture archMuxMemToReg of MuxMemToReg is
	begin
	with selector select
		salidaMuxMemToReg <= entrada1 when '0',
								entrada2 when '1';
end archMuxMemToReg;