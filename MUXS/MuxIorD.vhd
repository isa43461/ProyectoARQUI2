library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity MuxIorD is

	port(
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		salidaMuxIorD : out std_logic_vector(31 downto 0)
		);
end MuxIorD;

architecture archMuxIorD of MuxIorD is
	begin
	with selector select
		salidaMuxIorD <= entrada1 when '0',
								entrada2 when '1';
end archMuxIorD;