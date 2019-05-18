library verilog;
use verilog.vl_types.all;
entity Memory_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        signalMemRead   : in     vl_logic;
        signalMemWrite  : in     vl_logic;
        writeData       : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Memory_vlg_sample_tst;
