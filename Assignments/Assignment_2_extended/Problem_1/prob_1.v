
//Gray code and one hot encoding
module Encoding_module(A,B);
    parameter USE_GRAY = 1;
    input [2:0] A;
    output reg [6:0] B;

    generate
     if (USE_GRAY == 1) begin
        //Always block(Gray code)
       always @(*)begin
        B[6:3] = 4'b0; //unused for Gray code
        B[2] = A[2];
        B[1] = A[2] ^ A[1];
        B[0] = A[1] ^ A[0];
       end 
    end
    else begin
        //one hot encoding
        always @(*)begin
            B = 7'b0;
            B[A-1] = 1'b1;
        end
    end
        
    endgenerate

endmodule
