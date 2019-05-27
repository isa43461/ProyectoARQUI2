onerror {quit -f}
vlib work
vlog -work work pruebaControl.vo
vlog -work work pruebaControl.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.pruebaControl_vlg_vec_tst
vcd file -direction pruebaControl.msim.vcd
vcd add -internal pruebaControl_vlg_vec_tst/*
vcd add -internal pruebaControl_vlg_vec_tst/i1/*
add wave /*
run -all
