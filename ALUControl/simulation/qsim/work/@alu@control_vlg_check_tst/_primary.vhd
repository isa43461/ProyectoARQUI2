library verilog;
use verilog.vl_types.all;
entity AluControl_vlg_check_tst is
    port(
        operation       : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end AluControl_vlg_check_tst;
