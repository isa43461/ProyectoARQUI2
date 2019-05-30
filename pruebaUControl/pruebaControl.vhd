-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
-- Use clauses import declarations into the current scope.	
-- If more than one use clause imports the same name into the
-- the same scope, none of the names are imported.

-- Commonly imported packages:

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

	-- Basic sequential functions and concurrent procedures
	use ieee.VITAL_Primitives.all;

	entity pruebaControl is

	port
	(
		clk		 : in	std_logic;
		opcode	 : in	std_logic_vector(5 downto 0);
		reset	 : in	std_logic;
		
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
		
		estado1 : out std_logic_vector(6 downto 0);
		estado2 : out std_logic_vector(6 downto 0);
		estado3 : out std_logic_vector(6 downto 0);
		estado4 : out std_logic_vector(6 downto 0);
		
		salida : out std_logic

	);
end pruebaControl;


-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_pruebaControl of pruebaControl is

	-- Declarations (optional)
	

component uControl is
	port
	(
		clk		 : in	std_logic;
		opcode	 : in	std_logic_vector(5 downto 0);
		reset	 : in	std_logic;
		
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
		
		estado1 : out std_logic_vector(6 downto 0);
		estado2 : out std_logic_vector(6 downto 0);
		estado3 : out std_logic_vector(6 downto 0);
		estado4 : out std_logic_vector(6 downto 0)
	);
end component;

component Deco is
	port
	(
		Inmin : in std_logic_vector(15 downto 0);
		outmin : out std_logic_vector(6 downto 0)
	);
end component;
--component Divisor is
--	port
--	(
--		clkIn : in std_logic;
--		clkOut : out std_logic		
--	);
--end component;
	
	


signal salidaCLK : std_logic;

begin

--	decoder : Divisor
--		port map
--		(
--			Clkin => clk,
--			Clkout => salidaCLK
--		);
	
--	decodificador : Deco
--	port map
--	(
--		Inmin => ,
--		outmin : out std_logic_vector(6 downto 0),		
--	);
	salida <= clk;
	control : uControl
	port map
	(
		clk => clk,
		opcode => opcode,
		reset	=> reset,
		
		pcWrite => pcWrite,
		branch => branch,
		IorD => IorD,
		memRead => memRead,
		memWrite => memWrite,
		memToReg => memToReg,
		IRwrite => IRwrite,
		PCsrc => PCsrc,
		aluOP => aluOP,
		aluSrcA => aluSrcA,
		aluSrcB => aluSrcB,
		regWrite => regWrite,
		regDst => regDst,
		estado1 => estado1,
		estado2 => estado2,
		estado3 => estado3,
		estado4 => estado4
	);

end arch_pruebaControl;
