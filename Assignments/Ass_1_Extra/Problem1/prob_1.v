

module binary_number4bit(A,out);
    input [3:0] A;

    output out;

    //using logical and (&&) to get the output result, 
    //if the condition is true, the out is evaluted to one(high). 
    assign out = (A > 4'b0010) && (A < 4'b1000); 

endmodule