

module four_bit_priority_encoder(x,y);
    input [3:0] x;
    output reg [1:0] y;

    always @(*)begin
      if(x[3])
            y = 2'b11;
      else if(x[2])
            y = 2'b10;
      else if(x[1])
            y = 2'b01;
      else if (x[0])
            y = 2'b00;
      else
            y = 2'b00; 
    end

endmodule