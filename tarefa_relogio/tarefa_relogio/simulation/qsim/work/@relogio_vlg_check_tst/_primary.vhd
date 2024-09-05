library verilog;
use verilog.vl_types.all;
entity Relogio_vlg_check_tst is
    port(
        hora_v          : in     vl_logic_vector(3 downto 0);
        led             : in     vl_logic;
        min_v           : in     vl_logic_vector(3 downto 0);
        segmento_hora_dezena: in     vl_logic_vector(6 downto 0);
        segmento_hora_unidade: in     vl_logic_vector(6 downto 0);
        segmento_min_dezena: in     vl_logic_vector(6 downto 0);
        segmento_min_unidade: in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Relogio_vlg_check_tst;
