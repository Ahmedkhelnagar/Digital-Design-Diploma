

module MUX1(A,B,C,D,Sel,out,out_bar);
    input A,B,C,Sel;
    input [2:0]D;
    wire AND2_out,OR1_out,XNOR1_out;
    output out,out_bar; 
    //out AND gate
    assign AND2_out = D[0] & D[1];
    //out OR gate
    assign OR1_out = AND2_out | D[2];
    //out XNOR gate
    assign XNOR1_out = ~(A ^ B ^ C);
    //mux output based on the value of the selector
    assign out = (Sel) ? XNOR1_out : OR1_out;
    //out of out_bar
    assign out_bar = ~out;
endmodule
