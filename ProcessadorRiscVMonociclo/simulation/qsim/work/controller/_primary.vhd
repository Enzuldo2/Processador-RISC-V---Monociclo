library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        op              : in     vl_logic_vector(6 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7b5        : in     vl_logic;
        Zero            : in     vl_logic;
        Menor           : in     vl_logic;
        ResultSrc       : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        PCSrc           : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        Jump            : out    vl_logic;
        ImmSrc          : out    vl_logic_vector(1 downto 0);
        ALUControl      : out    vl_logic_vector(2 downto 0);
        Branch2         : out    vl_logic_vector(3 downto 0);
        ALUOp2          : out    vl_logic_vector(1 downto 0);
        Bne             : out    vl_logic;
        Bge             : out    vl_logic;
        Blt             : out    vl_logic;
        Beq             : out    vl_logic
    );
end controller;
