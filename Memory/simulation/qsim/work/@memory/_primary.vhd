library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        addressIn       : in     vl_logic_vector(31 downto 0);
        dataIn          : in     vl_logic_vector(31 downto 0);
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        clk             : in     vl_logic;
        memOut          : out    vl_logic_vector(31 downto 0)
    );
end Memory;
