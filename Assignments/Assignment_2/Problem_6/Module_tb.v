

module Module_tb();
    //Signal declariation
    reg [3:0] A,B;
    reg [1:0] opcode;
    reg enable;
    wire [6:0] segment;
    reg [6:0] expected_segment;

    //Module instantiations
    big_Module DUT(.A(A),.B(B),.opcode(opcode),.enable(enable),.segment(segment));

    //Test stimulus generation
    initial begin
    //16 Directed Test
    A = 4'b0000;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1111110;#10;   //display 0
    check_result;
    A = 4'b0001;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b0110000;#10;   //display 1
    check_result;
    A = 4'b0010;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1101101;#10;   //display 2
    check_result;
    A = 4'b0011;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1111001;#10;   //display 3
    check_result;
    A = 4'b0100;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b0110011;#10;   //display 4
    check_result;
    A = 4'b0101;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1011011;#10;   //display 5
    check_result;
    A = 4'b0110;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1011111;#10;   //display 6
    check_result;
    A = 4'b0111;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1110000;#10;   //display 7
    check_result;
    A = 4'b1000;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1111111;#10;   //display 8
    check_result;
    A = 4'b1001;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1111011;#10;   //display 9
    check_result;
    A = 4'b1010;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1110111;#10;   //display a
    check_result;
    A = 4'b1011;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b0011111;#10;   //display b
    check_result;
    A = 4'b1100;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1001110;#10;   //display c
    check_result;
    A = 4'b1101;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b0111101;#10;   //display d
    check_result;
    A = 4'b1110;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1001111;#10;   //display e
    check_result;
    A = 4'b1111;B = 4'b0000;opcode = 2'b00;enable = 1;expected_segment = 7'b1000111;#10;   //display f
    check_result;


    //Direct test to make the enable = 0 
    A = 4'b0010;B = 4'b0000;opcode = 2'b00;enable = 0;expected_segment = 7'b1101101;#10;   //No display
    if(segment != expected_segment)begin
                $display("Enable = 0 !");
                $stop;
            end
    $stop;
    end

    initial begin
        $monitor("A = %b, B= %b ,opcode = %b, enable = %b, segment = %b, expected_segment = %b",A,B,opcode,enable,segment,expected_segment);
    end

    //task to check the result
    task check_result;
        begin
            if(segment != expected_segment)begin
                $display("Error - Incorrect output gate !");
                $stop;
            end
        end
    endtask


endmodule