library verilog;
use verilog.vl_types.all;
entity prueba2 is
    port(
        regWrite        : in     vl_logic;
        regDst          : in     vl_logic;
        muxA            : in     vl_logic;
        muxB            : in     vl_logic_vector(1 downto 0);
        eALUOp          : in     vl_logic_vector(1 downto 0);
        memToReg        : in     vl_logic;
        clk             : in     vl_logic;
        salidaPrueba    : out    vl_logic_vector(15 downto 0)
    );
end prueba2;
