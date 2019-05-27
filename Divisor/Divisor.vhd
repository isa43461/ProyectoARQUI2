library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor is
	port (
		clkIn : in std_logic;
		clkOut : out std_logic);
end divisor;

architecture behavior of divisor is
begin
	process (clkIn)
		variable state: std_logic := '0';
	begin
		if (rising_edge(clkIn)) then
			state := not state;
		end if;
		clkOut <= state;
	end process;
end behavior;



--Library IEEE;
--Use IEEE.std_logic_1164.all;
--
--Entity Divisor is
--	port
--	(
--		Clkin: in std_logic;
--		Clkout: out std_logic
--	);
--	
--End Divisor;
--
--Architecture Behaviour of Divisor is
--	Constant max: natural := 50000000/20 ;
--	Signal counter : integer range 0 to max := 0;
--	Signal State: std_logic := '0';
--	
--	Begin
--	
--		Process(Clkin,counter,state)
--			Begin
--				if(rising_edge(clkin)) then
--					if counter = max then
--						state <= not state;
--						
--						counter <= 0;
--						
--					else
--						counter <= counter + 1;
--						
--					end if;
--				end if;
--				Clkout <= state;
--		end process;
--
--End Architecture;