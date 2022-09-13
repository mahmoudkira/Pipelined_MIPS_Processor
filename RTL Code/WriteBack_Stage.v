module WB_Stage (
input  Clk,rst,
input RegWriteM,MemtoRegM,
input [4:0] WriteRegM,
input [31:0] RD,ALUOutM,
output [31:0] ResultW,
output [4:0] WriteRegW,
output RegWriteW
);
//InterConnections
wire MemtoRegW;
wire [31:0]ReadDataW;
wire [31:0]ALUOutW;
////////////////////////////////////////////

//Instantiate WriteBack Register 
REG_WB WB_Reg(
.RD(RD),
.ALUOutM(ALUOutM),
.RegWriteM(RegWriteM),
.MemtoRegM(MemtoRegM),
.WriteRegM(WriteRegM),
.CLK(Clk),
.rst(rst),
.RegWriteW(RegWriteW),
.MemtoRegW(MemtoRegW),
.ALUOutW(ALUOutW),
.ReadDataW(ReadDataW),
.WriteRegW(WriteRegW) 
);
/////////////////////////////////////////////


//Instantiate Mux Unit
MUX WB_mux (
.in1(ALUOutW),
.in2(ReadDataW),
.sel(MemtoRegW),
.out(ResultW)
);
////////////////////////////////////////////
endmodule