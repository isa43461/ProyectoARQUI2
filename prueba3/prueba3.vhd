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
		reset : in std_logic;
--		regWrite : in std_logic;
--		regDst : in std_logic;
--		muxA : in std_logic;
--		muxB	: in std_logic_vector(1 downto 0);
--		eALUOp: in std_logic_vector(2 downto 0);
--		memToReg : in std_logic;
--		irWrite : in std_logic;
		clk : in std_logic;
		salidaMem : in std_logic_vector(31 downto 0);
--		pcSrc : in std_logic_vector(1 downto 0);
--		IorD : in std_logic;
		--Output
		salidaPrueba	: out std_logic_vector(31 downto 0);
		salidaRegB : out std_logic_vector(31 downto 0);
		
		salidaMemRead : out std_logic;
		salidaMemWrite : out std_logic;
		--salidaMemRead : out std
		estado1 : out std_logic_vector(6 downto 0); -- primer siete seg
		estado2 : out std_logic_vector(6 downto 0);
		estado3 : out std_logic_vector(6 downto 0);
		estado4 : out std_logic_vector(6 downto 0)
		);
end prueba3;

architecture arch_prueba of prueba3 is

component uControl is
	port
	(
		clk		 : in	std_logic;
		opcode	 : in	std_logic_vector(5 downto 0);
		reset	 : in	std_logic := '0';
		
		pcWrite	 : out	std_logic;
		branch	: out	std_logic;
		IorD : out	std_logic;
		memRead : out	std_logic;
		memWrite : out	std_logic;
		memToReg : out	std_logic;
		IRwrite : out	std_logic;
		PCsrc : out	std_logic_vector (1 downto 0);
		aluOP : out	std_logic_vector (2 downto 0);
		aluSrcA : out	std_logic;
		aluSrcB : out	std_logic_vector (1 downto 0);
		regWrite : out	std_logic;
		regDst : out	std_logic;
		estado1 : out std_logic_vector(6 downto 0); -- primer siete seg
		estado2 : out std_logic_vector(6 downto 0);
		estado3 : out std_logic_vector(6 downto 0);
		estado4 : out std_logic_vector(6 downto 0)
	);
end component;

component InstructionReg is
		port(
		ins : in std_logic_vector(31 downto 0);
		sal : out std_logic_vector(31 downto 0);
		clk : in std_logic;
		irwr : in std_logic
	);
end component;
component SignExtend is
	port(
		a: in std_logic_vector(15 downto 0);
		res: out std_logic_vector(31 downto 0)
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

component SignExtend26 is
	port(
		x: in std_logic_vector(25 downto 0);
		res: out std_logic_vector(31 downto 0)
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

component muxPCsrc is

	port(
		entrada0 : in std_logic_vector(31 downto 0); --salida B (RF)
		entrada1 : in std_logic_vector(31 downto 0); --Ingresa 4
		entrada2	: in std_logic_vector(31 downto 0); --Sign extend
		
		selector : in std_logic_vector(1 downto 0);
		salidaMuxPCsrc : out std_logic_vector(31 downto 0)
		);
end component;

component PC is
	port(
		PcOl : in std_logic_vector(31 downto 0);
		pcAc : out std_logic_vector(31 downto 0);
		clk : in std_logic;
		band: in std_logic
	);
end component;

component Divisor is
	port
	(
		Clkin: in std_logic;
		Clkout: out std_logic
	);
end component;

component MuxIorD is
	port(
		entrada1 : in std_logic_vector(31 downto 0);
		entrada2 : in std_logic_vector(31 downto 0);
		selector : in std_logic;
		salidaMuxIorD : out std_logic_vector(31 downto 0)
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
signal salidaSE : std_logic_vector(31 downto 0);
signal salidaSE2 : std_logic_vector(31 downto 0);
signal salidaRegAluOut : std_logic_vector(31 downto 0);
signal sigSalidaMuxPCsrc : std_logic_vector(31 downto 0);
signal salidaPC : std_logic_vector(31 downto 0);
signal spcWrite	 : 	std_logic;
signal sbranch	: std_logic;
signal sIorD : std_logic;
signal smemRead : std_logic;
signal smemWrite : std_logic;
signal smemToReg : std_logic;
signal sIRwrite : std_logic;
signal sPCsrc : std_logic_vector (1 downto 0);
signal saluOP : std_logic_vector (2 downto 0);
signal saluSrcA : std_logic;
signal saluSrcB : std_logic_vector (1 downto 0);
signal sregWrite : std_logic;
signal sregDst : std_logic;

begin
	
	unidadControl : uControl
		port map
		(
			clk => clk,
			opcode => salidaIR(31 downto 26),
			reset => reset,
			
			pcWrite => spcWrite,
			branch => sbranch,
			IorD =>siorD,
			memRead => smemRead,
			memWrite => smemWrite,
			memToReg => smemToReg,
			IRwrite => sirwrite,
			PCsrc => spcsrc,
			aluOP => saluOP,
			aluSrcA => saluSrcA,
			aluSrcB => saluSrcB,
			regWrite => sregWrite,
			regDst => sregDst,
			estado1 => estado1,
			estado2 => estado2,
			estado3 => estado3,
			estado4 => estado4
		);
	
	cMuxIorD : MuxIorD
		port map
		(
			entrada1 => salidaPC,
			entrada2 => salidaRegAluOut,
			selector => siorD,
			salidaMuxIorD => salidaPrueba
		);
	
	cPC : PC
		port map 
		(
			PcOl => sigSalidaMuxPCsrc,
			pcAc => salidaPC,
			clk => clk,
			band => ((sBrAlu and sbranch) or spcWrite )
		);
	
	muxPC : muxPCsrc
		port map
		(
			entrada0 => sSalidaAlu,
			entrada1 => salidaRegAluOut,
			entrada2	=> salidaSE2,
			
			selector => sPCsrc,
			salidaMuxPCsrc => sigSalidaMuxPCsrc
		);
	
	SE26 : SignExtend26
		port map
		(
			x => salidaIR(25 downto 0),
			res => salidaSE2
		);
	
--	decoder : Divisor
--		port map
--		(
--			Clkin => clk,
--			Clkout => salidaCLK
--		);
--	
	IR : InstructionReg
		port map
		(
			ins => salidaMem,
			--ins => "00000010011101011010100000100010",
			sal => salidaIR,
			clk => clk,
			irwr => sirwrite
		);
	signoExtendido : SignExtend
		port map
		(
			a => salidaIR(15 downto 0),
			res => salidaSE
		);
	muxMemReg : MuxMemToReg
		port map
		(

			entrada1 => salidaRegAluOut,
			entrada2 => "00000000000000000000000000101111", --47
			selector => smemToReg,
			salidaMuxMemToReg => sMuxMemReg
		);
	
	muxDST : MuxRegDst
		port map
		(
			entrada1 => salidaIR(20 downto 16),
			--entrada1 => "00010",
			entrada2 => salidaIR(15 downto 11),
			--entrada2 => "00010",
			selector => sregDst,
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
			regWriteSignal	=> sregWrite,
			clk => salidaCLK,
			regA => eRegA,
			regB => eRegB

		);
	
	regA : Registro
		port map
		(
			entrada => eRegA,
			salida => sRegA,
			clk => clk
		);
	
	regB : Registro
		port map
		(
			entrada => eRegB,
			salida => sRegB,
			clk => clk
		);
		
	regAluOut : Registro
		port map
		(
			entrada => sSalidaAlu,
			--salida => salidaPrueba,
			salida => salidaRegAluOut,
			clk => clk
		);

		
	MuxAluSrcA : MuxSrcA
		port map
		(
			entrada1 => salidaPC,
			entrada2 => sRegA,
			selector => saluSrcA,
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
			entrada1 => "00000000000000000000000000000001", --1
			entrada2 => salidaSE,
			entrada3 => salidaSE,
			selector => saluSrcB,
			salidaMuxAluSrcB => e2Alu
		);
			
	aAlu : Alu
		port map
		(
			OP => saluOP,
			A => e1Alu,
			B => e2ALu,
			res => sSalidaAlu,
			br => sBrAlu
		);
	
	salidaRegB <= sRegB; 
	salidaMemRead <= smemRead;
	salidaMemWrite <= smemWrite;
end arch_prueba;