library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        PcOl            : in     vl_logic_vector(31 downto 0);
        pcAc            : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        band            : in     vl_logic
    );
end PC;
