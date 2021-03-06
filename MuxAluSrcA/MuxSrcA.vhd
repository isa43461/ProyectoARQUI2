library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity MuxSrcA is

	port(
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		salidaMuxSrcA : out std_logic_vector(31 downto 0)
		);
end MuxSrcA;

architecture archMuxScrA of MuxSrcA is
	begin
	with selector select
		salidaMuxSrcA <= entrada1 when '0',
								entrada2 when '1';
end archMuxScrA;