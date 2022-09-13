module M_Stage (
    input [31:0] ALUOutE,WriteDataE,
    input MemWriteE,RegWriteE,MemtoRegE,
    input [4:0] WriteRegE,
    input CLK,rst,
    output RegWriteM,MemtoRegM,
    output [15:0] test_value,
    output [31:0] ALUOutM,RD,
    output [4:0] WriteRegM
);
// Interconnections
wire MemWriteM;
wire [31:0] WriteDataM;
/////////////////////////////////////////////

//Instantiate Memory Register 
REG_M M_Reg(
    .ALUOutE(ALUOutE),
    .WriteDataE(WriteDataE),
    .MemWriteE(MemWriteE),
    .RegWriteE(RegWriteE),
    .MemtoRegE(MemtoRegE),
    .WriteRegE(WriteRegE),
    .CLK(CLK),
    .rst(rst),
    .MemWriteM(MemWriteM),
    .RegWriteM(RegWriteM),
    .MemtoRegM(MemtoRegM),
    .ALUOutM(ALUOutM),
    .WriteDataM(WriteDataM),
    .WriteRegM(WriteRegM) 
);
////////////////////////////////////////////

//Instantiate Data_Memory
Data_Memory M_DM(
    .A(ALUOutM),
    .WD(WriteDataM),
    .WE(MemWriteM),
    .RD(RD),
    .clk(CLK),
    .rst(rst),
    .tst(test_value)
);
/////////////////////////////////////////
endmodule