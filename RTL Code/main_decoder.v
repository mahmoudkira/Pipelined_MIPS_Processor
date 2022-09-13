module main_decoder (opcode,alu_op,jump,memwrite,regwrite,regdest,alusrc,memtoreg,branch);
input[5:0] opcode;
output reg[1:0]alu_op;
output reg jump,memwrite,regwrite,regdest,alusrc,memtoreg,branch;
always @(*) begin
    case (opcode)
        6'b100011:begin
            alu_op = 2'b00;
            jump = 1'b0;
            memwrite = 1'b0;
            regwrite = 1'b1;
            regdest = 1'b0;
            alusrc = 1'b1;
            memtoreg = 1'b1;
            branch = 1'b0;  
        end 
         6'b101011:begin
            alu_op = 2'b00;
            jump = 1'b0;
            memwrite = 1'b1;
            regwrite = 1'b0;
            regdest = 1'b0;
            alusrc = 1'b1;
            memtoreg = 1'b1;
            branch = 1'b0;  
        end
            6'b000000:begin
            alu_op = 2'b10;
            jump = 1'b0;
            memwrite = 1'b0;
            regwrite = 1'b1;
            regdest = 1'b1;
            alusrc = 1'b0;
            memtoreg = 1'b0;
            branch = 1'b0;  
        end
             6'b001000:begin
            alu_op = 2'b00;
            jump = 1'b0;
            memwrite = 1'b0;
            regwrite = 1'b1;
            regdest = 1'b0;
            alusrc = 1'b1;
            memtoreg = 1'b0;
            branch = 1'b0;  
        end
            6'b000100:begin
            alu_op = 2'b01;
            jump = 1'b0;
            memwrite = 1'b0;
            regwrite = 1'b0;
            regdest = 1'b0;
            alusrc = 1'b0;
            memtoreg = 1'b0;
            branch = 1'b1;  
        end
             6'b000010:begin
            alu_op = 2'b00;
            jump = 1'b1;
            memwrite = 1'b0;
            regwrite = 1'b0;
            regdest = 1'b0;
            alusrc = 1'b0;
            memtoreg = 1'b0;
            branch = 1'b0;  
        end
        default:begin
            alu_op = 2'b00;
            jump = 1'b0;
            memwrite = 1'b0;
            regwrite = 1'b0;
            regdest = 1'b0;
            alusrc = 1'b0;
            memtoreg = 1'b0;
            branch = 1'b0;  
        end
    endcase
end
    endmodule