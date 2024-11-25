
vlib work
vlog ripple_counter.v ripple_counter_tb.v
vsim -voptargs=+acc work.ripple_counter_tb
add wave *
run -all
#quit -sim