module Piplined_Mips (
input CLK,Reset,
output [15:0] test_value    
);
//InterConnections
wire        StallF;
wire        [1:0] PCSrcD;
wire        [31:0] RD_F,RD_M;
wire        [31:0] PCPlus4F;
wire        [31:0] PCBranchD;
wire        [31:0] PCjump;
wire        StallD;
wire        ForwardAD,ForwardBD;
wire        [31:0] ResultW,ALUOutM;
wire        RegWriteW,MemWriteD,RegWriteD,RegDstD,ALUSrcD,MemtoRegD,JumpD,BranchD;
wire        [4:0] WriteRegW,RsD,RtD,RdD;
wire        [31:0] RD1,RD2,SignImmD,SignImmE;
wire        [2:0] ALUControlD ;
wire        FlushE;
wire        [1:0] ForwardAE,ForwardBE;
wire        [4:0] WriteRegE,RsE,RtE;
wire        [31:0] WriteDataE,ALUOutE;
wire        RegWriteE,MemWriteE,MemtoRegE;
wire        RegWriteM,MemtoRegM;
wire        [4:0] WriteRegM;
//////////////////////////////////////////////////

//Instantiate Fetch Stage
F_Stage Mips_F (
.Clk(CLK),
.rst(Reset),
.StallF(StallF),
.PCBranchD(PCBranchD),
.PCjump(PCjump),
.PCSrcD(PCSrcD),
.RD(RD_F),
.PCPlus4F(PCPlus4F)
);
//////////////////////////////////////////////////

//Instantiate Decode Stage
Dec_Stage Mips_D (
.RD(RD_F),
.PCPlus4F(PCPlus4F),
.ResultW(ResultW),
.ALUOutM(ALUOutM),
.CLK(CLK),
.rst(Reset),
.ForwardAD(ForwardAD),
.ForwardBD(ForwardBD),
.StallD(StallD),
.RegWriteW(RegWriteW),
.WriteRegW(WriteRegW),
.RD1(RD1),
.RD2(RD2),
.SignImmD(SignImmD),
.PCBranchD(PCBranchD),
.PCjump(PCjump),
.PCSrcD(PCSrcD),
.RsD(RsD),
.RtD(RtD),
.RdD(RdD),
.ALUControlD(ALUControlD),
.MemWriteD(MemWriteD),
.RegWriteD(RegWriteD),
.RegDstD(RegDstD),
.ALUSrcD(ALUSrcD),
.MemtoRegD(MemtoRegD),
.JumpD(JumpD),
.BranchD(BranchD)
);
//////////////////////////////////////////////////

//Instantiate Execution Stage
E_stage Mips_E (
.clk(CLK),
.rst(Reset),
.FlushE(FlushE),
.RD1_in(RD1),
.RD2_in(RD2),
.SignImmD(SignImmD),
.ALUOutM(ALUOutM),
.ResultW(ResultW),
.MemWriteD(MemWriteD),
.RegWriteD(RegWriteD),
.RegDstD(RegDstD),
.ALUSrcD(ALUSrcD),
.MemtoRegD(MemtoRegD),
.RsD(RsD),
.RtD(RtD),
.RdD(RdD),
.ALUControlD(ALUControlD),
.ForwardAE(ForwardAE),
.ForwardBE(ForwardBE),
.ALUOutE(ALUOutE),
.WriteDataE(WriteDataE),
.MemWriteE(MemWriteE),
.RegWriteE(RegWriteE),
.MemtoRegE(MemtoRegE),
.WriteRegE(WriteRegE),
.RsE(RsE),
.RtE(RtE)
);
//////////////////////////////////////////////////

//Instantiate Memory Stage
M_Stage Mips_M (
.ALUOutE(ALUOutE),
.WriteDataE(WriteDataE),
.MemWriteE(MemWriteE),
.RegWriteE(RegWriteE),
.MemtoRegE(MemtoRegE),
.WriteRegE(WriteRegE),
.CLK(CLK),
.rst(Reset),
.RegWriteM(RegWriteM),
.MemtoRegM(MemtoRegM),
.test_value(test_value),
.ALUOutM(ALUOutM),
.RD(RD_M),
.WriteRegM(WriteRegM)
);
//////////////////////////////////////////////////

//Instantiate WriteBack Stage
WB_Stage Mips_WB(
.Clk(CLK),
.rst(Reset),
.RegWriteM(RegWriteM),
.MemtoRegM(MemtoRegM),
.WriteRegM(WriteRegM),
.RD(RD_M),
.ALUOutM(ALUOutM),
.ResultW(ResultW),
.WriteRegW(WriteRegW),
.RegWriteW(RegWriteW)
);
//////////////////////////////////////////////////

//Instantiate Hazard Unit Stage
Hazard_Unit Mips_HU (     
.RsD(RsD),
.RtD(RtD),
.RsE(RsE),
.RtE(RtE),
.WriteRegE(WriteRegE),
.WriteRegW(WriteRegW),
.WriteRegM(WriteRegM),
.BranchD(BranchD),
.MemtoRegE(MemtoRegE),
.RegWriteE(RegWriteE),
.MemtoRegM(MemtoRegM), 
.RegWriteM(RegWriteM), 
.RegWriteW(RegWriteW),
.JumpD(JumpD),
.StallF(StallF), 
.StallD(StallD),
.FlushE(FlushE),
.ForwardAD(ForwardAD),
.ForwardBD(ForwardBD),
.ForwardAE(ForwardAE),
.ForwardBE(ForwardBE)
);
//////////////////////////////////////////////////
   
endmodule