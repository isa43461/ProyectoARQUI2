library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity MuxAluSrcB is

	port(
		entrada0 : in std_logic_vector(31 downto 0); --salida B (RF)
		entrada1 : in std_logic_vector(31 downto 0); --Ingresa 4
		entrada2	: in std_logic_vector(31 downto 0); --Sign extend
		entrada3	: in std_logic_vector(31 downto 0); --Shift left
		
		selector : in std_logic_vector(1 downto 0);
		salidaMuxAluSrcB : out std_logic_vector(31 downto 0)
		);
end MuxAluSrcB;

architecture archMuxAluSrcB of MuxAluSrcB is
	begin
	with selector select
		salidaMuxAluSrcB <= entrada0 when "00"; salidaMuxAluSrcB <= entrada0,
								entrada1 when "01""00000000000000000000000000000100",
								entrada2 when "10",
								entrada3 when "11";
end archMuxAluSrcB;

