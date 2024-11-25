

module Data_latch_tb();
    //Signals Declariations
    reg D,G,clr;
    wire Q;
    integer i ;
    //Module Instantiations
    Data_latch DUT(D,G,clr,Q);

    //clock generations
    initial begin
       G = 0;
       forever
       #1 G = ~G; 
    end

    initial begin
        clr = 0;
        D = 0;
        @(negedge G);
        clr = 1;
        for(i = 0;i< 10;i = i+1)begin
            D = $random;
            @(negedge G);
            if(!clr)begin
                if(Q != 0)begin
                    $display("Error - Incorrect Output gate !");
                    $stop;
                end
                else if(G)begin
                    if(Q != D)
                    $display("Error - Incorrect Output gate !");
                    $stop;
                end
            end
        end
        $stop;
    end

    initial begin
        $monitor("Clr = %b,G = %b, D= %b, Q = %b",clr,G,D,Q);
    end
endmodule