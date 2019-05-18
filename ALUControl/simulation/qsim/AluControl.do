onerror {quit -f}
vlib work
vlog -work work AluControl.vo
vlog -work work AluControl.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.AluControl_vlg_vec_tst
vcd file -direction AluControl.msim.vcd
vcd add -internal AluControl_vlg_vec_tst/*
vcd add -internal AluControl_vlg_vec_tst/i1/*
add wave /*
run -all
