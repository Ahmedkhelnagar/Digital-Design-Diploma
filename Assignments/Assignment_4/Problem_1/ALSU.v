

module ALSU(A,B,opcode,cin,serial_in,direction,
            red_op_A,red_op_B,bypass_A,bypass_B,
            clk,rst,out,leds);

    parameter INPUT_PRIORITY = "A";
    parameter FULL_ADDER = "ON";
    
    input [2:0]A,B,opcode;
    input cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B,clk,rst;
    output reg [15:0]leds;
    output reg [5:0]out;

    reg [2:0]A_reg,B_reg,opcode_reg;
    reg cin_reg,serial_in_reg,direction_reg,red_op_A_reg,red_op_B_reg,bypass_A_reg,bypass_B_reg;

    always@(posedge clk or posedge rst)begin
    if(rst)begin
        A_reg <= 3'b0;
        B_reg <= 3'b0;
        opcode_reg <= 3'b0;
        cin_reg <= 0;
        serial_in_reg <= 0;
        direction_reg <= 0;
        red_op_A_reg <= 0;
        red_op_B_reg <= 0;
        bypass_A_reg <= 0;
        bypass_B_reg <= 0;
    end
    else begin
        A_reg <= A;
        B_reg <= B;
        opcode_reg <= opcode;
        cin_reg <= cin;
        serial_in_reg <= serial_in;
        direction_reg <= direction;
        red_op_A_reg <= red_op_A;
        red_op_B_reg <= red_op_B;
        bypass_A_reg <= bypass_A;
        bypass_B_reg <= bypass_B;
        end
    end /*end of alwayas one*/

    always@(posedge clk or posedge rst)begin
        if(rst)begin 
            out <= 6'b0;
            leds <= 16'b0;
        end
        else begin
            //Handling the Bypass logic with priority 
            if(bypass_A_reg && bypass_B_reg)begin
                if(INPUT_PRIORITY == "A")
                    out <= A_reg;
                else
                    out <= B_reg;
            end
            else if(bypass_A_reg)
                out <= A_reg;
            else if(bypass_B_reg)
                out <= B_reg;
            else begin
                case (opcode_reg)
                //AND operation
                0: begin
                    leds <= 16'b0;
                    if(red_op_A_reg && red_op_B_reg)begin
                        if(INPUT_PRIORITY == "A")
                            out <= &A_reg;
                        else 
                            out <= &B_reg;
                    end
                    else if(red_op_A_reg)
                        out <= &A_reg;
                    else if(red_op_B_reg)
                        out <= &B_reg;
                    else
                    out <= A_reg & B_reg;
                end
                //XOR operation
                1:begin 
                    leds <= 16'b0;
                    if(red_op_A_reg && red_op_B_reg)begin
                        if(INPUT_PRIORITY == "A")
                            out <= ^A_reg;
                        else 
                            out <= ^B_reg;
                    end
                    else if(red_op_A_reg)
                        out <= ^A_reg;
                    else if(red_op_B_reg)
                        out <= ^B_reg;
                    else
                    out <= A_reg ^ B_reg;
                end
                //Addition operation
                2: begin
                    leds <= 16'b0;
                    if(FULL_ADDER == "ON")
                    out <= A_reg + B_reg + cin_reg;
                    else
                    out <= A_reg + B_reg;
                end
                //Multiplication
                3: begin 
                    leds <= 16'b0;
                    out <= A_reg * B_reg;
                end
                //Shift output by 1
                4:begin 
                    leds <= 16'b0;
                    if(direction_reg) /*High -> left*/
                        out <= {out[4:0], serial_in_reg};
                    else
                        out <= {serial_in_reg, out[5:1]};
                end
                //Rotate output by 1
                5:begin 
                    leds <= 16'b0;
                    if(direction_reg) /*Hight -> rotation to left*/ 
                        out <= {out[4:0],out[5]};
                    else
                        out <= {out[0],out[5:1]};
                end
                //Invalid opcode
                default:begin
                    leds <= ~leds;  /*Toggle leds*/
                    out <= 6'b0;
                end
                endcase

                //Handling the other invalid inputs
                if( (red_op_A_reg || red_op_B_reg) && (opcode_reg != 3'b000) && (opcode_reg != 3'b001))begin
                    leds <= ~leds;  /*Toggle leds*/
                    out <= 6'b0;
                end
            end
        end  

    end/*end of always 2*/

endmodule