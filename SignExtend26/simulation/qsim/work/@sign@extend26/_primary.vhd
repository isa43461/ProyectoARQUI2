library verilog;
use verilog.vl_types.all;
entity SignExtend26 is
    port(
        x               : in     vl_logic_vector(25 downto 0);
        res             : out    vl_logic_vector(31 downto 0)
    );
end SignExtend26;
