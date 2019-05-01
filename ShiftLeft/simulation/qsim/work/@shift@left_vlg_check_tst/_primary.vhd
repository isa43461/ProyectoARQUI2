library verilog;
use verilog.vl_types.all;
entity ShiftLeft_vlg_check_tst is
    port(
        y               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end ShiftLeft_vlg_check_tst;
