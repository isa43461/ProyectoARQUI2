library ieee;

use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity prueba3 is
	generic
	(
		data : natural := 31;
		addr : natural := 4
	);
	port
	(
		--Input
		regWrite : in std_logic;
		regDst : in std_logic;
		muxA : in std_logic;
		muxB	: in std_logic_vector(1 downto 0);
		eALUOp: in std_logic_vector(1 downto 0);
		memToReg : in std_logic;
		irWrite : in std_logic;
		clk : in std_logic;
		--Output
		salidaPrueba	: out std_logic_vector(15 downto 0)
		);
end prueba3;

architecture arch_prueba of prueba3 is

component InstructionReg is
		port(
		ins : in std_logic_vector(31 downto 0);
		sal : out std_logic_vector(31 downto 0);
		clk : in std_logic;
		irwr : in std_logic
	);
end component;

component MuxMemToReg is
	port
	(
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		salidaMuxMemToReg : out std_logic_vector(31 downto 0)
	);
end component;

component MuxRegDst is
	port(
		entrada1 : in std_logic_vector(4 downto 0);
		entrada2 : in std_logic_vector(4 downto 0);
		selector : in std_logic;
		salidaMuxRegDst : out std_logic_vector(4 downto 0)
		);
end component;

component RegFile is
	port
	(
		RS,RT,RD	: in  std_logic_vector(addr downto 0);
		Dato		: in  std_logic_vector(data downto 0);
		regWriteSignal	: in std_logic;
		clk		: in 	std_logic;

		-- Output ports
		regA, regB	: out std_logic_vector(data downto 0)
	);
end component;

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

component AluControl is
	port
	(
		-- Input ports
		funct	: in  std_logic_vector(5 downto 0);
		aluOP	: in  std_logic_vector(1 downto 0);

		-- Output ports
		operation	: out std_logic_vector(2 downto 0)
	);
end component;

component Divisor is
	port
	(
		Clkin: in std_logic;
		Clkout: out std_logic
	);
end component;

signal AluSrcA : std_logic;
signal AluSrcB : std_logic_vector(1 downto 0);
signal sBrAlu : std_logic;
signal eRegA : std_logic_vector(31 downto 0);
signal eRegB : std_logic_vector(31 downto 0);
signal sRegA : std_logic_vector(31 downto 0);
signal sRegB : std_logic_vector(31 downto 0);
signal sEntrada2MuxB : std_logic_vector(31 downto 0);
signal sEntradaSL : std_logic_vector(31 downto 0);
signal sSalidaSL : std_logic_vector(31 downto 0);
signal opAluOp : std_logic_vector(2 downto 0);
signal e1Alu : std_logic_vector(31 downto 0);
signal e2ALu : std_logic_vector(31 downto 0);
signal sSalidaAlu : std_logic_vector(31 downto 0);
signal sMuxDst : std_logic_vector(4 downto 0);
signal sMuxMemReg : std_logic_vector(31 downto 0);
signal salidaCLK : std_logic;
signal salidaIR : std_logic_vector(31 downto 0);

 
begin
	
	decoder : Divisor
		port map
		(
			Clkin => clk,
			Clkout => salidaCLK
		);
	
	IR : InstructionReg
		port map
		(
			ins => "00000010011101011001000000100010",
			sal => salidaIR,
			clk => salidaCLK,
			irwr => irWrite
		);
	
	muxMemReg : MuxMemToReg
		port map
		(
			--entrada1 => salidaPrueba,
			entrada1 => "00000000000000000000000000011011",
			entrada2 => "00000000000000000000000000101111",
			selector => memToReg,
			salidaMuxMemToReg => sMuxMemReg
		);
	
	muxDST : MuxRegDst
		port map
		(
			entrada1 => salidaIR(20 downto 16),
			--entrada1 => "00010",
			--entrada2 => salidaIR(15 downto 11),
			entrada2 => "00010",
			selector => regDst,
			salidaMuxRegDst => sMuxDst
		);

	
	registerFile : RegFile
		port map
		(
			RS => salidaIR(25 downto 21),
			RT => salidaIR(20 downto 16),
			--RS => "00001",
			--RT => "00010",
			RD	=> sMuxDst,
			Dato => sMuxMemReg,
			regWriteSignal	=> regWrite,
			clk => salidaCLK,
			regA => eRegA,
			regB => eRegB

		);
	
	regA : Registro
		port map
		(
			entrada => eRegA,
			salida => sRegA,
			clk => salidaCLK
		);
	
	regB : Registro
		port map
		(
			entrada => eRegB,
			salida => sRegB,
			clk => salidaCLK
		);
		
	regAluOut : Registro
		port map
		(
			entrada => sSalidaAlu,
			--salida => salidaPrueba,
			salida(15 downto 0) => salidaPrueba,
			clk => salidaCLK
		);

		
	MuxAluSrcA : MuxSrcA
		port map
		(
			entrada1 => "00000000000000000000000000011110",
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
			entrada1 => "00000000000000000000000000000100",
			entrada2 => "00000000000000000000000000001011",
			entrada3 => "00000000000000000000000000001100",
			selector => muxB,
			salidaMuxAluSrcB => e2Alu
		);
		
	aAluControl : AluControl
		port map
		(
			--funct => salidaIR(5 downto 0),
			funct	=> "100100",
			aluOP	=> eALUOp,
			operation => opAluOp
		);
			
	aAlu : Alu
		port map
		(
			OP => opAluOp,
			A => e1Alu,
			B => e2ALu,
			res => sSalidaAlu,
			br => sBrAlu
		);

end arch_prueba;