-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
-- Commonly imported packages:

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

	-- Basic sequential functions and concurrent procedures
	use ieee.VITAL_Primitives.all;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

entity pruebaRegFile is
--	generic
--	(
--		<name>	: <type>  :=	<default_value>;
--		...
--		<name>	: <type>  :=	<default_value>
--	);
--
--
	port
	(
--		-- Input ports
--		<name>	: in  <type>;
--		<name>	: in  <type> := <default_value>;
--
--		-- Inout ports
--		<name>	: inout <type>;
--
--		-- Output ports
--		<name>	: out <type>;
--		<name>	: out <type> := <default_value>
	--sRS : in std_logic_vector(4 downto 0);
	--sRT : in std_logic_vector(4 downto 0);
	--sRD : in std_logic_vector(4 downto 0);
	--sDato : in std_logic_vector(3 downto 0);
	--sRegWriteSignal	: in std_logic;
	sClk : in std_logic;

		-- Output ports
	sRegA : out std_logic_vector(4 downto 0);
	sRegB : out std_logic_vector(4 downto 0)
	);
end pruebaRegFile;


architecture arch_pruebaRegFile of pruebaRegFile is

--	generic
--	(
--		data : natural := 31;
--		addr : natural := 4
--	);
--	port
--	(


		-- Input ports

	
--	);

	signal salidaCLK  : std_logic;
	component Divisor is
		port
	(
		Clkin: in std_logic;
		Clkout: out std_logic
	);
	end component;
	
	component RegFile is
		port
	(
		-- Input ports
		RS,RT,RD	: in  std_logic_vector(4 downto 0);
		Dato		: in  std_logic_vector(31 downto 0);
		regWriteSignal	: in std_logic;
		clk		: in 	std_logic;

		-- Output ports
		regA, regB	: out std_logic_vector(31 downto 0)
		);
	end component;
	


begin
	-- Declarations (optional)
	
	clock : Divisor 
	port map
	(
		Clkin => sClk,
		Clkout => salidaCLK
	);
	
	pruebaReg : RegFile
		port map
		(
		RS => "00011",
		RT => "00010",
		RD => "00100",
		Dato	=> "00000000000000000000000000001001",
		regWriteSignal	=> '1',
		regA(4 downto 0) => sRegA, 
		regB(4 downto 0) => sRegB,
		clk => salidaCLK
		);
	
--	sim : process
--	begin
--		
--		for I in 0 to 30 loop
--			sRS <= std_logic_vector(to_unsigned(I,5));
--			sRT <= std_logic_vector(to_unsigned(I+1,5));
--			
--			--wait for 25 ns;
--		end loop;
--		
----		assert false
----			report "End"
----			severity failure;
--	end process;
			
	
--begin
--	uut : entity work.regFile port map(A,B,sA,sB,W,wrEnable,sW,cl);
--	
--	
--	
--	begin
--		cl <= '1';
--		wait for 5 ns;
--		cl <= '0';
--		wait for 5 ns;
--	end process;
--	
--	insig : process
--	
--	begin 
--		
--		W <= x"AAAAAA";
--		sW <= "0001";
--		wrEnable <= '1';
--		
--		wait for 2 ns;
--		wrEnable <= '0';
--		wait for 1 ns;
--		W <= x"EEEEEE";
--		sW <= "0011";
--		wrEnable <= '1';
--		wait for 2 ns;
--		wrEnable <= '0';
--		W <= x"000000";
--		sW <= "0000";
--		wait for 2 ns;
--		
--		sA <= "0001";
--		sB <= "0011";
--		wait for 10 ns;
--		
--		W <= x"BBBBBB";
--		sW <= "0011";
--		wrEnable <= '1';
--		wait for 2 ns;
--		wrEnable <= '0';
--		wait for 10 ns;
--	end process;


end arch_pruebaRegFile;
