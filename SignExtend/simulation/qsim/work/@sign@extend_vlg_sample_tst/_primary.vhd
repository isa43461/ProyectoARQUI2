library verilog;
use verilog.vl_types.all;
entity SignExtend_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end SignExtend_vlg_sample_tst;
