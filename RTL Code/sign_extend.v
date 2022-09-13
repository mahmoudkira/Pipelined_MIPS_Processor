module signExtend (inst,Signlmm);
input [15:0]inst;
output [31:0]Signlmm;
assign Signlmm = { {16{inst[15]}} , inst[15:0]};
endmodule
