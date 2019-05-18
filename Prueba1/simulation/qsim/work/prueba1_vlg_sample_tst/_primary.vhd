library verilog;
use verilog.vl_types.all;
entity prueba1_vlg_sample_tst is
    port(
        ALUOp           : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        muxA            : in     vl_logic;
        muxB            : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end prueba1_vlg_sample_tst;
