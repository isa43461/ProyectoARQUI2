library ieee;

use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity prueba1 is
	port
	(
		--Input
		muxA : in std_logic;
		muxB	: in std_logic_vector(1 downto 0);
		ALUOp: in std_logic_vector(2 downto 0);
		clk : in std_logic;
		--Output
		salidaPrueba	: out std_logic_vector(15 downto 0)
--		salidaPrueba2	: out std_logic_vector(31 downto 0)
		);
end prueba1;

architecture arch_prueba of prueba1 is
component Registro is
	port 
		(
		--Input
		entrada	: in  std_logic_vector(31 downto 0);
		-- Output
		salida	: out std_logic_vector(31 downto 0);
		clk		:		std_logic
		);
end component;

component Divisor is
	port
	(
		Clkin: in std_logic;
		Clkout: out std_logic
	);
end component;

component MuxSrcA is
	port
		(
		--Input
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		--Output
		salidaMuxSrcA : out std_logic_vector(31 downto 0)
		);
end component;

component MuxAluSrcB is
	port
		(
		--Input
		entrada0 : in std_logic_vector(31 downto 0); --salida B (RF)
		entrada1 : in std_logic_vector(31 downto 0); --Ingresa 4
		entrada2	: in std_logic_vector(31 downto 0); --Sign extend
		entrada3	: in std_logic_vector(31 downto 0); --Shift left
		--Output
		selector : in std_logic_vector(1 downto 0);
		salidaMuxAluSrcB : out std_logic_vector(31 downto 0)
		);
end component;

component ShiftLeft is

	port
	(	
		--Input
		w : in std_logic_vector(31 downto 0);
		--Output
		y : out std_logic_vector(31 downto 0)
	);
end component;

component Alu is
	port
	(
		OP : in std_logic_vector(2 downto 0);
		A,B : in std_logic_vector(31 downto 0);
		res: out std_logic_vector(31 downto 0);
		br: out std_logic
	);
end component;

signal AluSrcA : std_logic;
signal AluSrcB : std_logic_vector(1 downto 0);
signal sBrAlu : std_logic;
signal sRegA : std_logic_vector(31 downto 0);
signal sRegB : std_logic_vector(31 downto 0);
signal sEntrada2MuxB : std_logic_vector(31 downto 0);
signal sEntradaSL : std_logic_vector(31 downto 0);
signal sSalidaSL : std_logic_vector(31 downto 0);
--signal AluOp : std_logic_vector(2 downto 0);
signal e1Alu : std_logic_vector(31 downto 0);
signal e2ALu : std_logic_vector(31 downto 0);
signal sSalidaAlu : std_logic_vector(31 downto 0);
signal salidaCLK : std_logic;

begin

	decoder : Divisor
		port map
		(
			Clkin => clk,
			Clkout => salidaCLK
		);
	
	regA : Registro
		port map
		(
			entrada => "00000000000000000000000000000010", --2
			salida => sRegA,
			clk => salidaCLK
		);
	
	regB : Registro
		port map
		(
			entrada => "00000000000000000000000000001010", --10
			salida => sRegB,
			clk => clk
		);
		
	regAluOut : Registro
		port map
		(
			entrada => sSalidaAlu,
			salida(15 downto 0) => salidaPrueba,
			clk => salidaCLK
		);

		
	MuxAluSrcA : MuxSrcA
		port map
		(
			entrada1 => "00000000000000000000000000000110", --6
			entrada2 => sRegA,
			selector => muxA,
			salidaMuxSrcA => e1Alu
		);
	
--	aShiftLeft : ShiftLeft
--		port map
--		(
--			w => entradaShiftL,
--			y => sSalidaSL
--		);
		
	aMuxAluSrcB : MuxAluSrcB
		port map
		(
			entrada0 => sRegB,
			entrada1 => "00000000000000000000000000000100", --4
			entrada2 => "00000000000000000000000000001011", --11
			entrada3 => "00000000000000000000000000001100", --12
			selector => muxB,
			salidaMuxAluSrcB => e2Alu
		);
			
	aAlu : Alu
		port map
		(
			OP => AluOP,
			A => e1Alu,
			B => e2ALu,
			res => sSalidaAlu,
			br => sBrAlu
		);

end arch_prueba;