library verilog;
use verilog.vl_types.all;
entity alu_vlg_check_tst is
    port(
        Menor           : in     vl_logic;
        Zero            : in     vl_logic;
        result          : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end alu_vlg_check_tst;
