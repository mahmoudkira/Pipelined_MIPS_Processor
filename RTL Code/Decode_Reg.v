module REG_D(
input [31:0] RD,PCPlus4F,
input CLK,EN,CLR,rst,
output reg [31:0] InstrD,PCPlus4D );

always @(posedge CLK or negedge rst) begin
  if (!rst) begin
        InstrD <= 32'd0;
        PCPlus4D <= 32'd0;
    end
 else if (CLR&&!EN) begin
InstrD<=32'b0;
PCPlus4D<=PCPlus4F;
end 
else if (!EN) begin 
InstrD<=RD;
PCPlus4D<=PCPlus4F;
end
end
endmodule