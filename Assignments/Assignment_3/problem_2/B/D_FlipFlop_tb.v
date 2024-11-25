


module D_FlipFlop_tb();
    //signals declairation
    reg d,rstn,clk;
    wire q,qbar;

    //Module Instantiations
    D_FlipFlop DUT(d,rstn,clk,q,qbar);

    //clock generation
    initial begin
        clk = 0;
        forever 
          #1 clk = ~clk;
    end
    //Test stimulus generations
    integer i;
    initial begin
        rstn = 0;
        d = 0;
        @(negedge clk);
        rstn = 1;
        for(i = 0;i<10;i = i+1)begin
            d = $random;
            @(negedge clk);
        end
        $stop;
    end

    initial begin
        $monitor("rstn = %b,d =%b, clk = %b, q = %b,qbar = %b",rstn,d,clk,q,qbar);
    end

endmodule