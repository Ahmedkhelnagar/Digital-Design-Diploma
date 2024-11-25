

module ALSU_tb();
    /*Signal Declairation*/

    //Parametets
    parameter INPUT_PRIORITY = "A";
    parameter FULL_ADDER = "ON";
    //Inputs
    reg [2:0]A,B,opcode;
    reg cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B,clk,rst;
    //Outputs
    wire [15:0]leds;
    wire [5:0]out;
    //for self-checking
    reg [15:0] expected_leds;
    reg [5:0] expected_out;
    //Var to check the vslue of rotate
    reg check_rotate;

    //Module Instantiation
    ALSU #(INPUT_PRIORITY,FULL_ADDER)
         DUT   
         (A,B,opcode,cin,serial_in,direction,
          red_op_A,red_op_B,bypass_A,bypass_B,
          clk,rst,out,leds);
    
    //Clock Generation
    initial begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end

    //Test stimulus generation
    initial begin
        //Initailize inputs
        A = 3'b0;
        B = 3'b0;
        opcode = 3'b0;
        cin = 0;
        serial_in = 0;
        direction = 0;
        red_op_A = 0;
        red_op_B = 0;
        bypass_A = 0;
        bypass_B = 0;
        clk = 0;
        rst = 1;

        @(negedge clk);
        rst = 0;

        //Generate Randmoized test
        repeat(5) begin
            @(negedge clk);
            A = $random;
            B = $random;
            opcode = $urandom_range(0,5);
            cin = $random;
            serial_in = $random;
            direction = $random;
            red_op_A = $random;
            red_op_B = $random;
            bypass_A = $random;
            bypass_B = $random;
            calculate_expected_outputs;
            repeat(2) @(negedge clk);
            check_outputs;
        end
     
        /*************Directed tests**********************/
        A = 3'b101;B = 3'b110;

        //(XOR) -> out = 000011 
        opcode = 1;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;

        //(Addition) -> out = 001100 
        cin = 1; opcode = 2;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;

        //(Bypass A) -> out = A -> 101 
        bypass_A = 1; opcode = 2;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;

        /***************Test Invalid opcodes********************/
        @(negedge clk);
        bypass_A = 0;bypass_B = 0;
        opcode = 6; A = 3'b101;B = 3'b110;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;

        opcode = 7;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;
        
        //(Addition) -> out = 0 (Invalid case)
        opcode = 2;red_op_A = 1;red_op_B = 1;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;
       
        /*********************************************************/

        /***********Test Input Prority*************************/
        //out = A -> INPUT PRIORITY = "A"
        @(negedge clk);
        bypass_A = 1; bypass_B = 1;
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;
        
        /*************Bypass B********************/
        //out = B -> 110
        @(negedge clk);
        bypass_A = 0;
        bypass_B = 1; opcode = 7;
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;
        
        /*************reduction operator of A ***************/
        @(negedge clk);
        bypass_B = 0;
        opcode = 0;red_op_A = 1; 
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;


        /*************Test shift output by 1 ***************/

        //(Addition) -> out = 001100 
        red_op_A = 0;red_op_B = 0;bypass_B = 0;
        cin = 1; opcode = 2;
        @(negedge clk);
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;

        //shift left -> out  = 0 1100 1 ->(serial in =1)
        @(negedge clk);
        cin = 0;
        opcode = 4;
        calculate_expected_outputs;
        repeat(2) @(negedge clk);
        check_outputs;

        /*********************Test rotate the output by 1 *************************/
        //out -> 101100
        @(negedge clk);
        opcode = 5;serial_in = 1;
        // calculate_expected_outputs;
        @(negedge clk);
        check_rotate = out[5];
        @(negedge clk);
        if(out[0] != check_rotate)
            $display("Error rotate!!");
        $stop;
    end

    /*****************task to calculate the expected outputs**********/
    task calculate_expected_outputs;
    begin
        
        if (bypass_A && bypass_B) 
            expected_out = (INPUT_PRIORITY == "A") ? A : B;
        else if (bypass_A) 
            expected_out = A;
        else if (bypass_B) 
            expected_out = B;
        else begin
            case (opcode)
                3'b000: begin // AND
                    if (red_op_A && red_op_B) begin
                        expected_out = (INPUT_PRIORITY == "A") ? &A : &B;
                    end else if (red_op_A) begin
                        expected_out = &A;
                    end else if (red_op_B) begin
                        expected_out = &B;
                    end else begin
                        expected_out = A & B;
                    end
                end
                3'b001: begin // XOR
                    if (red_op_A && red_op_B) begin
                        expected_out = (INPUT_PRIORITY == "A") ? ^A : ^B;
                    end else if (red_op_A) begin
                        expected_out = ^A;
                    end else if (red_op_B) begin
                        expected_out = ^B;
                    end else begin
                        expected_out = A ^ B;
                    end
                end
                3'b010: begin // Addition
                    if (FULL_ADDER == "ON") begin
                        expected_out = A + B + cin;
                    end else begin
                        expected_out = A + B;
                    end
                end
                3'b011: begin // Multiplication
                    expected_out = A * B;
                end
                3'b100: begin // Shift output by 1
                    expected_out = direction ? {expected_out[4:0], serial_in} : {serial_in, expected_out[5:1]};
                end
                3'b101: begin // Rotate output by 1
                    expected_out = direction ? {expected_out[4:0], expected_out[5]} : {expected_out[0], expected_out[5:1]};
                end
                default: begin // Invalid opcode
                    expected_leds = ~expected_leds;
                    expected_out = 6'b0;
                end
            endcase

            if ((red_op_A || red_op_B) && (opcode != 3'b000) && (opcode != 3'b001)) begin
                expected_leds = ~expected_leds;
                expected_out = 6'b0;
            end
        end
    end
    endtask

    //Task to check the outputs
    task check_outputs;
    begin
        if (out != expected_out) begin
            $display("Error out !!");
            $display("clk = %b, rst = %b, A = %b, B = %b, opcode = %b, cin = %b, serial_in = %b, direction = %b, red_op_A = %b, red_op_B = %b, bypass_A = %b, bypass_B = %b, out = %b,expected_out = %b,leds = %b,expected_leds = %b",
                clk, rst, A, B, opcode, cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B, out,expected_out,leds,expected_leds);
            $stop;
        end
        if (leds != expected_leds) begin
            $display("Error leds !!");
            $display("clk = %b, rst = %b, A = %b, B = %b, opcode = %b, cin = %b, serial_in = %b, direction = %b, red_op_A = %b, red_op_B = %b, bypass_A = %b, bypass_B = %b, out = %b,expected_out = %b,leds = %b,expected_leds = %b",
                clk, rst, A, B, opcode, cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B, out,expected_out,leds,expected_leds);
            $stop;
        end
    end
    endtask

    initial begin
        $monitor("clk = %b, rst = %b, A = %b, B = %b, opcode = %b, cin = %b, serial_in = %b, direction = %b, red_op_A = %b, red_op_B = %b, bypass_A = %b, bypass_B = %b, out = %b, leds = %b",
                clk, rst, A, B, opcode, cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B, out, leds);
    end
    
endmodule
