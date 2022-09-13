module shiftlefttwice#(parameter width = 32) (in,out);
input [width-1:0]in;
output reg [width-1:0]out;
always @(*) begin
    out=in<<2;
    
end
endmodule