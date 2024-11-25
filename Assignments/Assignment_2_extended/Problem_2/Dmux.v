

module Dmux(D,S,Y);
    input D;
    input [1:0] S;
    output reg [3:0] Y;

    always @(*)begin
        Y = 4'b0;
        case(S)
            2'b00: Y[0] = D;
            2'b01: Y[1] = D;
            2'b10: Y[2] = D;
            2'b11: Y[3] = D;
        endcase
    end

endmodule 