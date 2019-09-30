// file: ALU.v
// author: @amrgouhar

`timescale 1ns/1ns

module ALU(oper, A, B, out, sf, vf, cf, zf);
input [3:0] oper;
input [31:0]A, B;
output [31:0] out;
output sf,vf,cf,zf;

assign sf = add_sub[31];
assign zf = (out == 32'd0);
assign vf = (A[31] ^ (B[31]^oper[0]) ^ add_sub[31] ^ cf);

//add/sub
wire[31:0] add_sub;
assign {cf, add_sub} = A + (B ^ {32{oper[0]}}) + {31'b0,oper[0]}; // sub operation is num 1, so oper[0] = 1 when sub, while 0 when add;

//shift operations
wire [31:0] shifted;
wire [4:0] shamt;
assign shamt = (B[31:5] == 27'b0)? B[4:0]: 5'd31;
shift_ bit0(oper[1:0], A, shifted, shamt);    // operation shift left has a code 0101 and {01} means shift left
//while sra has a code of 0110 and {10} means sra, and srl has a code of 0111 and {11} means srl
   
//comparison operations
wire [31:0]comp;
//remember, when oper[0], subtraction is performed on a-b, while when !oper[0] addition is done;
//and the oper code for slt is the same as sltu except oper[3], 1 if slt, 0 if sltu;
assign comp = (oper[3])? {31'b0,(sf != vf)}:
                {31'b0,(~cf)};
/*
    if(A < B)
        then A - B is less than 0, so sf is 1 when no overflow occurs;
        
    if(unsigned(A <B))
        then A-B is less than 0, then the carryout bit, the new sign bit is 1
*/

//logic opertions;
wire [31:0] logict;
assign logict = oper[0]? ({A} & {B}): (oper[1]? ({A} | {B}): ({A} ^ {B}));
    
assign out = (oper == 4'b0000||oper == 4'b0001)? add_sub:(oper == 4'b0011||oper == 4'b1011)? comp:(oper == 4'b0101||oper == 4'b0110||oper==4'b0111)? shifted:logict;

endmodule
