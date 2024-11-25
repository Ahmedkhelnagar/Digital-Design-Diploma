

module BCD_tb();
    //signal declariation
    reg [9:0] D;
    wire [3:0] Y;           //will be get from the instaiation module
    reg [3:0] Y_expected;   //will be calculated from gold module

    //Module instantiations
    BCD DUT(D,Y);

    //test stimulus generator
    integer i;
    initial begin
        //Directed test
        D = 10'd8;
        Y_expected = 4'b0011;
        #10
        D = 10'd256;
        Y_expected = 4'b1000;
        #10
        D = 10'd512;
        Y_expected = 4'b1001;
        #10
        if(Y != Y_expected)begin
                $display("Error - Incorrect output gate !");
                $stop;
            end
        $display("DIRECTED TEST");
        
        //Randomized test
        for(i =0; i< 99 ;i = i+1)begin
            D = $random;
            
            if(D[0])
                Y_expected = 0;
            else if(D[1])  
                Y_expected = 4'b0001;
            else if(D[2])  
                Y_expected = 4'b0010;
            else if(D[3])  
                Y_expected = 4'b0011;
            else if(D[4])  
                Y_expected = 4'b0100;
            else if(D[5])  
                Y_expected = 4'b0101;
            else if(D[6])  
                Y_expected = 4'b0110;
            else if(D[7])  
                Y_expected = 4'b0111;
            else if(D[8])  
                Y_expected = 4'b1000;
            else if(D[9])  
                Y_expected = 4'b1001;  
            else 
                Y_expected = 0;
            #10
            $display("RANDOMIZED TEST");
            if(Y != Y_expected)begin
                $display("Error - Incorrect output gate !");
                $stop;
            end    
        end
        $stop;
    end

    initial begin
        $monitor("D = %b, Y = %b, Y_expected = %b",D,Y,Y_expected);
    end
endmodule