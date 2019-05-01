library verilog;
use verilog.vl_types.all;
entity ShiftLeft_vlg_sample_tst is
    port(
        w               : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end ShiftLeft_vlg_sample_tst;
