
vlib work
vlog Wrapper_module.v RAM_module.v SPI_FSM_module.v
vsim -voptargs=+acc work.Wrapper_tb
add wave /Wrapper_tb/MOSI \ /Wrapper_tb/SS_n \ /Wrapper_tb/clk \ /Wrapper_tb/rst_n \ /Wrapper_tb/MISO /Wrapper_tb/DUT/M2/tx_valid \ /Wrapper_tb/DUT/M2/tx_data \ /Wrapper_tb/DUT/M2/rx_data \ /Wrapper_tb/DUT/M2/rx_valid \ /Wrapper_tb/DUT/M2/cs \ /Wrapper_tb/DUT/M2/ns \ /Wrapper_tb/DUT/M2/counter_convert /Wrapper_tb/DUT/M1/internal_addr
run -all
#quit -sim