

module T_FlipFlop(t,rstn,clk,q,qbar);
    input t,rstn,clk;
    output reg q;
    output qbar;

    assign qbar = ~q;

    always @(posedge clk or negedge rstn)begin
      if(~rstn)
        q <= 1'b0;
      else if(t)
        q <=  ~q;
    end
endmodule