library verilog;
use verilog.vl_types.all;
entity RegFile_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        Dato            : in     vl_logic_vector(31 downto 0);
        RD              : in     vl_logic_vector(4 downto 0);
        regWriteSignal  : in     vl_logic;
        RS              : in     vl_logic_vector(4 downto 0);
        RT              : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end RegFile_vlg_sample_tst;
