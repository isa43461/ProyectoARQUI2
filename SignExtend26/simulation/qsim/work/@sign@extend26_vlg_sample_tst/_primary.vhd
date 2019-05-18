library verilog;
use verilog.vl_types.all;
entity SignExtend26_vlg_sample_tst is
    port(
        x               : in     vl_logic_vector(25 downto 0);
        sampler_tx      : out    vl_logic
    );
end SignExtend26_vlg_sample_tst;
