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
		regDst : out	std_logic
	);

end entity;

architecture rtl of uControl is

	-- Build an enumerated type for the state machine
	type state_type is (fetch, decode,memAddr,memReadSig,memWriteBack,memWriteSig,Execute,aluWriteBack,branchSig,jump);

	-- Register to hold the current state
	signal state : state_type := fetch;

begin

	process (clk, reset)
	begin

		if reset = '1' then
			state <= fetch;

		elsif (rising_edge(clk)) then

			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when fetch=>
					if opcode = "100011" then --lw
						state <= decode;
					elsif opcode = "101011" then --sw
						state <= decode;
					elsif opcode = "000100" then --beq
						state <= decode;
					elsif opcode = "000000" then --R
						state <= decode;
					else -- opcode = "000010" then --j
						state <= decode;
					end if;
				when decode=>
					if opcode = "100011" then --lw
						state <= memAddr;
					elsif opcode = "101011" then --sw
						state <= memAddr;
					elsif opcode = "000100" then --beq
						state <= branchSig;
					elsif opcode = "000000" then --R
						state <= execute;
					else --opcode = "000010" then --j
						state <= jump;
					end if;
				when memAddr =>
					if opcode = "100011" then --lw
						state <= memReadSig;
					else --opcode = "101011" then --sw
						state <= memWriteSig;
					end if;
				when memReadSig =>
					state <= memWriteBack;
					
				when memWriteBack =>
					state <= memWriteBack;
					
				when memWriteSig =>
					state <= fetch;
				
				when execute =>
					state <= aluWriteBack;
					
				when aluWriteBack=>
					state <= fetch;
				when branchSig =>
					state <= fetch;
				
				when jump =>
					state <= fetch;
				when others => null;

			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state, opcode)
	begin
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
					aluOP <= "010";
					aluSrcA <= '1';
					aluSrcB <= "00";
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
	end process;

end rtl;

