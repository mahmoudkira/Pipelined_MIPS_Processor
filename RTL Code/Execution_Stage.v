module E_stage (
input clk,rst,FlushE,
input [31:0] RD1_in,RD2_in,SignImmD,ALUOutM,ResultW,
input MemWriteD,RegWriteD,RegDstD,ALUSrcD,MemtoRegD,
input [4:0] RsD,RtD,RdD,
input [2:0] ALUControlD,
input [1:0] ForwardAE,ForwardBE,
output [31:0] ALUOutE,WriteDataE,
output MemWriteE,RegWriteE,MemtoRegE,
output [4:0] WriteRegE,RsE,RtE
);
// Interconnections
wire [4:0] RdE;
wire RegDstE;
wire [31:0]SignImmE;
wire ALUSrcE;
wire [31:0]SrcBE;
wire [31:0]SrcAE;
wire [2:0]ALUControlE;
wire [31:0]RD1_out;
wire [31:0]RD2_out;
////////////////////////////////////////////////

//Instantiate Excecution Register 
 REG_E E_reg(
 .RD1_in(RD1_in),
 .RD2_in(RD2_in),
 .SignImmD(SignImmD),
 .MemWriteD(MemWriteD),
 .RegWriteD(RegWriteD),
 .RegDstD(RegDstD),
 .ALUSrcD(ALUSrcD),
 .MemtoRegD(MemtoRegD),
 .RsD(RsD),
 .RtD(RtD),
 .RdD(RdD),
 .ALUControlD(ALUControlD),
 .CLK(clk),
 .CLR(FlushE),
 .rst(rst),
 .MemWriteE(MemWriteE),
 .RegWriteE(RegWriteE),
 .RegDstE(RegDstE),
 .ALUSrcE(ALUSrcE),
 .MemtoRegE(MemtoRegE),
 .ALUControlE(ALUControlE),
 .RD1_out(RD1_out),
 .RD2_out(RD2_out),
 .SignImmE(SignImmE),
 .RsE(RsE),
 .RtE(RtE),
 .RdE(RdE)
);
////////////////////////////////////////////////////////////////

//Instantiate Mux Unit
 MUX #(.width(5))E_mux2x1_1(
.in1(RtE),
.in2(RdE),
.sel(RegDstE),
.out(WriteRegE)
    );
////////////////////////////////////////////////////////////////

//Instantiate Mux Unit
 MUX E_mux2x1_2(
.in1(WriteDataE),
.in2(SignImmE),
.sel(ALUSrcE),
.out(SrcBE)
    );
////////////////////////////////////////////////////////////////

//Instantiate Mux Unit
 Mux_3 E_mux4x1_1(
.in0(RD1_out),
.in1(ResultW),
.in2(ALUOutM),
.in3(32'b0),
.sel(ForwardAE),
.out(SrcAE)
);
////////////////////////////////////////////////////////////////

//Instantiate Mux Unit
 Mux_3 E_mux4x1_2(
.in0(RD2_out),
.in1(ResultW),
.in2(ALUOutM),
.in3(32'b0),
.sel(ForwardBE),
.out(WriteDataE)
);
////////////////////////////////////////////////////////////////

//Instantiate ALU Unit
alu E_alu(
.A(SrcAE),
.B(SrcBE),
.Op(ALUControlE), 
.alu_out(ALUOutE)
);

endmodule