

module SLE_tb();
    //Signals Declairation
    reg D,clk,EN,Aln,ADn,SLn,SD,LAT,Q_int;
    wire Q;

    //Module Instantiations
    SLE DUT(D,clk,EN,Aln,ADn,SLn,SD,LAT,Q);

    //Clock Generation
    initial begin
        clk = 0;
        forever
           #1 clk = ~clk; 
    end
    
    integer i;
    
    //Test Stimulus Generation
    initial begin
        Aln = 0;
        ADn = 1;    //Static
        SD = 1;     //Static
        @(negedge clk);
        Aln = 1;

        LAT = 0;    //Latch Disable
        for(i = 0;i<10;i= i+1)begin
           EN = $random;
           /* Sln = 0 -> Q = SD
              Sln = 1 -> Q = D  */
           SLn = $random;    
           D = $random;
           @(negedge clk);
        end
        $stop;
    end

    initial begin
        $monitor("Aln = %b,ADn = %b,LAT = %b,clk = %b,EN = %b,SLn = %b,SD = %b,D = %b,Q = %b",
        Aln,ADn,LAT,clk,EN,SLn,SD,D,Q);
    end
endmodule