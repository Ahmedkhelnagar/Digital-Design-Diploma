

module Mux1(a, b, c, d, e, f, sel, out, out_bar);
    input a, b, c, d, e, f, sel;
    wire and_out, xnor_out;
    output out, out_bar;
    
    assign and_out = a & b & c; 
    assign xnor_out = ~(d ^ e ^ f);

    assign out = (sel==1) ? xnor_out :and_out;
    assign out_bar = ~out;

endmodule