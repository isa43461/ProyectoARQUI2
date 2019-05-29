library verilog;
use verilog.vl_types.all;
entity prueba3_vlg_check_tst is
    port(
        salidaPrueba    : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end prueba3_vlg_check_tst;
