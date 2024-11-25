
//Binary Coded Decimal
module BCD(D,Y);
    input [9:0] D;
    output reg [3:0] Y;

    always @(*)begin
      if(D[0])
        Y = 0;
      else if(D[1])  
        Y = 4'b0001;
      else if(D[2])  
        Y = 4'b0010;
      else if(D[3])  
        Y = 4'b0011;
      else if(D[4])  
        Y = 4'b0100;
      else if(D[5])  
        Y = 4'b0101;
      else if(D[6])  
        Y = 4'b0110;
      else if(D[7])  
        Y = 4'b0111;
      else if(D[8])  
        Y = 4'b1000;
      else if(D[9])  
        Y = 4'b1001;  
      else 
        Y = 0;                
    end
endmodule