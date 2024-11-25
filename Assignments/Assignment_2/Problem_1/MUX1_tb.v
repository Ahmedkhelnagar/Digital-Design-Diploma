

module MUX1_tb();
    reg A,B,C,Sel;
    reg [2:0]D;
    reg AND2_out_reg, OR1_out_reg, XNOR1_out_reg, out_EXPECTED_reg, out_bar_EXPECTED_reg;
   
    //Module Instantiation
    MUX1 DUT(A,B,C,D,Sel,out_DUT,out_bar_DUT);

    integer i;

    initial begin
        for(i=0 ; i<99 ; i=i+1)begin
            A = $random;
            B = $random;
            C = $random;
            D = $random;
            Sel = $random;
            #10;
             
            //out AND gate
             AND2_out_reg = D[0] & D[1];
            //out OR gate
             OR1_out_reg = AND2_out_reg | D[2];
            //out XNOR gate
             XNOR1_out_reg = ~(A ^ B ^ C);


            
            if (Sel)
                out_EXPECTED_reg = XNOR1_out_reg;
            else 
                out_EXPECTED_reg = OR1_out_reg;
            
            out_bar_EXPECTED_reg = ~out_EXPECTED_reg;
            
        end
        $stop;  
    end
    //Test monitor
    initial begin
        $monitor("A = %b,B = %b, C = %b,D = %b,Sel = %b,out_DUT = %b,out_EXPECTED = %b,out_bar_DUT = %b,out_bar_EXPECTED= %b",
        A,B,C,D,Sel,out_DUT,out_EXPECTED,out_bar_DUT,out_bar_EXPECTED);
    end

endmodule