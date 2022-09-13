module REG_M(
input [31:0] ALUOutE,WriteDataE,
input MemWriteE,RegWriteE,MemtoRegE,
input [4:0] WriteRegE,
input CLK,rst,
output reg MemWriteM,RegWriteM,MemtoRegM,
output reg [31:0] ALUOutM,WriteDataM,
output reg [4:0] WriteRegM 
);
always @(posedge CLK or negedge rst) begin
    if(!rst) begin
MemWriteM<=0;
RegWriteM<=0;
MemtoRegM<=0;
ALUOutM<=0;
WriteDataM<=0;
WriteRegM<=0;  
    end
    else begin
MemWriteM<=MemWriteE;
RegWriteM<=RegWriteE;
MemtoRegM<=MemtoRegE;
ALUOutM<=ALUOutE;
WriteDataM<=WriteDataE;
WriteRegM<=WriteRegE;
end 
end
endmodule