
vlib work
vlog Data_latch.v Data_latch_tb.v
vsim -voptargs=+acc work.Data_latch_tb
add wave *
run -all
#quit -sim