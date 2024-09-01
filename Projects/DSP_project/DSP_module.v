

module DSP_module(A,B,C,D,CARRYIN,M,P,CARRYOUT,CARRYOUTF,CLK,OPMODE,CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP,
           RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP,BCOUT,PCIN,PCOUT,BCIN);

    /************************************************
    *
    *                parameters
    *
    *************************************************/
    /**these values define the number of pipeline registers in the A and B input paths**/
    parameter A0REG = 0;
    parameter A1REG = 1;
    parameter B0REG = 0;
    parameter B1REG = 1;

    /** defines the number of pipeline stages**/
    parameter CREG = 1;
    parameter DREG = 1;
    parameter MREG = 1;
    parameter PREG = 1;
    parameter CARRYINREG = 1;
    parameter CARRYOUTREG = 1; 
    parameter OPMODEREG = 1;

    /*The CARRYINSEL attribute is used in the carry cascade input,
     either the CARRYIN input will be considered or the value of opcode[5]*/
    //This attribute can be set to the string CARRYIN or OPMODE5.
    //Tie the output of the mux to 0 if none of these string values exist.
    parameter CARRYINSEL = "OPMODE5";

    /*This attribute can be set to the string DIRECT or CASCADE*/
    /*CASCADE -> (BCIN)*/
    /*Tie the output of the mux to 0 if none of these string values exist*/

    parameter B_INPUT = "DIRECT";
    // parameter B_INPUT = "CASCADE";

    /*This attribute can be set to ASYNC or SYNC*/
    parameter RSTTYPE = "SYNC";

    
    /************************************************
    *
    *                Data Ports
    *
    *************************************************/
    //Input Ports
    input [17:0]A;
    input [17:0]B;
    input [47:0]C;
    input [17:0]D;
    input CARRYIN;
    input [17:0]BCIN;
    //Control Input Ports
    input CLK;
    input [7:0]OPMODE;
    //clock enable input ports
    input CEA;  /*Clock enable for the A port registers: (A0REG & A1REG)*/
    input CEB;  /*Clock enable for the B port registers: (B0REG & B1REG)*/
    input CEC;  /*Clock enable for the C port registers (CREG)*/
    input CECARRYIN;    /*Clock enable for the carry-in register (CYI) and the carry-out register (CYO)*/
    input CED;  /*Clock enable for the D port register (DREG)*/
    input CEM;  /*Clock enable for the multiplier register (MREG)*/
    input CEOPMODE; /*Clock enable for the opmode register (OPMODEREG)*/
    input CEP;  /*Clock enable for the P output port registers (PREG = 1)*/
    //Reset Input Ports
    input RSTA; /*Reset for the A registers: (A0REG & A1REG)*/
    input RSTB; /*Reset for the B registers: (B0REG & B1REG)*/
    input RSTC; /*Reset for the C registers (CREG)*/
    input RSTCARRYIN; /*Reset for the carry-in register (CYI) and the carry-out register (CYO)*/
    input RSTD; /*Reset for the D register (DREG)*/
    input RSTM; /*Reset for the multiplier register (MREG)*/
    input RSTOPMODE;  /*Reset for the opmode register (OPMODEREG)*/
    input RSTP; /*Reset for the P output registers (PREG = 1)*/
    //Cascade Ports
    /*Inputs*/
    input [47:0]PCIN; /*Cascade input for Port P*/
    /*outputs*/
    output [47:0]PCOUT; /*Cascade output for Port P*/  
    output [17:0]BCOUT; /*Cascade output for Port B*/
    //output ports
    output [47:0]P;
    output [35:0]M;
    output CARRYOUT;
    output CARRYOUTF; 

    /************************************************************
    *
    *                    Modules Instantiations
    *
    *************************************************************/
    //Instantiation 1st stage
    wire [17:0]dwire,bwire0,bwire1,awire0,awire1;
    wire [47:0]cwire;
    reg_mux D_REG(.USE_REG(DREG),.data(D),.clk(CLK),.en_clk(CED),.rst(RSTD),.block_out(dwire)); 
    reg_mux A0_REG(.USE_REG(A0REG),.data(A),.clk(CLK),.en_clk(CEA),.rst(RSTA),.block_out(awire0)); 
    reg_mux #(.INPUT_SIZE(48)) C_REG(.USE_REG(CREG),.data(C),.clk(CLK),.en_clk(CEC),.rst(RSTC),.block_out(cwire));

    //For B Input
    assign bwire0 = (B_INPUT == "DIRECT") ? B : BCIN;
    reg_mux B0_REG(.USE_REG(B0REG),.data(bwire0),.clk(CLK),.en_clk(CEB),.rst(RSTB),.block_out(bwire1)); 

    //Instantiation 2nd stage
    wire [17:0]pre_add_sub_out,bd_mux_out,bwire2;
    wire [7:0]opmodewire;
    reg_mux #(.INPUT_SIZE(8)) OPMODE_REG(.USE_REG(OPMODEREG),.data(OPMODE),.clk(CLK),.en_clk(CEOPMODE),.rst(RSTOPMODE),.block_out(opmodewire));
    assign pre_add_sub_out = opmodewire[6] ? (dwire-bwire1): (dwire+bwire1);
    assign bd_mux_out = opmodewire[4] ? pre_add_sub_out : bwire1;
    reg_mux B1_REG(.USE_REG(B1REG),.data(bd_mux_out),.clk(CLK),.en_clk(CEB),.rst(RSTB),.block_out(bwire2)); 
    reg_mux A1_REG(.USE_REG(A1REG),.data(awire0),.clk(CLK),.en_clk(CEA),.rst(RSTA),.block_out(awire1));

    //Instantiation 3rd stage
    wire [35:0]multiplier_out,mreg_out;
    assign multiplier_out = bwire2 * awire1;
    reg_mux #(.INPUT_SIZE(36)) M_REG(.USE_REG(MREG),.data(multiplier_out),.clk(CLK),.en_clk(CEM),.rst(RSTM),.block_out(mreg_out));

    /*For carry cascade*/
    wire carrywire0,carrywire1;

    /**Generate if condition used with constant expression only(Parameters)*/
    generate 
        if(CARRYINSEL=="OPMODE5")
            assign carrywire0 = opmodewire[5];
        else if(CARRYINSEL == "CARRYIN")
            assign carrywire0 = CARRYIN;
        else 
            assign carrywire0 = 0;
    endgenerate

    reg_mux #(.INPUT_SIZE(1)) CYI_REG(.USE_REG(CARRYINREG),.data(carrywire0),.clk(CLK),.en_clk(CECARRYIN),.rst(RSTCARRYIN),.block_out(carrywire1));

    //X Z multiplexers
    wire [47:0]xmulti_out,zmulti_out;
    assign xmulti_out = (opmodewire[1:0]== 0) ? 0 : (opmodewire[1:0]== 1) ? mreg_out : (opmodewire[1:0]== 2 && PREG) ? P : {D[11:0],A[17:0],B[17:0]};
    assign zmulti_out = (opmodewire[3:2]== 0) ? 0 : (opmodewire[3:2]== 1) ? PCIN : (opmodewire[3:2]== 2 && PREG) ? P : cwire; 

    //Post adder/substractor
    wire [48:0]temp_out;
    wire [47:0]post_add_sub_out;
    wire carryoutwire;
    assign temp_out = (opmodewire[7]) ? (zmulti_out - (xmulti_out + carrywire1)) : (zmulti_out + xmulti_out + carrywire1);
    assign carryoutwire = temp_out[0];
    //check if the carryin(carrywire0) equal 1,then decrement 1 from the temp and store it in (post_add_sub_out)
    assign post_add_sub_out = (carrywire0)? temp_out - 1 : temp_out;

    /************************************************************
    *
    *                          Outputs
    *
    *************************************************************/
    
    //carry out cascade
    reg_mux #(.INPUT_SIZE(1)) CYO_REG(.USE_REG(CARRYOUTREG),.data(carryoutwire),.clk(CLK),.en_clk(CECARRYIN),.rst(RSTCARRYIN),.block_out(CARRYOUT));
    //CARRYOUTF
    assign CARRYOUTF = CARRYOUT;
    //P (final output)
    reg_mux #(.INPUT_SIZE(48)) P_REG(.USE_REG(PREG),.data(post_add_sub_out),.clk(CLK),.en_clk(CEP),.rst(RSTP),.block_out(P));
    //PCOUT
    assign PCOUT = (PREG) ? P : post_add_sub_out;
    //BCOUT
    assign BCOUT = bwire2;
    //M 
    assign M =  mreg_out;
endmodule