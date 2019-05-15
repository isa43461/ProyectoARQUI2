library verilog;
use verilog.vl_types.all;
entity RegFile is
    port(
        RS              : in     vl_logic_vector(4 downto 0);
        RT              : in     vl_logic_vector(4 downto 0);
        RD              : in     vl_logic_vector(4 downto 0);
        Dato            : in     vl_logic_vector(31 downto 0);
        regWriteSignal  : in     vl_logic;
        clk             : in     vl_logic;
        regA            : out    vl_logic_vector(31 downto 0);
        regB            : out    vl_logic_vector(31 downto 0)
    );
end RegFile;
