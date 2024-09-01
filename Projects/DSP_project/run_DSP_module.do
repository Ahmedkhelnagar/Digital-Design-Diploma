
vlib work
vlog reg_mux.v DSP_module.v DSP_tb.v
vsim -voptargs=+acc work.DSP_tb
add wave *
run -all
#quit -sim