
vlib work
vlog ALSU.v ALSU_tb.v
vsim -voptargs=+acc work.ALSU_tb
add wave *
run -all
#quit -sim