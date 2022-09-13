module Dec_Stage (
input   [31:0] RD,PCPlus4F,ResultW,ALUOutM,
input   CLK,rst,ForwardAD,ForwardBD,StallD,RegWriteW,
input   [4:0] WriteRegW,
output  [31:0] RD1,RD2,SignImmD,PCBranchD,PCjump,
output  [1:0] PCSrcD,
output  [4:0] RsD,RtD,RdD,
output  [2:0] ALUControlD,
output  MemWriteD,RegWriteD,RegDstD,ALUSrcD,MemtoRegD,JumpD,BranchD
);
// Interconnections
wire     [31:0] InstrD;
wire            OR_Out;
wire            AND_Out;
wire            EqualD;
wire     [31:0] PCPlus4D;
wire     [31:0] mux_out1,mux_out2;
wire     [31:0] shiftleftoutImm;
assign RsD= InstrD[25:21];
assign RtD= InstrD[20:16];
assign RdD= InstrD[15:11];
assign PCjump={PCPlus4D[31:28],InstrD[25:0],2'b00};
assign AND_Out= BranchD & EqualD;
assign OR_Out=  JumpD | AND_Out;
assign PCSrcD={JumpD,AND_Out};
////////////////////////////////////////////////////////////

//Instantiate Decoder Register 
REG_D D_Reg(
.RD(RD),
.PCPlus4F(PCPlus4F),
.CLK(CLK),
.EN(StallD),
.CLR(OR_Out),
.rst(rst),
.InstrD(InstrD),
.PCPlus4D(PCPlus4D)
 );
//////////////////////////////////////////////////////

//Instantiate  Control Unit
Control_unit Dec_control_unit (
.opcode_cu(InstrD[31:26]),
.funct_cu(InstrD[5:0]),
.ALUControlD(ALUControlD),
.JumpD(JumpD),
.MemWriteD(MemWriteD),
.RegWriteD(RegWriteD),
.RegDstD(RegDstD),
.ALUSrcD(ALUSrcD),
.MemtoRegD(MemtoRegD),
.BranchD(BranchD)
);
/////////////////////////////////////////////////////////

//Instantiate Register File Unit
 Register_File U_regfile (
 .A1(InstrD[25:21]),
 .A2(InstrD[20:16]),
 .A3(WriteRegW),
 .WD(ResultW),
 .WE(RegWriteW),
 .RD1(RD1),
 .RD2(RD2),
 .clk(CLK),
 .rst(rst));
////////////////////////////////////////////////////

//Instantiate SignExtend Unit
signExtend U_signextend(
.inst(InstrD[15:0]),
.Signlmm(SignImmD)
);
////////////////////////////////////////////////////////

//Instantiate Shiftlefttwice Unit
shiftlefttwice #(.width(32))shift_signextend(
.in(SignImmD),
.out(shiftleftoutImm)
);
////////////////////////////////////////////////////////

//Instantiate Adder Unit
Adder Dec_Adder(
.A(shiftleftoutImm),
.B(PCPlus4D),
.C(PCBranchD)
);
///////////////////////////////////////////////////////

//Instantiate Mux Unit
 MUX D_mux2x1_1(
.in1(RD1),
.in2(ALUOutM),
.sel(ForwardAD),
.out(mux_out1)
);
///////////////////////////////////////////////////////////////

//Instantiate Mux Unit
 MUX D_mux2x1_2(
.in1(RD2),
.in2(ALUOutM),
.sel(ForwardBD),
.out(mux_out2)
);
///////////////////////////////////////////////////////////

//Instantiate Compartor Unit
Equal D_Equal(
.A(mux_out1),
.B(mux_out2),
.EqualD(EqualD)
);
////////////////////////////////////////////////////////
endmodule