module F_Stage (
input   Clk,rst,StallF,
input   [31:0]PCBranchD,PCjump,
input   [1:0] PCSrcD,
output  [31:0] RD,PCPlus4F
);
//InterConnections
wire [31:0]PC;
wire [31:0]PCF;
Mux_3 F_mux(
.in0(PCPlus4F),
.in1(PCBranchD),
.in2(PCjump),
.in3(32'b0),
.sel(PCSrcD),
.out(PC)
);
///////////////////////////////////////

//Instantiate Program Counter Unit
Program_Counter F_PC(
.PC1(PC),
.PCF(PCF),
.CLK(Clk),
.EN(StallF),
.rst(rst)
);
///////////////////////////////////////

//Instantiate Instruction_Memory
Instruction_Memory F_Instr(
.PC(PCF),
.RD(RD)
);
///////////////////////////////////////

//Instantiate Adder Unit
Adder F_Adder (
.A(PCF),
.B(32'd4),
.C(PCPlus4F)
);
///////////////////////////////////////
endmodule