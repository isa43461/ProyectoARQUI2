library verilog;
use verilog.vl_types.all;
entity Alu is
    port(
        OP              : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        res             : out    vl_logic_vector(31 downto 0);
        br              : out    vl_logic
    );
end Alu;
