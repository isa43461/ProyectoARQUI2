library verilog;
use verilog.vl_types.all;
entity InstructionReg_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        ins             : in     vl_logic_vector(31 downto 0);
        irwr            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end InstructionReg_vlg_sample_tst;
