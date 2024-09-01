
//MUX with FlipFlop
module reg_mux(data,clk,en_clk,USE_REG,rst,block_out);
    parameter INPUT_SIZE = 18;
    // parameter USE_REG = 0;  //0:No register(combination), 1: Sequential(Pipeline)
    input USE_REG ;  
    parameter RSTTYPE = "SYNC";
    //Input & Output Ports
    input [INPUT_SIZE-1:0]data;
    input clk,en_clk,rst;
    output [INPUT_SIZE-1:0]block_out;

    //Internal signals
    reg [INPUT_SIZE-1:0]data_reg;

    /****************Sequential*****************/
    generate
        if(RSTTYPE == "ASYNC")begin
          //ASYNC
          always@(posedge clk or posedge rst)begin
            if (rst)begin
              data_reg <= 0;
            end
            else begin
              if(en_clk)
                data_reg <= data;
            end
          end
        end
        else begin
          //sync
          always@(posedge clk)begin
            if (rst)begin
              data_reg <= 0;
            end
            else begin
              if(en_clk)
                data_reg <= data;
            end
          end
        end
    endgenerate

    //Final output based on USE_REG parameter
    assign block_out  = (USE_REG) ? data_reg : data;

endmodule