

module Wrapper_module(MOSI,MISO,SS_n,clk,rst_n);
    //Input output ports
    input MOSI,SS_n,clk,rst_n;
    output MISO;

    //Internal signals
    wire [9:0]rx_data;
    wire rx_valid,tx_valid;
    wire [7:0]tx_data;


    //Instantiations modules
    ram M1(rx_data,tx_data,rx_valid,tx_valid,clk,rst_n);
    SPI_FSM_module M2(MOSI,MISO,SS_n,clk,rst_n,rx_data,rx_valid,tx_data,tx_valid);
    
endmodule