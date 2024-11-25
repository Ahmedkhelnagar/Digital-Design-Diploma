
vlib work
vlog T_FlipFlop.v T_FlipFlop_tb.v
vsim -voptargs=+acc work.T_FlipFlop_tb
add wave *
run -all
#quit -sim