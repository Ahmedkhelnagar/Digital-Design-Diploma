

module big_Module(A,B,opcode,enable,segment);
    input [3:0] A,B;
    input [1:0] opcode;
    input enable;
    output [6:0] segment;
    wire [3:0]result_Alu;
    wire [6:0]segment_decoded;

    //Module Instantiations
    N_bit_ALU #(4) ALU(.A(A),.B(B),.Opcode(opcode),.Result(result_Alu));
    Seven_Segment_encoder Decoder(.out_Alu(result_Alu),.out_segment(segment_decoded));

    //Enable control for 7-segment display
    assign segment = (enable) ? segment_decoded : 7'b0000000;
endmodule