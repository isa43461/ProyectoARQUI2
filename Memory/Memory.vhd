---- A library clause declares a name as a library.  It 
---- does not create the library; it simply forward declares 
---- it. 
--library IEEE;
---- Use clauses import declarations into the current scope.	
---- If more than one use clause imports the same name into the
---- the same scope, none of the names are imported.
--
---- Commonly imported packages:
--
--	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
--	use ieee.std_logic_1164.all;
--
--	-- SIGNED and UNSIGNED types, and relevant functions
--	use ieee.numeric_std.all;
--
--	-- Basic sequential functions and concurrent procedures
--	use ieee.VITAL_Primitives.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--entity Memory is
--	generic
--	(
--		data : natural := 31;
--		addr : natural := 31
--	);
--
--
--	port
--	(
--		-- Input ports
--		clk	: in std_logic;
--		address	: in  std_logic_vector(addr downto 0);
--		writeData	: in  std_logic_vector(data downto 0);
--		signalMemRead	: in std_logic;
--		signalMemWrite	: in std_logic;
--
--		-- Output ports
--		memData	: out std_logic_vector(data downto 0)
--	);
--end Memory;
--
---- Library Clause(s) (optional)
---- Use Clause(s) (optional)
--
--architecture arch_Memory of Memory is
--
--	-- Declarations (optional)
--	-- Build a 2-D array type for the RAM
--	type memory_type is array (0 to 127) of std_logic_vector(31 downto 0);
--
--	-- Declare the RAM signal.	
--	signal ram : memory_type := (
--
--	-- Register to hold the address 
--	--signal addr_reg : natural range 0 to 2**addr;
--	
--	B"00000010011101011010100000100010", --Add
----	B"00010010000000001000", B"00010100000000000010", B"00010010100000000011",
----	--DISTRIBUCION DE MEMORIA--
----	B"00000000000000000000", B"01101100101000000000", B"10010011100101000000", B"00011100001001011000",
----B"10101110011100000000", B"01011110000000000000", B"01101100110000000000", B"10010101100110000000",
----B"00011100001101110000", B"10101110101100000000", B"01011110000000000000", B"01101100111000000000",
----B"10010111100111000000", B"00011100001000000000", B"10101110111100000000", B"01011110000000000000",
----B"01101101000000000000", B"10011001101000000000", B"00011100001100100000", B"10101110011100000000",
----B"01011110000000000000", B"01101101001000000000", B"10011011101001000000", B"00011100001100000000",
----B"10101110011100000000", B"01011110000000000000", B"00110100101010000000", B"00110110111001110001",
----B"01000110111100100000", B"001110010010910000000", B"00000100100110000000", B"00100100101000000000",
----B"01010010001001000000", B"10000100000000000000", B"10001000000000000000", B"01010000001001100000",
----B"10010000000000000000", B"00010100101010000000", B"10011000000000000000", B"00010110001000000000",
----B"01011010111110110000", B"00010110001100000000", B"01011010111110000000", B"00010110001000000000",
----B"01011010111101010000", B"00010110001000000000", B"01011010111100100000", B"10111100000000000000",
----B"00110100101100000000", B"01010000001111010000", B"11001000000000000000", B"00110100101101000000",
----B"01010000001111010000", B"11010100000000000000", B"00110100101111000000", B"01010000001111010000",
----B"11100000000000000000", B"00110100101000100000", B"01010000001111010000", B"11101100000000000000",
----B"00110100101001100000", B"11110100000000000000", B"01000100101010000000", B"10000101100110000000",
----B"01110100000000000000",
----	--DATOS DE LA MEMORIA--
----B"00000000000000000000", B"00001000000000000000", B"00000000000000000010", B"00000000000000000011",
----B"00000000000000000100",
--	
--	others=>X"00000000"
--	);
--
--	begin
--		process(clk)
--		begin	
--			if (rising_edge(clk)) then	
--				if (signalMemWrite = '1') then	
--					ram(conv_integer(address)) <= writeData;
--				elsif (signalMemRead = '1') then
--					memData <= ram(conv_integer(address));
--				end if;
--			end if;
--		end process;
--
----begin
----
----	process(clk)
----	
----		begin
----			if(rising_edge(clk)) then
----				if(signalMemWrite = '1') then
----					ram(address) <= writeData;
----				end if;
----				
----				if(signalMemRead = '1') then
----					addr_reg <= address;
----				end if;
----			end if;
----		end process;
----		
----		memData <= ram(addr_reg);
--	
--end arch_Memory;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

--REVISAR EL MEMOutTmp QUE SE GENERA !!

entity Memory is

generic(dataSize : natural := 32; instructionSize: natural := 32);

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

end Memory;


architecture behavioral of Memory is
--signals
signal addressTmp: std_logic_vector(1 downto 0); --2 bits para address, ya que nuestro codigo de mips es aprox 256 lineas
--constant RAM_DEPTH :integer := 2**(depth);

type RAM is array (0 to 3) of std_logic_vector(dataSize-1 downto 0);--256 de profundidad
	
signal mem : RAM := (
"00000010011101011010100000100010", --add
"10001110011101011010100000100010", --lw
"00001110001000001001000000000000", --mul
"00001010001000001001000000000000" --j
);
--l"00000010011101011010100000100010");

--signals


begin

memOut <= mem(conv_integer(addressIn(1 downto 0))) when memRead = '1' else "00000000000000000000000000000000";

process(addressIn,dataIn,clk)

begin
	if(rising_edge(clk) ) then
		if(memWrite = '1' ) then
			mem(conv_integer(addressIn(1 downto 0))) <= dataIn;
		end if;
	end if;

end process;


end behavioral;


