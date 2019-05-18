library verilog;
use verilog.vl_types.all;
entity AluControl_vlg_sample_tst is
    port(
        aluOP           : in     vl_logic_vector(1 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end AluControl_vlg_sample_tst;
