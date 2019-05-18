library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        signalMemRead   : in     vl_logic;
        signalMemWrite  : in     vl_logic;
        memData         : out    vl_logic_vector(31 downto 0)
    );
end Memory;
