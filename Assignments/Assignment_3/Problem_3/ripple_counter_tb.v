

module ripple_counter_tb();
    reg clk,rstn;
    wire [3:0]out;

    ripple_counter DUT(clk,rstn,out);

    initial begin
        clk = 0;
        forever
        #1 clk =~clk;
    end

    integer i;
    initial begin
        rstn = 0;
        @(negedge clk);
        rstn = 1;

        for(i=0;i<10;i= i+1)begin
            @(negedge clk);
        end
        $stop;
    end

    initial begin
        $monitor("rstn = %b, clk = %b, out = %b",rstn,clk,out);
    end
endmodule