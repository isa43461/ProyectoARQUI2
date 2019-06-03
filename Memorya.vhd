library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

--REVISAR EL MEMOutTmp QUE SE GENERA !!

entity Memory is

	generic(
		DATA_SIZE : natural := 32; 
		INST_SIZE: natural := 32
	);

	port(
		clk: in std_logic;
		Address: in std_logic_vector(INST_SIZE-1 downto 0);
		Data: in std_logic_vector(DATA_SIZE-1 downto 0);
		memRead: in std_logic;
		memWrite: in std_logic;
		memOut: out std_logic_vector(DATA_SIZE-1 downto 0)

	);

end Memory;


architecture Memory_arc of Memory is
--signals
signal addressTmp: std_logic_vector(1 downto 0):="00"; --2 bits para address


type RAM is array (0 to 45) of std_logic_vector(DATA_SIZE-1 downto 0);
	
signal mem : RAM := (
							"00000111010100101000000000000000",
							"00000011010100100000000000000000",
							"00000111010100101000000000000000",
							"00000001010100100000100000000000",
							"00000111010100101000000000000000",
							"00000011010100100001000000000000",
							"00000111010100101000000000000000",
							"00000011010100100001100000000000",
							"00010010010100000000000000000000",
							"00000110011010110000000000000000",
							"00000100011101100000000000000000",
							"00000101011101110000000000000000",
							"00010010110000000000000000000000",
							"00000110011011000000000000000000",
							"00000100000101100000000000000000",
							"00000100001101110000000000000000",
							"00010010101000000000000000000000",
							"00000110011011010000000000000000",
							
							"00000110110001010000000000000000",
							"00000110111001100000000000000000",
							"00100111010001011110000000000000",
							"00000111010001111101110000000000",
							"01000000110001110011000000000000",
							"00010010000000000000000000000000",
							
							"00000111010001111000100000000000",
							"01000000110001110011000000000000",
							"00010010000000000000000000000000",
							
							"01100001100001100110000000000000",
							"01000000100011000010000000000000",
							"00000011010001000110100000000000",
							"00010010010000000000000000000000",
							
							"00000011010101100010000000000000",
							"00000111010001011000000000000000",
							"01000000100001010010000000000000",
							"00001100101001000010100000000000",
							"00000011010001011001100000000000",
							"00010010010000000000000000000000",
							
							"00000110110000000000000000000000",
							"00000110111000010000000000000000",
							"00000111010001001100100000000000",
							"00000111010001011010000000000000",
							"01000000000000010011000000000000",
							"01000000110001010011100000000000",
							"01100000111001000011100000000000",
							"00000011010001111001100000000000",
							"00010010010000000000000000000000"
							);
							
--							main:
--								addi $v0, $00, 4
--								add $t0, $00, $v0
--								addi $v0, $00, 4
--								add $t1, $s0, $v0
--								addi $v0, $00, 4
--								add $t2, $00, $v0
--								addi $v0, $00, 4
--								add $t3, $00, $v0
--								jal licor 
--								addi $s1, $v1, 0
--								addi $a0, $t3, 0 
--								addi $a1, $s1, 0
--								jal alcohol
--								addi $s2, $v1, 0
--								addi $a0, $t0, 0
--								addi $a1, $t1, 0
--								jal formula
--								addi $s3, $v1, 0
--							formula:
--								addi $t5, $a0, 0
--								addi $t6, $a1, 0
--								beq $t5, $00, hombre
--									addi $t7, $00, 55
--									mult $t6, $t6, $t7
--									j salto
--								hombre: 
--									addi $t7, $00, 68
--									mult $t6, $t6, $t7
--									j salto
--								salto:
--									div $s2, $s2, $t6
--									mult $t4, $t4, $s2
--									add $s3, $00, $t4
--									jr $ra
--							licor:
--								add $t4, $00, $a0
--								addi $t5, $00, 4
--								mult $t4, $t4, $t5
--								lw $t5, $t5, $t4
--								add $v1, $00, $t5
--								jr $ra
--							alcohol:
--								addi $t0, $a0, 0
--								addi $t1, $a1, 0
--								addi $t4, $00, 100
--								addi $t5, $00, 80
--								mult $t6, $t0, $t1
--								mult $t7, $t6, $t5
--								div $t7, $t7, $t4
--								add $v1, $00, $t7
--								jr $ra



begin

	memOut <= mem(conv_integer(Address(1 downto 0))) when memRead = '1' else "00000000000000000000000000000000";

process(Address,Data,clk)

begin
	if(rising_edge(clk) ) then
		if(memWrite = '1' ) then
			mem(conv_integer(Address(1 downto 0))) <= Data;
		end if;
	end if;

end process;


end architecture;