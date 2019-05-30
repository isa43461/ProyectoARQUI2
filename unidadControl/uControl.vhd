-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;

entity uControl is

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
end entity;

architecture rtl of uControl is

	-- Build an enumerated type for the state machine
	type state_type is (fetch, decode,memAddr,memReadSig,memWriteBack,memWriteSig,Execute,aluWriteBack,branchSig,jump,addi,division,multiplicacion,slt,paso,despuesAddi);

	-- Register to hold the current state
	signal state : state_type := fetch;

begin

	process (clk, reset)
	begin

		if (rising_edge(clk)) then
			if reset = '1' then
				state <= fetch;
			else
			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when fetch=>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "1111001"; --1

					state <= decode;

				when decode=>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0100100"; --2
					if opcode = "100011" then --lw
						state <= memAddr;
					elsif opcode = "101011" then --sw
						state <= memAddr;
					elsif opcode = "000100" then --beq
						state <= branchSig;
					elsif opcode = "000000" then --add
						state <= execute;
					elsif opcode = "000110" then --division
						state <= division;
					elsif opcode = "000001" then --addi
						state <= addi;
					elsif opcode = "000011" then --multiplicacion
						state <= multiplicacion;
					elsif opcode = "000101" then --slt
						state <= slt;
					elsif opcode = "000111" then --paso
						state <= paso;
					else-- opcode = "000010" then --j
						state <= jump;
					end if;
				
				when memAddr =>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0110000"; --3
					if opcode = "100011" then --lw
						state <= memReadSig;
					else-- opcode = "101011" then --sw
						state <= memWriteSig;
					end if;
				
				when memReadSig =>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0011001"; --4
					state <= memWriteBack;
					
				when memWriteBack =>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0010010"; --5---
					state <= fetch;
					
				when memWriteSig =>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0000010"; --6
					--if opcode = "101011" then
						state <= fetch;
					--else 
						--state <= null;
					--end if;
					
				when execute => --add
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "1111000"; --7

					state <= aluWriteBack;

					
				when addi => --add
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1000000";
					estado4 <= "1111001"; --10
				
					state <= aluWriteBack;
				
				when division => --div
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111001";
					estado4 <= "1111001"; --11		
					
					state <= aluWriteBack;
			
				when multiplicacion => --multiplicacion
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "0100100";
					estado4 <= "1111001"; --12		
					
					state <= aluWriteBack;
				
				when slt => --slt
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "0110000";
					estado4 <= "1111001"; --13		
					
					state <= aluWriteBack;
		
				when paso => --paso
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "0011001";
					estado4 <= "1111001"; --14		
					
					state <= fetch;	
					
				when despuesAddi => --despuesAddi
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "0010010";
					estado4 <= "1111001"; --15	

					state <= fetch;					
				when aluWriteBack=>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0000000"; --8

					state <= fetch;

					
				when branchSig =>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "0011000"; --9
					--if opcode = "000100" then
						state <= fetch;
					--else
						--state <= null;
					--end if;
				
				when jump =>
					estado1 <= "1111111";
					estado2 <= "1111111";
					estado3 <= "1111111";
					estado4 <= "1000000"; --0 jump
					state <= fetch;
				when others => null;

			end case;
			end if;
		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state, opcode,clk)
	begin
		if (rising_edge(clk)) then
			case state is
				when fetch=>
					pcWrite <= '1';
					branch <= '0';
					IorD <= '0';
					memRead <= '1';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '1';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "01";
					regWrite <= '0';
					regDst <= '0';
				when decode=>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "11";
					regWrite <= '0';
					regDst <= '0';
				when memAddr =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '1';
					aluSrcB <= "10";
					regWrite <= '0';
					regDst <= '0';
				when memReadSig =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '1';
					memRead <= '1';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';
				when memWriteSig =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '1';
					memRead <= '0';
					memWrite <= '1';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';
				when memWriteBack =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '1';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '1';
					regDst <= '0';
					
				when execute =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '1';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';

				when division =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "011";
					aluSrcA <= '1';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';

				when slt =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "110";
					aluSrcA <= '1';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';
					
				when addi =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '1';
					aluSrcB <= "10";
					regWrite <= '0';
					regDst <= '0';

				when despuesAddi =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '1';
					regDst <= '0';	
					
				when multiplicacion =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "010";
					aluSrcA <= '1';
					aluSrcB <= "10";
					regWrite <= '0';
					regDst <= '0';					
				when aluWriteBack =>
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '1';
					regDst <= '1';
				when branchSig =>
					pcWrite <= '0';
					branch <= '1';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "01";
					aluOP <= "001";
					aluSrcA <= '1';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';
				when jump =>
					pcWrite <= '1';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "10";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';
				when others => 
					pcWrite <= '0';
					branch <= '0';
					IorD <= '0';
					memRead <= '0';
					memWrite <= '0';
					memToReg <= '0';
					IRwrite <= '0';
					PCsrc <= "00";
					aluOP <= "000";
					aluSrcA <= '0';
					aluSrcB <= "00";
					regWrite <= '0';
					regDst <= '0';
			end case;
		end if;
	end process;

end rtl;

