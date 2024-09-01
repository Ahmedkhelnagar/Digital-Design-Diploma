module Wrapper_tb();
    //signal declairation
    reg MOSI,SS_n,clk,rst_n;
    wire MISO;
    integer i;
    //Module instantiations
    Wrapper_module DUT(MOSI,MISO,SS_n,clk,rst_n);

    //clock generation
    initial begin
        clk = 0;
        repeat (150)
            #1 clk = ~clk;
    end

    //test stimulus generation 
    initial begin
        rst_n = 0;  //enable reset
        SS_n = 0;   //start communication
        @(negedge clk);
        rst_n = 1;         
        
        MOSI = 0;
        SS_n = 0;   //start communication (CHK state 1 clk)
        @(negedge clk);
        /**********Write address : 00 then 11001100 *******/
        /*write address state takes (10 clk)*/
        //din[9:8] = 00
        MOSI = 0;   
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        //Address
        MOSI = 1;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        SS_n = 1;   //end communication (IDEL state)
        @(negedge clk); 
        $stop;

        SS_n = 0;   //start communication  (CHK state 1 clk)
        MOSI = 0;   
        @(negedge clk);
        /**********Write Data : 01 then 11001100*********/
        /*write data state  (10 clk)*/
        //din[9:8] = 01
        MOSI = 0;  
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        //data
        MOSI = 1;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        SS_n = 1;   //end communication
        @(negedge clk);
        $stop;

        
        SS_n = 0;   //start communication     (CHK state 1 clk)
        MOSI = 1;  
        @(negedge clk);
        /**********************Read Address : 10 then 11001100 *******************/
        /*read addr state (same location @ which we have write 10 clk )*/
        //din[9:8] = 10
        MOSI = 1;   
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        //Address
        MOSI = 1;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        MOSI = 0;
        @(negedge clk);
        SS_n = 1;   //end communication (IDEL state)
        @(negedge clk);
        $stop;

        
        SS_n = 0;   //start communication (CHK state 1 clk)
        MOSI = 1;  
        @(negedge clk);
        /**********************Read Data : 11 then 11001100 *******************/
        /*read data state (same data which we have write 10 clk write + 10 clk read)*/
        /**20 clk cycles**/
        //din[9:8] = 11 -> 2 clock cycles
        MOSI = 1;  
        @(negedge clk);
        MOSI = 1;
        @(negedge clk);
        //data -> 18 clock cycles
        MOSI = 1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        
        SS_n = 1;         //end communication
        @(negedge clk);
    end
endmodule