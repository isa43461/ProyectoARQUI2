library verilog;
use verilog.vl_types.all;
entity RegFile_vlg_check_tst is
    port(
        regA            : in     vl_logic_vector(31 downto 0);
        regB            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end RegFile_vlg_check_tst;
