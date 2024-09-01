
/*SPI implemented with Finite state machine connected on the other side with a RAM*/
module SPI_FSM_module(MOSI,MISO,SS_n,clk,rst_n,rx_data,rx_valid,tx_data,tx_valid);
    //States
    parameter IDLE          = 3'b000;
    parameter CHK_CMD       = 3'b001;
    parameter WRITE         = 3'b010;
    parameter READ_ADD      = 3'b011;
    parameter READ_DATA     = 3'b100;
    //Input Ports
    input  MOSI,SS_n,clk,rst_n,tx_valid;
    input  [7:0]tx_data; 
    //Output Ports
    output reg[9:0]rx_data;
    output reg MISO;
    output reg rx_valid;

    
    //Internal signals
    (* fsm_encoding = "gray" *) reg [2:0] cs,ns;  //cs-> current state, ns-> next state
    integer READ_FLAG = 0;
    
    integer counter_convert = 10;
    

    /************************Combinational -> Next State************************/
    always@(*)begin
      case (cs)
            IDLE: 
                if(SS_n)
                    ns = IDLE;
                else 
                    ns = CHK_CMD;
            CHK_CMD:
                if(SS_n)
                    ns = IDLE;
                else begin
                    if(MOSI)begin
                        if(READ_FLAG == 0)
                            ns = READ_ADD;
                        else
                            ns = READ_DATA;
                    end
                    else
                        ns = WRITE;       
                end
            WRITE:
                if(SS_n)
                    ns = IDLE;
                else
                    ns = WRITE;
            READ_ADD:
                if(SS_n)
                    ns = IDLE;
                else
                    ns = READ_ADD;
            READ_DATA:
                if(SS_n)
                    ns = IDLE;
                else 
                    ns = READ_DATA;
            default : ns = IDLE;                    
      endcase
    end

    /******************Sequential -> State Memory , rst_n is synch********************/
    always@(posedge clk)begin
        if(!rst_n)begin
            cs <= IDLE;
            // READ_FLAG <= 0;
        end
        else
            cs <= ns;
    end

    /******************************Sequential -> Output*************************/
    always@(posedge clk)begin
       case (cs)
            IDLE:begin
                counter_convert <= 9;
            end
            CHK_CMD:begin
                rx_data[counter_convert] <= MOSI; //MSB
                rx_valid <= 0;  //data is unavailable  
            end

            WRITE:begin
                    rx_data[counter_convert-1] <= MOSI; //convert serial to parallel
                    counter_convert <= counter_convert - 1;
                    if (counter_convert == 0)   //execute at 10th clock cycle.
                        rx_valid <= 1;  //data is available  
            end

            READ_ADD:begin
                    rx_data[counter_convert-1] <= MOSI; //convert serial to parallel
                    counter_convert <= counter_convert - 1;

                  if ( counter_convert == 0) begin
                   rx_valid <= 1;  //data is available
                   READ_FLAG <= 1; //go to read data state
                  end
            end

            READ_DATA:begin
                if(tx_valid)begin
                   MISO <= tx_data[counter_convert -1];    //convert parallel to serial
                   counter_convert <= counter_convert - 1;

                   //check on the counter to disable the counter to be -1
                   if (counter_convert == 0) begin
                        rx_valid <= 0;
                    end
                end

                else begin    
                    rx_data[counter_convert-1] <= MOSI;
                    counter_convert <= counter_convert - 1;
                   
                    if (counter_convert == 0) begin
                        rx_valid <= 1;
                        READ_FLAG <= 0; //to read address state
                        counter_convert <= 9; //Ram will take one clk cycle to raise tx_valid to 1, so counter = 9 not 8
                    end
                end
            end
       endcase
    end
    


endmodule