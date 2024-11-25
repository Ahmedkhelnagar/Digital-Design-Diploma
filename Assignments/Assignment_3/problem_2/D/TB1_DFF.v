

module D_FlipFlop_tb();
    reg d, rstn, clk;
    wire q, qbar;
    wire param_q, param_qbar;

    // Instantiate the DFF
    D_FlipFlop golden_model(d, rstn, clk, q, qbar);

    // Instantiate the parameterized flip-flop with FF_TYPE = "DFF"
    Param_FlipFlop #("DFF") DUT(d, rstn, clk, param_q, param_qbar);

    // Clock generation
    initial begin
        clk = 0;
        forever 
        #1 clk = ~clk;
    end

    // Test stimulus generation
    initial begin
        rstn = 0;
        d = 0;
        @(negedge clk);
        rstn = 1;

        repeat (10) begin
            @(negedge clk);
            d = $random % 2;
        end
        $stop;
    end

    // Monitor and compare outputs
    initial begin
        $monitor("rstn = %b,d =%b, clk = %b, q = %b,qbar = %b",rstn,d,clk,q,qbar);

        forever begin
            @(posedge clk);
            if (q !== param_q) begin
                $display("Error!");
                $stop;
            end
        end
    end
endmodule
