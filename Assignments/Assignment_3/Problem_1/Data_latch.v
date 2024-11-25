

module Data_latch(D,G,clr,Q);
    input D,G,clr;
    output reg Q;

    always @(*) begin
      if(~clr)
         Q <= 0;
      else begin
        if(G)
            Q <= D;
      end  
    end
endmodule