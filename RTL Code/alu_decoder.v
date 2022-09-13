module alu_decoder (alu_op,funct,alu_control);
input[1:0]alu_op;
input[5:0] funct;
output reg [2:0] alu_control;
always @(*) begin
    case (alu_op)
        2'b00: alu_control = 3'b010;
        2'b01: alu_control = 3'b100;
        2'b10: begin 
        if (funct==6'b100000)
           alu_control = 3'b010;
        else if (funct==6'b100010) begin
           alu_control = 3'b100;
        end 
        else if (funct==6'b101010) begin
           alu_control = 3'b110;
        end 
        else if (funct==6'b011100) begin
           alu_control = 3'b101;
        end 
        else
        $display("Not Used");
        end 
        default:  alu_control = 3'b010;
    endcase
end
    endmodule