module Data_Memory (A,WD,WE,RD,clk,rst,tst);
input [31:0] A, WD;
input WE,clk,rst;
output reg[31:0] RD;
output reg[15:0] tst;  
reg [31:0] Dmem [99:0] ;
integer i;
always @(*)begin
 RD = Dmem[A];
end
always @(*) begin
 tst = Dmem[0];  
end
always @(posedge clk or negedge rst ) begin
    if(rst==0) for(i = 0; i < 100; i = i + 1) 
    Dmem [i] <= 32'd0;
    else if (WE==1) begin
        Dmem[A]<=WD;
    end
end    
endmodule