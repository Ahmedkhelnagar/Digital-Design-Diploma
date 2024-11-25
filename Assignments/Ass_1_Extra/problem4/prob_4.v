

module prime_out(a, out);
    input [2:0] a;
    output reg out;
    
    //using always
    always @(*)begin
      case (a)
        3'b000: out = 1'b0; //0
        3'b001: out = 1'b0; //1
        3'b010: out = 1'b1; //2
        3'b011: out = 1'b1; //3
        3'b100: out = 1'b0; //4
        3'b101: out = 1'b1; //5
        3'b110: out = 1'b0; //6
        3'b111: out = 1'b1; //7
        default : out = 1'b0;
      endcase
    end
    /*or using assign statements
      assign out = (a == 3'b010)  ||
                    (a == 3'b011) ||
                    (a == 3'b101) ||
                    (a == 3'b111) 
    */

endmodule