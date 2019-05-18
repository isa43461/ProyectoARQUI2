library verilog;
use verilog.vl_types.all;
entity Alu_vlg_check_tst is
    port(
        br              : in     vl_logic;
        res             : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Alu_vlg_check_tst;
