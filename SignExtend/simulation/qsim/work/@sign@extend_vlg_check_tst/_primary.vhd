library verilog;
use verilog.vl_types.all;
entity SignExtend_vlg_check_tst is
    port(
        res             : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end SignExtend_vlg_check_tst;
