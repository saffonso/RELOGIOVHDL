library verilog;
use verilog.vl_types.all;
entity Relogio is
    port(
        c               : in     vl_logic;
        reset           : in     vl_logic;
        carga           : in     vl_logic;
        hora_ajuste_unidade: in     vl_logic_vector(3 downto 0);
        min_ajuste_unidade: in     vl_logic_vector(3 downto 0);
        min_ajuste_dezena: in     vl_logic_vector(3 downto 0);
        led             : out    vl_logic;
        hora_v          : out    vl_logic_vector(3 downto 0);
        min_v           : out    vl_logic_vector(3 downto 0);
        hora_ajuste_dezena: in     vl_logic_vector(2 downto 0);
        segmento_hora_dezena: out    vl_logic_vector(6 downto 0);
        segmento_hora_unidade: out    vl_logic_vector(6 downto 0);
        segmento_min_dezena: out    vl_logic_vector(6 downto 0);
        segmento_min_unidade: out    vl_logic_vector(6 downto 0)
    );
end Relogio;
