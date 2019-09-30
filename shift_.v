// file: shift.v
// author: @amrgouhar

`timescale 1ns/1ns

module shift_(shift,in, out, shamt);
input [1:0] shift;
input [31:0] in;
input [4:0] shamt;
output [31:0] out;
/*    always@* begin
        case(shift)
            2'b01:      out = in << shamt;  //shift left
            2'b10:      out = in >>> shamt; //shift right arith
            2'b11:      out = in >> shamt;  // shift right logic
            default:    out = in;
        endcase
    end*/
assign out = (shift == 2'b01)? (in << shamt):(shift == 2'b10)? (in >>>shamt):(in >> shamt);
endmodule