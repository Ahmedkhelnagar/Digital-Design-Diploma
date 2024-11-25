


module ALU_1bit(a,b,Ainvert,Binvert,carryIn,operation,carryOut,Result);
    
    input a,b,Ainvert,Binvert,carryIn;
    input [1:0] operation;

    wire a_mux, b_mux;
    wire and_out, or_out, sum_out;

    output carryOut,Result;
    
    //Multiplexer for select the input a and b based on the Ainverter and Binverter.
    assign a_mux = (Ainvert==1) ? (~a) : (a);
    assign b_mux = (Binvert==1) ? (~b) : (b);

    //And Operation
    assign and_out = a_mux & b_mux;
    //OR Operation
    assign or_out  = a_mux | b_mux;
    //Addition Operation
    assign {carryOut, sum_out} = (a_mux + b_mux + carryIn);

    //Multiplexing for select the result based on the operation input.
    assign Result = (operation == 2'b00) ? and_out :
                    (operation == 2'b01) ? or_out :
                    (operation == 2'b10) ? sum_out : 
                    1'b0;   //Default case , result = 0

endmodule