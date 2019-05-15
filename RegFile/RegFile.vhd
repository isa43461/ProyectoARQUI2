-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
-- Use clauses import declarations into the current scope.	
-- If more than one use clause imports the same name into the
-- the same scope, none of the names are imported.

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

entity RegFile is
	generic
	(
		data : natural := 31;
		addr : natural := 4
	);
	port
	(
		-- Input ports
		RS,RT,RD	: in  std_logic_vector(addr downto 0);
		Dato		: in  std_logic_vector(data downto 0);
		regWriteSignal	: in std_logic;
		clk		: in 	std_logic;

		-- Output ports
		regA, regB	: out std_logic_vector(data downto 0)
	);
end RegFile;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_RegFile of RegFile is

	type regFile_type is array (0 to 31) of std_logic_vector(31 downto 0);
	
	-- Declarations (optional)
	signal array_reg : regFile_type := (x"00000000",
													x"11111111",
													x"22222222",
													x"33333333",
													x"44444444",
													x"55555555",
													x"66666666",
													x"77777777",
													x"88888888",
													x"99999999",
													x"aaaaaaaa",
													x"bbbbbbbb",
													x"cccccccc",
													x"dddddddd",
													x"eeeeeeee",
													x"ffffffff",
													x"00000000",
													x"11111111",
													x"22222222",
													x"33333333",
													x"44444444",
													x"55555555",
													x"66666666",
													x"77777777",
													x"88888888",
													x"99999999",
													x"aaaaaaaa",
													x"bbbbbbbb",
													x"cccccccc",
													x"dddddddd",
													x"eeeeeeee",
													x"ffffffff");
													
	
--	signal register_0 : std_logic_vector(data downto 0);
--	signal register_1 : std_logic_vector(data downto 0);
--	signal register_2 : std_logic_vector(data downto 0);
--	signal register_3 : std_logic_vector(data downto 0);
--	signal register_4 : std_logic_vector(data downto 0);
--	signal register_5 : std_logic_vector(data downto 0);
--	signal register_6 : std_logic_vector(data downto 0);
--	signal register_7 : std_logic_vector(data downto 0);
--	signal register_8 : std_logic_vector(data downto 0);
--	signal register_9 : std_logic_vector(data downto 0);
--	signal register_10 : std_logic_vector(data downto 0);
--	signal register_11 : std_logic_vector(data downto 0);
--	signal register_12 : std_logic_vector(data downto 0);
--	signal register_13 : std_logic_vector(data downto 0);
--	signal register_14 : std_logic_vector(data downto 0);
--	signal register_15 : std_logic_vector(data downto 0);
--	signal register_16 : std_logic_vector(data downto 0);
--	signal register_17 : std_logic_vector(data downto 0);
--	signal register_18 : std_logic_vector(data downto 0);
--	signal register_19 : std_logic_vector(data downto 0);
--	signal register_20 : std_logic_vector(data downto 0);
--	signal register_21 : std_logic_vector(data downto 0);
--	signal register_22 : std_logic_vector(data downto 0);
--	signal register_23 : std_logic_vector(data downto 0);
--	signal register_24 : std_logic_vector(data downto 0);
--	signal register_25 : std_logic_vector(data downto 0);
--	signal register_26 : std_logic_vector(data downto 0);
--	signal register_27 : std_logic_vector(data downto 0);
--	signal register_28 : std_logic_vector(data downto 0);
--	signal register_29 : std_logic_vector(data downto 0);
--	signal register_30 : std_logic_vector(data downto 0);
--	signal register_31 : std_logic_vector(data downto 0);
	
begin	

	process(clk)
	
	begin
		
		if(rising_edge(clk)) then
			if regWriteSignal = '1' then
			
				array_reg(to_integer(unsigned(RD))) <= Dato;
			end if;
	
		regA <= array_reg(to_integer(unsigned(RS)));
		regB <= array_reg(to_integer(unsigned(RT)));
		
		end if;
	end process;
end arch_RegFile;			
--			if (rising_edge(clk)) then
--			
--				if regWriteSignal = '1' then
--				
--				case RD is
--					when "00000" => register_0 <= Dato;
--					when "00001" => register_1 <= Dato;
--					when "00010" => register_2 <= Dato;
--					when "00011" => register_3 <= Dato;
--					when "00100" => register_4 <= Dato;
--					when "00101" => register_5 <= Dato;
--					when "00110" => register_6 <= Dato;
--					when "00111" => register_7 <= Dato;
--					when "01000" => register_8 <= Dato;
--					when "01001" => register_9 <= Dato;
--					when "01010" => register_10 <= Dato;
--					when "01011" => register_11 <= Dato;
--					when "01100" => register_12 <= Dato;
--					when "01101" => register_13 <= Dato;
--					when "01110" => register_14 <= Dato;
--					when "01111" => register_15 <= Dato;
--					when "10000" => register_16 <= Dato;
--					when "10001" => register_17 <= Dato;
--					when "10010" => register_18 <= Dato;
--					when "10011" => register_19 <= Dato;
--					when "10100" => register_20 <= Dato;
--					when "10101" => register_21 <= Dato;
--					when "10110" => register_22 <= Dato;
--					when "10111" => register_23 <= Dato;
--					when "11000" => register_24 <= Dato;
--					when "11001" => register_25 <= Dato;
--					when "11010" => register_26 <= Dato;
--					when "11011" => register_27 <= Dato;
--					when "11100" => register_28 <= Dato;
--					when "11101" => register_29 <= Dato;
--					when "11110" => register_30 <= Dato;
--					when "11111" => register_31 <= Dato;
--				end case;
--				
--			end if;
--		end if;
--		
--		case RS is
--					when "00000" => regA <= register_0;
--					when "00001" => regA <= register_1;
--					when "00010" => regA <= register_2;
--					when "00011" => regA <= register_3;
--					when "00100" => regA <= register_4;
--					when "00101" => regA <= register_5;
--					when "00110" => regA <= register_6;
--					when "00111" => regA <= register_7;
--					when "01000" => regA <= register_8;
--					when "01001" => regA <= register_9;
--					when "01010" => regA <= register_10;
--					when "01011" => regA <= register_11;
--					when "01100" => regA <= register_12;
--					when "01101" => regA <= register_13;
--					when "01110" => regA <= register_14;
--					when "01111" => regA <= register_15;
--					when "10000" => regA <= register_16;
--					when "10001" => regA <= register_17;
--					when "10010" => regA <= register_18;
--					when "10011" => regA <= register_19;
--					when "10100" => regA <= register_20;
--					when "10101" => regA <= register_21;
--					when "10110" => regA <= register_22;
--					when "10111" => regA <= register_23;
--					when "11000" => regA <= register_24;
--					when "11001" => regA <= register_25;
--					when "11010" => regA <= register_26;
--					when "11011" => regA <= register_27;
--					when "11100" => regA <= register_28;
--					when "11101" => regA <= register_29;
--					when "11110" => regA <= register_30;
--					when "11111" => regA <= register_31;
--				end case;
--	
--			case RT is
--					when "00000" => regB <= register_0;
--					when "00001" => regB <= register_1;
--					when "00010" => regB <= register_2;
--					when "00011" => regB <= register_3;
--					when "00100" => regB <= register_4;
--					when "00101" => regB <= register_5;
--					when "00110" => regB <= register_6;
--					when "00111" => regB <= register_7;
--					when "01000" => regB <= register_8;
--					when "01001" => regB <= register_9;
--					when "01010" => regB <= register_10;
--					when "01011" => regB <= register_11;
--					when "01100" => regB <= register_12;
--					when "01101" => regB <= register_13;
--					when "01110" => regB <= register_14;
--					when "01111" => regB <= register_15;
--					when "10000" => regB <= register_16;
--					when "10001" => regB <= register_17;
--					when "10010" => regB <= register_18;
--					when "10011" => regB <= register_19;
--					when "10100" => regB <= register_20;
--					when "10101" => regB <= register_21;
--					when "10110" => regB <= register_22;
--					when "10111" => regB <= register_23;
--					when "11000" => regB <= register_24;
--					when "11001" => regB <= register_25;
--					when "11010" => regB <= register_26;
--					when "11011" => regB <= register_27;
--					when "11100" => regB <= register_28;
--					when "11101" => regB <= register_29;
--					when "11110" => regB <= register_30;
--					when "11111" => regB <= register_31;				
--				end case;
--
--	end process;

