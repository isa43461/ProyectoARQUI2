library verilog;
use verilog.vl_types.all;
entity pruebaControl is
    port(
        clk             : in     vl_logic;
        pcWrite         : out    vl_logic;
        branch          : out    vl_logic;
        IorD            : out    vl_logic;
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        memToReg        : out    vl_logic;
        IRwrite         : out    vl_logic;
        PCsrc           : out    vl_logic_vector(1 downto 0);
        aluOP           : out    vl_logic_vector(2 downto 0);
        aluSrcA         : out    vl_logic;
        aluSrcB         : out    vl_logic_vector(1 downto 0);
        regWrite        : out    vl_logic;
        regDst          : out    vl_logic
    );
end pruebaControl;
