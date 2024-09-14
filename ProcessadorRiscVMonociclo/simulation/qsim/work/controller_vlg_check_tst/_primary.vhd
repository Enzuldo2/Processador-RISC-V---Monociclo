library verilog;
use verilog.vl_types.all;
entity controller_vlg_check_tst is
    port(
        ALUControl      : in     vl_logic_vector(2 downto 0);
        ALUOp2          : in     vl_logic_vector(1 downto 0);
        ALUSrc          : in     vl_logic;
        Beq             : in     vl_logic;
        Bge             : in     vl_logic;
        Blt             : in     vl_logic;
        Bne             : in     vl_logic;
        Branch2         : in     vl_logic_vector(3 downto 0);
        ImmSrc          : in     vl_logic_vector(1 downto 0);
        Jump            : in     vl_logic;
        MemWrite        : in     vl_logic;
        PCSrc           : in     vl_logic;
        RegWrite        : in     vl_logic;
        ResultSrc       : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end controller_vlg_check_tst;
