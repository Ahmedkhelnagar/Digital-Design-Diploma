

module Param_FlipFlop_tb();
    //Signals Declariations
    parameter FF_TYPE = "DFF";
    reg d,rstn,clk;
    wire q;
    wire qbar;
    reg expected_q;

    //Module Instantiations
    Param_FlipFlop #(FF_TYPE) DUT(d,rstn,clk,q,qbar);

    //Clock generation
    initial begin
        clk = 0;
        forever
        #1 clk = ~clk;
    end
    //Test Stimulus Generations
    integer i;
    initial begin
        rstn = 0;
        d = 0;
        expected_q = 0;
        @(negedge clk);
        rstn = 1;
        
        for(i = 0 ; i<10 ; i = i+1)begin
            d = $random % 2;
            @(negedge clk);
            if(FF_TYPE == "DFF")begin
                expected_q = d;
                
                //@(posedge clk);
                if(q != expected_q)begin
                $display("Error !!");
                $stop;
                end
            end
            
            else if(FF_TYPE == "TFF")begin
                if(d)begin
                    expected_q = ~expected_q;
                    //@(posedge clk);
                    if(q != expected_q)begin
                    $display("Error !!");
                    $stop;
                    end
                end
            end
        end
        $stop;
    end

    initial begin
        $monitor("rstn = %b,d =%b, clk = %b, q = %b,qbar = %b",rstn,d,clk,q,qbar);
    end

endmodule