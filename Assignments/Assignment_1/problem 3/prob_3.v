

module decoder_2to4(A,D);
    input [1:0] A;
    output [3:0] D;

    assign D[0] = (A == 2'b00) ? 1'b1 : 1'b0;
    assign D[1] = (A == 2'b01) ? 1'b1 : 1'b0;
    assign D[2] = (A == 2'b10) ? 1'b1 : 1'b0;
    assign D[3] = (A == 2'b11) ? 1'b1 : 1'b0;

endmodule