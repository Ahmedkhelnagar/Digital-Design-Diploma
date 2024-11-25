

module N_Bit_Alu_tb();
    //Signal declariation
    parameter N_ALU_tb = 4;
    reg [N_ALU_tb - 1:0] A,B;
    reg [1:0] Opcode;
    wire [N_ALU_tb - 1:0] Result;           //from the instantiation
    reg [N_ALU_tb - 1:0] result_expected;   //will be calculated
    //Module Instantiations
    N_bit_ALU #(N_ALU_tb) DUT(A,B,Opcode,Result);

    //Test stimulus Generation
    integer i;
    initial begin
        //Directed Test

        //Addition
        A = 4'b0011;    //3
        B = 4'b0101;    //5
        Opcode = 2'b00;
        result_expected = A + B;
        #10
        check_result;

        //Subtraction
        A = 4'b0101;    //5
        B = 4'b0011;    //3
        Opcode = 2'b10;
        result_expected = A - B;
        #10
        check_result;

        //OR
        A = 4'b0011;    //3
        B = 4'b0101;    //5
        Opcode = 2'b01;
        result_expected = A | B;
        #10
        check_result;

        //XOR
        A = 4'b0011;    //3
        B = 4'b0101;    //5
        Opcode = 2'b11;
        result_expected = A ^ B;
        #10
        check_result;

        //Randomized Test
        for(i = 0; i <99; i = i+1)begin
            A = $random;
            B = $random;
            Opcode = $random;
            case(Opcode)
             2'b00: result_expected = A + B; 
             2'b10: result_expected = A - B;
             2'b01: result_expected = A | B;
             2'b11: result_expected = A ^ B;
             default: result_expected = 0;
            endcase
            #10;
            check_result;
        end
        $stop;
    end

    initial begin
        $monitor("A = %b, B = %b , Result = %b, Res_expected = %b",A,B,Result,result_expected);
    end


    //Task to check the result
    task check_result;
        begin
            if(Result != result_expected)begin
                $display("Error - Incorrect Output Gate !");
                $stop;
            end
        end
    endtask

endmodule