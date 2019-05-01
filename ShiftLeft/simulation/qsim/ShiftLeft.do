onerror {quit -f}
vlib work
vlog -work work ShiftLeft.vo
vlog -work work ShiftLeft.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ShiftLeft_vlg_vec_tst
vcd file -direction ShiftLeft.msim.vcd
vcd add -internal ShiftLeft_vlg_vec_tst/*
vcd add -internal ShiftLeft_vlg_vec_tst/i1/*
add wave /*
run -all
