


module DSP_tb();
    //Signals Declairation
    reg [17:0]A,B,D;
    reg [47:0]C;
    reg clk ,rst_n;
    wire [47:0] P;
    // parameter OPERATION_ADD = 0;
    // parameter OPERATION_SUBSTRACT = 1;
    
    //Module Instantiations
    DSP DUT(A,B,C,D,clk,rst_n,P);

    //clock generation
    initial begin
        clk = 0;
        forever 
            #1 clk = ~clk;
    end

    initial begin
        rst_n = 0;  //enable the reset 
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        @(negedge clk);
        rst_n = 1;  //Disable the reset

         // Test case 1: ADD operation (default)
        A = 5;
        B = 6;
        C = 1;
        D = 0;
        repeat(8) @(negedge clk);
        $display("Test case 1: P = %d", P);

        // Test case 2: ADD operation (default)
        A = 5;
        B = 6;
        C = 1;
        D = 3;
        repeat(8) @(negedge clk);
        $display("Test case 2: P = %d", P);
        
        $stop;
    end


endmodule