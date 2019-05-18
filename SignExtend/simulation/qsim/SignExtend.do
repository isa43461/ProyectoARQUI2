onerror {quit -f}
vlib work
vlog -work work SignExtend.vo
vlog -work work SignExtend.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SignExtend_vlg_vec_tst
vcd file -direction SignExtend.msim.vcd
vcd add -internal SignExtend_vlg_vec_tst/*
vcd add -internal SignExtend_vlg_vec_tst/i1/*
add wave /*
run -all
