library verilog;
use verilog.vl_types.all;
entity Memory_vlg_check_tst is
    port(
        memData         : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Memory_vlg_check_tst;