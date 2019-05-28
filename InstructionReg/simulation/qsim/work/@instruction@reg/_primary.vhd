library verilog;
use verilog.vl_types.all;
entity InstructionReg is
    port(
        ins             : in     vl_logic_vector(31 downto 0);
        sal             : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        irwr            : in     vl_logic
    );
end InstructionReg;
