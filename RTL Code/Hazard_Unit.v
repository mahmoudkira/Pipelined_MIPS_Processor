module Hazard_Unit (     
input [4:0] RsD, RtD, RsE, RtE,
input [4:0] WriteRegE, WriteRegW, WriteRegM,
input BranchD,
input MemtoRegE, RegWriteE,
input MemtoRegM, RegWriteM, RegWriteW,
input JumpD,
output reg StallF, StallD,
output reg FlushE,
output reg ForwardAD, ForwardBD,
output reg [1:0] ForwardAE, ForwardBE
);

reg lwstall,branchstall;

always @(*) begin
lwstall= ((RsD== RtE) || (RtD== RtE)) && MemtoRegE;
branchstall= (BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD))||(BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD));
StallF=lwstall||branchstall;
StallD=lwstall||branchstall;
FlushE=lwstall||branchstall||JumpD;
if ((RsE != 5'b0) && (RsE == WriteRegM) && RegWriteM)
ForwardAE <= 2'b10;
else if ((RsE != 5'b0) && (RsE == WriteRegW) && RegWriteW)
ForwardAE <= 2'b01;
else ForwardAE <= 2'b00;

if ((RtE != 5'b0) && (RtE == WriteRegM) && RegWriteM)
ForwardBE <= 2'b10;   
else if ((RtE != 5'b0) && (RtE == WriteRegW) && RegWriteW)
ForwardBE <= 2'b01;
else ForwardBE <= 2'b00;
if((RsD != 5'b0) && (RsD == WriteRegM) && RegWriteM)
ForwardAD <= 1'b1;
else 
ForwardAD <=1'b0;
if((RtD != 5'b0) && (RtD == WriteRegM) && RegWriteM)
ForwardBD <=1'b1;
else 
ForwardBD <=1'b0;
end

    
endmodule