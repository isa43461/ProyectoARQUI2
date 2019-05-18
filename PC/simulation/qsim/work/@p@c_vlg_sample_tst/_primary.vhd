library verilog;
use verilog.vl_types.all;
entity PC_vlg_sample_tst is
    port(
        band            : in     vl_logic;
        clk             : in     vl_logic;
        PcOl            : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end PC_vlg_sample_tst;
