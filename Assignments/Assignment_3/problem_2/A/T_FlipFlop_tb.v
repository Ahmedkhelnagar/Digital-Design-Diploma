

module T_FlipFlop_tb();
    //signals declairation
    reg t,rstn,clk;
    wire q,qbar;

    //Module Instantiations
    T_FlipFlop DUT(t,rstn,clk,q,qbar);

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
        t = 0;
        @(negedge clk);
        rstn = 1;
        for(i = 0;i<10;i = i+1)begin
            t = $random;
            @(negedge clk);
        end
        $stop;
    end

    initial begin
        $monitor("rstn = %b,t =%b, clk = %b, q = %b,qbar = %b",rstn,t,clk,q,qbar);
    end

endmodule