
module DSP_tb();
    //Signals Declairation
    reg [17:0]A,B,D;
    reg [47:0]C;
    reg [17:0]BCIN;
    reg [7:0]OPMODE;
    reg RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP;
    reg [47:0]PCIN;
    reg CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP;
    reg CARRYIN,CLK;
    reg 
    wire [17:0]BCOUT;
    wire [47:0]PCOUT,P;
    wire [35:0]M;
    wire CARRYOUT,CARRYOUTF;

    //Clock genneration
    initial begin
      CLK = 0;
      forever 
        #1 CLK = ~CLK;
    end

    //Module instantiations
    DSP_module
    #(.A0REG(1),.B0REG(1),.A1REG(1), .B1REG(1), .CREG(1), .DREG(1), .MREG(1), .PREG(1), .CARRYINREG(0), .CARRYOUTREG(0), .OPMODEREG(0))
    DUT(.A(A),.B(B),.C(C),.D(D),.CARRYIN(CARRYIN),.M(M),.P(P),
        .CARRYOUT(CARRYOUT),.CARRYOUTF(CARRYOUTF),.CLK(CLK),
        .OPMODE(OPMODE),.CEA(CEA),.CEB(CEB),.CEC(CEC),
        .CECARRYIN(CECARRYIN),.CED(CED),.CEM(CEM),.CEOPMODE(CEOPMODE),
        .CEP(CEP),.RSTA(RSTA),.RSTB(RSTB),.RSTC(RSTC),.RSTCARRYIN(RSTCARRYIN),
        .RSTD(RSTD),.RSTM(RSTM),.RSTOPMODE(RSTOPMODE),.RSTP(RSTP),.BCOUT(BCOUT),
        .PCIN(PCIN),.PCOUT(PCOUT),.BCIN(BCIN));

    //Test stimulus generation
    initial begin
        //Enable reset
        RSTA =1;RSTB =1;RSTC =1;RSTCARRYIN= 1;RSTD =1;RSTM =1;RSTOPMODE =1;RSTP =1;
        CEA = 0;CEB = 0;CEC = 0;CECARRYIN = 0;CED = 0;CEM = 0;CEOPMODE = 0;CEP = 0;
        CARRYIN = 1'b0;
        OPMODE = 8'b0;   
        BCIN = 18'd0;
        PCIN = 48'd0;
        A = 18'd0; B = 18'd0; C = 48'd0; D = 18'd0;

        // @(posedge CLK);
        @(negedge CLK);

        //Disable reset and enable clk
        RSTA =0;RSTB =0;RSTC =0;RSTCARRYIN= 0;RSTD =0;RSTM =0;RSTOPMODE =0;RSTP =0;
        CEA = 1;CEB = 1;CEC = 1;CECARRYIN = 1;CED = 1;CEM = 1;CEOPMODE = 1;CEP = 1;
        
        /*********************************************
        *  
        *                  Test case 1
        *             
        ***********************************************/
        //P = 700 -> Binput = "Direct" , P = 1100 -> Binput = "Cascaded" 
        A = 18'd20; B = 18'd30; C = 48'd300; D = 18'd50;
        CARRYIN = 1'b0;
        OPMODE = 8'b01111101;   
        BCIN = 18'd10;
        PCIN = 48'd1000;
        
        
        repeat(2)@(negedge CLK);    //at least one clock to appear 700

        /*********************************************
        *  
        *                  Test case 2
        *             
        ***********************************************/
        // P = 1900 ->Binput = "Direct"
        CARRYIN = 1'b0;
        OPMODE = 8'b00011101;   //carryin = 0
        BCIN = 18'd10;
        PCIN = 48'd1000;
        
       
        repeat(3)@(negedge CLK);
        /*********************************************
        *  
        *                  Test case 3
        *             
        ***********************************************/
        // P = 2600 ->Binput = "Direct"
        CARRYIN = 1'b0;
        OPMODE = 8'b00110101;   //opmode [3:2] = 1 >> PCIN
        BCIN = 18'd10;
        PCIN = 48'd1000;

        repeat(3)@(negedge CLK);
        /*********************************************
        *  
        *                  Test case 4
        *             
        ***********************************************/
        // P = 1000 ->Binput = "Direct"
        CARRYIN = 1'b0;
        OPMODE = 8'b10010100;   //opmode [1:0] = 1 >> P = Z
        BCIN = 18'd10;
        PCIN = 48'd1000;

        repeat(3)@(negedge CLK);

        $stop;
    end

    initial begin
        // @(posedge CLK);
        $monitor("Opmode =%b,P = %0d,Pcout = %0d,Bcout = %0d,M = %0d",OPMODE,P,PCOUT,BCOUT,M);
    end
    


endmodule

