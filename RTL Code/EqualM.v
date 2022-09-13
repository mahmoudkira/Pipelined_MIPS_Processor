module Equal (
input [31:0] A,B,
output reg EqualD
);
always @(*) begin
if(A==B) EqualD<=1'b1;
else EqualD<=1'b0;
end
endmodule