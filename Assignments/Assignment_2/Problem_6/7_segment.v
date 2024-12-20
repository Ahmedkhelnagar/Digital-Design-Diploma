
//Cathode 7-Segment
module Seven_Segment_encoder(out_Alu,out_segment);
    input [3:0]out_Alu;
    output reg [6:0]out_segment;

    always @(*) begin        
    case(out_Alu)
        4'b0000: out_segment = 7'b1111110; //0
        4'b0001: out_segment = 7'b0110000; //1
        4'b0010: out_segment = 7'b1101101; //2
        4'b0011: out_segment = 7'b1111001; //3
        4'b0100: out_segment = 7'b0110011; //4
        4'b0101: out_segment = 7'b1011011; //5
        4'b0110: out_segment = 7'b1011111; //6
        4'b0111: out_segment = 7'b1110000; //7
        4'b1000: out_segment = 7'b1111111; //8
        4'b1001: out_segment = 7'b1111011; //9
        4'b1010: out_segment = 7'b1110111; //A
        4'b1011: out_segment = 7'b0011111; //B
        4'b1100: out_segment = 7'b1001110; //C
        4'b1101: out_segment = 7'b0111101; //D
        4'b1110: out_segment = 7'b1001111; //E
        4'b1111: out_segment = 7'b1000111; //F
        default : out_segment = 7'b0000000;            
    endcase
    end
endmodule