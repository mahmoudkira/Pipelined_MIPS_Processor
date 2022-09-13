module REG_WB(
input [31:0] RD,ALUOutM,
input RegWriteM,MemtoRegM,
input [4:0] WriteRegM,
input CLK,rst,
output reg RegWriteW,MemtoRegW,
output reg [31:0] ALUOutW,ReadDataW,
output reg [4:0] WriteRegW 
);
always @(posedge CLK or negedge rst) begin
    if (!rst) begin
RegWriteW<=0;
MemtoRegW<=0;
ALUOutW<=0;
ReadDataW<=0;
WriteRegW<=0;  
end
else
begin
RegWriteW<=RegWriteM;
MemtoRegW<=MemtoRegM;
ALUOutW<=ALUOutM;
ReadDataW<=RD;
WriteRegW<=WriteRegM;
end 
end
endmodule