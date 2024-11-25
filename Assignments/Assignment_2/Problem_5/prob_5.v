

module N_bit_ALU(A,B,Opcode,Result);
    parameter N_ALU = 4;
    input [N_ALU -1:0]A,B;
    input [1:0]Opcode;
    wire [N_ALU - 1:0]sum;  //wire to hold the sum from the N_Bit_Adder
    output reg [N_ALU -1:0]Result;

    //Module Instantiation
    N_bit_adder #(.N(N_ALU)) adder(A,B,sum);

    always @(*)begin
        case(Opcode)
        2'b00: Result = sum; 
        2'b10: Result = A - B;
        2'b01: Result = A | B;
        2'b11: Result = A ^ B;
        endcase
    end


endmodule