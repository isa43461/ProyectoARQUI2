library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity MuxRegDst is

	port(
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(4 downto 0);
		selector : in std_logic;
		salidaMuxRegDst : out std_logic_vector(31 downto 0)
		);
end MuxRegDst;

architecture archMuxRegDst of MuxRegDst is
	begin
	with selector select
		salidaMuxRegDst <= entrada1 when '0',
								entrada2 when '1';
end archMuxRegDst;