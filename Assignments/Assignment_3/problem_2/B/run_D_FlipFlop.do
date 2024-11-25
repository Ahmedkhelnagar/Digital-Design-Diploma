
vlib work
vlog D_FlipFlop.v D_FlipFlop_tb.v
vsim -voptargs=+acc work.D_FlipFlop_tb
add wave *
run -all
#quit -sim