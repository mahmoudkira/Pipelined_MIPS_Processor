module REG_E(
input [31:0] RD1_in,RD2_in,SignImmD,
input MemWriteD,RegWriteD,RegDstD,ALUSrcD,MemtoRegD,
input [4:0] RsD,RtD,RdD,
input[2:0] ALUControlD,
input CLK,CLR,rst,
output reg MemWriteE,RegWriteE,RegDstE,ALUSrcE,MemtoRegE,
output reg[2:0] ALUControlE,
output reg [31:0] RD1_out,RD2_out,SignImmE,
output reg [4:0] RsE,RtE,RdE
);
always @(posedge CLK or negedge rst) begin
if (!rst) begin
MemWriteE<=1'b0;
RegWriteE<=1'b0;
RegDstE<=1'b0;
ALUSrcE<=1'b0;
MemtoRegE<=1'b0;
ALUControlE<=3'b0;
RD1_out<=32'b0;
RD2_out<=32'b0;
SignImmE<=32'b0;
RsE<=5'b0;
RtE<=5'b0;
RdE<=5'b0; 
end
else if (CLR) begin
MemWriteE<=1'b0;
RegWriteE<=1'b0;
RegDstE<=1'b0;
ALUSrcE<=1'b0;
MemtoRegE<=1'b0;
ALUControlE<=3'b0;
RD1_out<=32'b0;
RD2_out<=32'b0;
SignImmE<=32'b0;
RsE<=5'b0;
RtE<=5'b0;
RdE<=5'b0;
end
else 
begin
MemWriteE<=MemWriteD;
RegWriteE<=RegWriteD;
RegDstE<=RegDstD;
ALUSrcE<=ALUSrcD;
MemtoRegE<=MemtoRegD;
ALUControlE<=ALUControlD;
RD1_out<=RD1_in;
RD2_out<=RD2_in;
SignImmE<=SignImmD;
RsE<=RsD;
RtE<=RtD;
RdE<=RdD;
end 
end  
endmodule