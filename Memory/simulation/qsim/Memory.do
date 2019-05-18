onerror {quit -f}
vlib work
vlog -work work Memory.vo
vlog -work work Memory.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Memory_vlg_vec_tst
vcd file -direction Memory.msim.vcd
vcd add -internal Memory_vlg_vec_tst/*
vcd add -internal Memory_vlg_vec_tst/i1/*
add wave /*
run -all
