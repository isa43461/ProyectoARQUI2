library verilog;
use verilog.vl_types.all;
entity InstructionReg_vlg_check_tst is
    port(
        sal             : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end InstructionReg_vlg_check_tst;
