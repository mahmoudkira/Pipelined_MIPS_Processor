module MUX #(parameter width = 32)(in1,in2,sel,out);
input [width-1:0]in1,in2;
input sel;
output reg [width-1:0]out;
always @(*) begin
    if(sel)
    out=in2;
    else
    out=in1;
end
endmodule