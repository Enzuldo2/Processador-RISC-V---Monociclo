library verilog;
use verilog.vl_types.all;
entity extend_vlg_check_tst is
    port(
        immext          : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end extend_vlg_check_tst;
