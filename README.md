The ALU simulates the work of the following f statement in an efficient way explained in the comments of the code.

//if(oper == 4'bxxx1) and, else if(oper == 4'bxx10) or, else xor;
   //execution
  /*  always @* begin
        (* full_case *)
        (* parallel_case *)
        case(oper)
            4'b0000:    out = add_sub;  //add, note that in this case oper = {funct3,1'b0};
            4'b0001:    out = add_sub;  //sub, note that in this case oper = {funct3,1'b1};
            4'b0010:    out = out;      //preserve output operation;
            4'b0011:    out = comp;     //slt, note that in this case oper = {funct3[0], 3'b011};
            4'b0100:    out = A;       //Do nothing operation, to not considered 
            4'b0101:    out = shifted;  //sll, note that in this case oper = {funct3[1:0],funct3[2],!funct7[5]};
            4'b0110:    out = shifted;  //sra, note that in this case oper = {funct3[1:0],funct3[2],!funct7[5]};
            4'b0111:    out = shifted;  //srl, note that in this case oper = {funct3[1:0],funct3[2],!funct7[5]};
            4'b1111:    out = logict;    //and, note that in this case oper = {1'b1, funct3};
            4'b1110:    out = logict;    //or, note that in this case oper = {1'b1, funct3};
            4'b1100:    out = logict;    //xor, note that in this case oper = {1'b1, funct3};
            4'b1011:    out = comp;     //sltu, note that in this case oper = {funct3[0], 3'b011};
            default:    out = add_sub;
        endcase
    end*/

