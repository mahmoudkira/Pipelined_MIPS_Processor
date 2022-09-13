module Program_Counter(PC1,PCF,CLK,EN,rst);
input [31:0] PC1;
input CLK,EN,rst;
output reg [31:0] PCF;
always @(posedge CLK or negedge rst) begin
if (!rst) begin
PCF<=0; 
end
else if (!EN)
PCF<=PC1;
end  
endmodule