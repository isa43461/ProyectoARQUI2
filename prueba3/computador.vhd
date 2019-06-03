library ieee;

use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity computador is
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
--		pcSrc : in std_logic_vector(1 downto 0);
--		IorD : in std_logic;
		--Output
		--salidaPrueba	: out std_logic_vector(15 downto 0);
		
		--entrada : in std_logic_vector(6 downto 0);
		
		estado1 : out std_logic_vector(6 downto 0); -- primer siete seg
		estado2 : out std_logic_vector(6 downto 0);
		estado3 : out std_logic_vector(6 downto 0);
		estado4 : out std_logic_vector(6 downto 0)
		);
end computador;

architecture arch_computador of computador is

component puertos is
	port
	(
		-- Input ports
		entrada : in std_logic_vector(6 downto 0);
		clk : in std_logic;
		
		-- Output ports
		salida	: out std_logic_vector(6 downto 0)
		
	);
end component;

component prueba3 is
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
		salidaMemRead : out std_logic;
		salidaMemWrite : out std_logic;
		
		
--		entradas : in std_logic_vector(31 downto 0);
		--Output
		salidaPrueba	: out std_logic_vector(31 downto 0);
		salidaRegB : out std_logic_vector(31 downto 0);
		estado1 : out std_logic_vector(6 downto 0); -- primer siete seg
		estado2 : out std_logic_vector(6 downto 0);
		estado3 : out std_logic_vector(6 downto 0);
		estado4 : out std_logic_vector(6 downto 0)
	);
end component;

component Memory is
generic(
	dataSize : natural := 32; 
	instructionSize: natural := 32
);
port(
	--inputs
	addressIn: in std_logic_vector(instructionSize-1 downto 0);
	dataIn: in std_logic_vector(dataSize-1 downto 0);
	memRead: in std_logic;
	memWrite: in std_logic;
	clk: in std_logic;
	--inputs
	
	--outputs
	memOut: out std_logic_vector(dataSize-1 downto 0)
	--outputs

);
end component;

signal salidaProcesador : std_logic_vector(31 downto 0);
signal salidaMemoria : std_logic_vector(31 downto 0);
signal sSalidaRegB : std_logic_vector(31 downto 0);
signal sMemRead : std_logic;
signal sMemWrite : std_logic;

begin
	
--	entrada : puertos
--		port map
--		(
--			entrada => entrada,
--			clk => clk,
--
--
--			--salida
--		);

	 procesador : prueba3
		port map
		(
			reset => reset,
			clk => clk,
			salidaPrueba => salidaProcesador,
			salidaMem => salidaMemoria,
			salidaRegB => sSalidaRegB,
			estado1 => estado1,
			estado2 => estado2,
			estado3 => estado3,
			estado4 => estado4,
			salidaMemRead => sMemRead,
			salidaMemWrite => sMemWrite
		);
		
	memoria : Memory
		port map
		(
			addressIn => salidaProcesador,
			dataIn => sSalidaRegB,
			memRead => sMemRead,
			memWrite => sMemWrite,
			clk => clk,
			--inputs
			
			--outputs
			memOut => salidaMemoria
		);
	
--
--		port map
--		(
--			address => salidaProcesador,
--			writeData => sSalidaRegB,
--			signalMemRead => sMemRead,
--			signalMemWrite => sMemWrite,
--			clk => clk,
--			memData => salidaMemoria
--		);
--		

end arch_computador;