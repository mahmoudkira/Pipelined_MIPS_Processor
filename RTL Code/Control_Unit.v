module Control_unit (
    input  [5:0] opcode_cu,funct_cu,
    output[2:0] ALUControlD,
    output JumpD,MemWriteD,RegWriteD,RegDstD,ALUSrcD,MemtoRegD,BranchD
);
// Internal Connections
wire [1:0]ALUOp;
main_decoder U_maindecoder(
.opcode(opcode_cu),
.alu_op(ALUOp),
.jump(JumpD),
.memwrite(MemWriteD),
.regwrite(RegWriteD),
.regdest(RegDstD),
.alusrc(ALUSrcD),
.memtoreg(MemtoRegD),
.branch(BranchD)
);
alu_decoder U_aludecoder (
.alu_op(ALUOp),
.funct(funct_cu),
.alu_control(ALUControlD)
);




endmodule