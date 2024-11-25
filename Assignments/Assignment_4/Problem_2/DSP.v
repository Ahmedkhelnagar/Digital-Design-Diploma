

module DSP(A,B,C,D,clk,rst_n,P);
    input [17:0]A,B,D;
    input [47:0]C;
    input clk ,rst_n;
    parameter OPERATION = "ADD";
    output reg[47:0]P;

    reg [17:0]A_reg,B_reg,D_reg;
    reg [47:0]C_reg;
    reg [35:0]Adder_output;
    reg [35:0]Adder_output_reg;
    reg [17:0]A_reg_reg;
    reg [47:0]multipler_output;
    reg [47:0]multipler_output_reg;
    reg [36:0]Adder_output_2;
    reg [36:0]Adder_output_2_reg;

    //Inputs of Flip Flops
    always@(posedge clk)begin
      if(~rst_n)begin
        A_reg <= 0;
        B_reg <= 0;
        C_reg <= 0;
        D_reg <= 0;        
      end
      else begin
        A_reg <= A;
        B_reg <= B;
        C_reg <= C;
        D_reg <= D;      
      end
    end

    //First Stage (adder 1 output)
    always@(posedge clk)begin
        if(~rst_n)
          Adder_output <= 36'b0;
        else begin
            if(OPERATION)begin
                Adder_output <= D_reg + B_reg;
            end
            else begin
                Adder_output <= D_reg - B_reg;
            end
        end
    end

    //Before Multipler
    always@(posedge clk)begin
        if(~rst_n)begin
            Adder_output_reg <= 0;
            A_reg_reg <= 0;
        end
        else begin
            Adder_output_reg <= Adder_output;
            A_reg_reg <= A_reg;
        end
    end

    //Multipler output
    always@(posedge clk)begin
        if(~rst_n)begin
            multipler_output <= 0;
        end
        else begin
            multipler_output <= A_reg_reg * Adder_output_reg;
        end
    end

    //Flip flop after multipler
    always@(posedge clk)begin
        if(~rst_n)begin
            multipler_output_reg <= 0;
        end
        else begin
            multipler_output_reg <= multipler_output;
        end
    end

    //adder2 output 
    always@(posedge clk)begin
        if(~rst_n)begin
            Adder_output_2 <= 0;
        end
        else begin
            if(OPERATION)
                Adder_output_2 <= multipler_output_reg + C_reg;
            else
                Adder_output_2 <= multipler_output_reg - C_reg;
        end
    end

    //flipFlop after the adder 2
    always@(posedge clk)begin
        if(~rst_n)begin
            Adder_output_2_reg <= 0;
        end
        else begin
            Adder_output_2_reg <= Adder_output_2;
        end
    end

    //Final output
    always@(posedge clk)begin
        if(~rst_n)begin
            P <= 0;
        end
        else begin
            P <= Adder_output_2_reg;
        end
    end


endmodule