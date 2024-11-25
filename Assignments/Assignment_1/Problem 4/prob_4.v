

module even_parity_generation(A, out_with_parity);
    
    input [7:0] A;
    wire parity_bit;
    output [8:0] out_with_parity;

    //reduction operator(XOR)
    assign parity_bit = ^A;

    //using concatenation to get the output from the inut and parity bit
    assign out_with_parity = {A, parity_bit};


endmodule