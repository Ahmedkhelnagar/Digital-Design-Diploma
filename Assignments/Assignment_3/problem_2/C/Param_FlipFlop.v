

module Param_FlipFlop(d,rstn,clk,q,qbar);
    parameter FF_TYPE = "DFF";
    input d,rstn,clk;
    output reg q;
    output qbar;

    assign qbar = ~q;

    always @(posedge clk or negedge rstn) begin
        if(~rstn)
            q <= 0;
        else if(FF_TYPE == "DFF")
            q <= d;
        else if(FF_TYPE == "TFF")
            if(d)
                q <= ~q;    
    end
endmodule   