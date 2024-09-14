library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        WriteData       : out    vl_logic_vector(31 downto 0);
        DataAdr         : out    vl_logic_vector(31 downto 0);
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic_vector(3 downto 0);
        ALUOp2          : out    vl_logic_vector(1 downto 0);
        Bne             : out    vl_logic;
        Bge             : out    vl_logic;
        Blt             : out    vl_logic;
        Beq             : out    vl_logic;
        Zero            : out    vl_logic;
        Menor           : out    vl_logic
    );
end top;
