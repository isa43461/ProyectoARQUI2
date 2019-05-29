library verilog;
use verilog.vl_types.all;
entity prueba2_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        eALUOp          : in     vl_logic_vector(1 downto 0);
        memToReg        : in     vl_logic;
        muxA            : in     vl_logic;
        muxB            : in     vl_logic_vector(1 downto 0);
        regDst          : in     vl_logic;
        regWrite        : in     vl_logic;
        salidaPrueba    : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end prueba2_vlg_sample_tst;
