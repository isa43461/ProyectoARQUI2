library verilog;
use verilog.vl_types.all;
entity Memory_vlg_sample_tst is
    port(
        addressIn       : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        dataIn          : in     vl_logic_vector(31 downto 0);
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Memory_vlg_sample_tst;
