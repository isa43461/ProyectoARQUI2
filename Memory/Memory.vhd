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

entity Memory is
	generic
	(
		data : natural := 31;
		addr : natural := 31
	);


	port
	(
		-- Input ports
		clk	: in std_logic;
		address	: in  std_logic_vector(addr downto 0);
		writeData	: in  std_logic_vector(data downto 0);
		signalMemRead	: in std_logic;
		signalMemWrite	: in std_logic;

		-- Output ports
		memData	: out std_logic_vector(data downto 0)
	);
end Memory;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_Memory of Memory is

	-- Declarations (optional)
	-- Build a 2-D array type for the RAM
	type memory_type is array (0 to 31) of std_logic_vector(31 downto 0);

	-- Declare the RAM signal.	
	signal ram : memory_type;

	-- Register to hold the address 
	signal addr_reg : natural range 0 to 2**addr;

begin

	process(clk)
	
		begin
			if(rising_edge(clk)) then
				if(signalMemWrite = '1') then
					ram(address) <= writeData;
				end if;
				
				if(signalMemRead = '1') then
					addr_reg <= address;
				end if;
			end if;
		end process;
		
		memData <= ram(addr_reg);
	
end arch_Memory;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use ieee.std_logic_unsigned.all;
--
----REVISAR EL MEMOutTmp QUE SE GENERA !!
--
--entity Memory is
--
--generic(dataSize : natural := 32; instructionSize: natural := 32);
--
--port(
--	--inputs
--	addressIn: in std_logic_vector(instructionSize-1 downto 0);
--	dataIn: in std_logic_vector(dataSize-1 downto 0);
--	memRead: in std_logic;
--	memWrite: in std_logic;
--	clk: in std_logic;
--	--inputs
--	
--	--outputs
--	memOut: out std_logic_vector(dataSize-1 downto 0)
--	--outputs
--
--);
--
--end Memory;
--
--
--architecture behavioral of Memory is
----signals
--signal addressTmp: std_logic_vector(1 downto 0); --2 bits para address, ya que nuestro codigo de mips es aprox 256 lineas
----constant RAM_DEPTH :integer := 2**(depth);
--
--type RAM is array (0 to 3) of std_logic_vector(dataSize-1 downto 0);--256 de profundidad
--	
--signal mem : RAM := ("00101000000100000000000000000100",
--"00011000000100010000000000000000",
--"00110010001000001001000000000000",
--"00110010001000001001000000000000");
--
----signals
--
--
--begin
--
--memOut <= mem(conv_integer(addressIn(1 downto 0))) when memRead = '1' else "00000000000000000000000000000000";
--
--process(addressIn,dataIn,clk)
--
--begin
--	if(rising_edge(clk) ) then
--		if(memWrite = '1' ) then
--			mem(conv_integer(addressIn(1 downto 0))) <= dataIn;
--		end if;
--	end if;
--
--end process;
--
--
--end behavioral;


