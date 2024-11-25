

module gray_code_tb();
    //Signal Declaration
    reg [2:0] A;
    wire [6:0] B;

    //Module Instantiations -> USE_GRAY = 1
    Encoding_module #(1) DUT(A,B);

    //Test stimulus generation
    integer i ;
    initial begin
       A = 3'b000;
       for(i = 0;i < 8; i = i + 1)begin
            #10;
            A = i;
            #1;
            $display("A = %b, B = %b",A,B);
       end
       $stop;
    end

endmodule