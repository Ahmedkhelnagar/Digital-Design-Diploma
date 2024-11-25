

module Dmux_tb();
    //Signal Declariation
    reg D;
    reg [1:0] S;
    wire [3:0] Y;
    reg [3:0] expected_Y;

    //Module Instantiations
    Dmux DUT(D,S,Y);

    integer i;
    //Test stimulus generation
    initial begin
        for(i = 0; i<99; i = i+1)begin
            D = $random;
            S = $random;

            expected_Y = 4'b0;
            case(S)
                2'b00: expected_Y[0] = D;
                2'b01: expected_Y[1] = D;
                2'b10: expected_Y[2] = D;
                2'b11: expected_Y[3] = D;
            endcase
            #10;
            
            if(Y != expected_Y)begin
                $display("Error - Incorrect output gate !");
                $stop;
            end
        end
        $stop;
    end

    initial begin
        $monitor("D = %b,S = %b, Y = %b,Expected_Y = %b",D,S,Y,expected_Y);
    end


endmodule