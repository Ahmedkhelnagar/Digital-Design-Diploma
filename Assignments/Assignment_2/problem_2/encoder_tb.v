
//Self Check -> Value_expected
module encoder_tb();
    //signal declariation
    reg [3:0] x;
    wire [1:0] y;           //from the original module 
    reg [1:0] y_expected;   //will be calculated

    //DUT Instantiations
    four_bit_priority_encoder DUT(x,y);
    
    integer i;
    initial begin
    for(i = 0; i<99 ; i=i+1)begin
        x = $random;
        if(x[3])
            y_expected = 2'b11;
      else if(x[2])
            y_expected = 2'b10;
      else if(x[1])
            y_expected = 2'b01;
      else if (x[0])
            y_expected = 2'b00;
      else
            y_expected = 2'b00;
        #10;
        if(y != y_expected)begin
            $display("Error - Incorrect output gate !");
            $stop;
        end
    end
        $stop;
    end

    initial begin
        $monitor("X = %b, y = %b, y_expected = %b",x,y,y_expected);
    end
endmodule
