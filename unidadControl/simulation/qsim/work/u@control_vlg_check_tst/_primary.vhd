library verilog;
use verilog.vl_types.all;
entity uControl_vlg_check_tst is
    port(
        aluOP           : in     vl_logic_vector(2 downto 0);
        aluSrcA         : in     vl_logic;
        aluSrcB         : in     vl_logic_vector(1 downto 0);
        branch          : in     vl_logic;
        IorD            : in     vl_logic;
        IRwrite         : in     vl_logic;
        memRead         : in     vl_logic;
        memToReg        : in     vl_logic;
        memWrite        : in     vl_logic;
        PCsrc           : in     vl_logic_vector(1 downto 0);
        pcWrite         : in     vl_logic;
        regDst          : in     vl_logic;
        regWrite        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end uControl_vlg_check_tst;
