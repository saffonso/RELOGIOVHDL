library verilog;
use verilog.vl_types.all;
entity Relogio_vlg_sample_tst is
    port(
        c               : in     vl_logic;
        carga           : in     vl_logic;
        hora_ajuste_dezena: in     vl_logic_vector(2 downto 0);
        hora_ajuste_unidade: in     vl_logic_vector(3 downto 0);
        min_ajuste_dezena: in     vl_logic_vector(3 downto 0);
        min_ajuste_unidade: in     vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Relogio_vlg_sample_tst;
