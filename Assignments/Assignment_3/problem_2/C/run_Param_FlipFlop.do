
vlib work
vlog Param_FlipFlop.v Param_FlipFlop_tb.v
vsim -voptargs=+acc work.Param_FlipFlop_tb
add wave *
run -all
#quit -sim