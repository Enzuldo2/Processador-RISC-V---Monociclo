library verilog;
use verilog.vl_types.all;
entity riscvsingle is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PC              : out    vl_logic_vector(31 downto 0);
        Instr           : in     vl_logic_vector(31 downto 0);
        MemWrite        : out    vl_logic;
        ALUResult       : out    vl_logic_vector(31 downto 0);
        WriteData       : out    vl_logic_vector(31 downto 0);
        ReadData        : in     vl_logic_vector(31 downto 0);
        Branch          : out    vl_logic_vector(3 downto 0);
        ALUOp2          : out    vl_logic_vector(1 downto 0);
        Bne             : out    vl_logic;
        Bge             : out    vl_logic;
        Blt             : out    vl_logic;
        Beq             : out    vl_logic;
        Zero2           : out    vl_logic;
        Menor2          : out    vl_logic
    );
end riscvsingle;
