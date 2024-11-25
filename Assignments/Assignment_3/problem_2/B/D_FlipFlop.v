

module D_FlipFlop(d,rstn,clk,q,qbar);
    input d,rstn,clk;
    output reg q;
    output qbar;

    assign qbar = ~q;
    always @(posedge clk or negedge rstn) begin
        if(~rstn)
        q <= 0;
      else
        q <= d;
    end

endmodule