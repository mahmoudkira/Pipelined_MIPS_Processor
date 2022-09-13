module Instruction_Memory (PC,RD);
input [31:0] PC ;
output[31:0] RD ;
reg [31:0] Imem [99:0];

initial 
    begin
        $readmemh ("Program 3_Machine Code.txt", Imem);
    end
assign RD = Imem[PC>>2];
endmodule