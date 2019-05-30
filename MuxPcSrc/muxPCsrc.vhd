library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_vector.all;

entity muxPCsrc is

	port(
		entrada0 : in std_logic_vector(31 downto 0); --salida B (RF)
		entrada1 : in std_logic_vector(31 downto 0); --Ingresa 4
		entrada2	: in std_logic_vector(31 downto 0); --Sign extend
		
		selector : in std_logic_vector(1 downto 0);
		salidaMuxPCsrc : out std_logic_vector(31 downto 0)
		);
end muxPCsrc;

architecture archmuxPCsrc of muxPCsrc is
	begin
	with selector select
		salidaMuxPCsrc <= 
								entrada0 when "00",
								entrada1 when "01",
								entrada2 when others;
end archmuxPCsrc;

