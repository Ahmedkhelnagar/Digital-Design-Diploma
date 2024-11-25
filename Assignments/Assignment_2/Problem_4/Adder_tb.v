

module N_bit_Adder_tb();
    //Signal declariation
    parameter N = 1; 
    reg [N-1:0]A,B;
    wire [N-1:0]C;
    reg [N-1:0]C_expected;

    //Module Instantiation
    N_bit_adder DUT(A,B,C);

    //Test Stimulus Generation
    integer i;
    initial begin
        for(i=0;i<99;i=i+1)begin
            A = $random; 
            B = $random;
            C_expected = A + B;
            #10; 
            if(C != C_expected)begin
                $display("Error - Incorrect output gate !");
                $stop;
            end
        end
        $stop;
    end

    initial begin
        $monitor("A = %b, B = %b, C = %b, C_expected = %b",A,B,C,C_expected);
    end
endmodule