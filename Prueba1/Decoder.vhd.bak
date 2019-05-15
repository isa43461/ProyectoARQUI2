library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.numeric_bit.all;

entity Decoder is

port(
		
		unidades, decenas, centenas, mil: in std_logic_vector(3 DOWNTO 0);
		LedU, LedD, LedC, LedMil: out std_logic_vector(6 DOWNTO 0) 
);

end entity;


architecture Decoder_arc of Decoder is


begin
	process(unidades, decenas, centenas, mil)
		begin
		
		if(unidades="0001")then 
			LedU <= "1111001";
		elsif(unidades="0010")then 
			LedU <= "0100100";
		elsif(unidades="0011")then 
			LedU <= "0110000";	
		elsif(unidades="0100")then 
			LedU <= "0011001";
		elsif(unidades="0101")then 
			LedU <= "0010010";
		elsif(unidades="0110")then 
			LedU <= "0000010";
		elsif(unidades="0111")then 
			LedU <= "1111000";
		elsif(unidades="1000")then 
			LedU <= "0000000";
		elsif(unidades="1001")then 
			LedU <= "0011000";
		else 
			LedU <= "1000000";
		end if;
		
		
		if(decenas="0001")then 
			LedD <= "1111001";
		elsif(decenas="0010")then 
			LedD <= "0100100";
		elsif(decenas="0011")then 
			LedD <= "0110000";	
		elsif(decenas="0100")then 
			LedD <= "0011001";
		elsif(decenas="0101")then 
			LedD <= "0010010";
		elsif(decenas="0110")then 
			LedD <= "0000010";
		elsif(decenas="0111")then 
			LedD <= "1111000";
		elsif(decenas="1000")then 
			LedD <= "0000000";
		elsif(decenas="1001")then 
			LedD <= "0011000";
		else
			LedD <= "1000000";
		end if;
		
		
		if(centenas="0001")then 
			LedC <= "1111001";
		elsif(centenas="0010")then 
			LedC <= "0100100";
		elsif(centenas="0011")then 
			LedC <= "0110000";	
		elsif(centenas="0100")then 
			LedC <= "0011001";
		elsif(centenas="0101")then 
			LedC <= "0010010";
		elsif(centenas="0110")then 
			LedC <= "0000010";
		elsif(centenas="0111")then 
			LedC <= "1111000";
		elsif(centenas="1000")then 
			LedC <= "0000000";
		elsif(centenas="1001")then 
			LedC <= "0011000";
		else 
			LedC <= "1000000";
		end if;
		
		
		if(mil="0001")then
			LedMil <= "1111001";
		elsif(mil="0010")then 
			LedMil <= "0100100";
		elsif(mil="0011")then 
			LedMil <= "0110000";	
		elsif(mil="0100")then 
			LedMil <= "0011001";
		elsif(mil="0101")then
			LedMil <= "0010010";
		elsif(mil="0110")then 
			LedMil <= "0000010";
		elsif(mil="0111")then 
			LedMil <= "1111000";
		elsif(mil="1000")then 
			LedMil <= "0000000";
		elsif(mil="1001")then 
			LedMil <= "0011000";
		else 
			LedMil <= "1000000";
		end if;
		
		
	end process;
end architecture;