library verilog;
use verilog.vl_types.all;
entity prueba1 is
    port(
        muxA            : in     vl_logic;
        muxB            : in     vl_logic_vector(1 downto 0);
        ALUOp           : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        salidaPrueba    : out    vl_logic_vector(15 downto 0)
    );
end prueba1;
