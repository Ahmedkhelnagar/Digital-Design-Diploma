

module output_F(a,b,c,f);
    input a,b,c;
    wire xor_out;
    wire xnor_out;
    output f;

    assign xor_out = a ^ b;
    assign xnor_out = ~(b ^ c);

    assign f = (xor_out & xnor_out & c);
    
endmodule