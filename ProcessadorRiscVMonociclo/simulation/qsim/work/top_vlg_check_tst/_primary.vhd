library verilog;
use verilog.vl_types.all;
entity top_vlg_check_tst is
    port(
        ALUOp2          : in     vl_logic_vector(1 downto 0);
        Beq             : in     vl_logic;
        Bge             : in     vl_logic;
        Blt             : in     vl_logic;
        Bne             : in     vl_logic;
        Branch          : in     vl_logic_vector(3 downto 0);
        DataAdr         : in     vl_logic_vector(31 downto 0);
        MemWrite        : in     vl_logic;
        Menor           : in     vl_logic;
        WriteData       : in     vl_logic_vector(31 downto 0);
        Zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end top_vlg_check_tst;
