onerror {quit -f}
vlib work
vlog -work work SignExtend26.vo
vlog -work work SignExtend26.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SignExtend26_vlg_vec_tst
vcd file -direction SignExtend26.msim.vcd
vcd add -internal SignExtend26_vlg_vec_tst/*
vcd add -internal SignExtend26_vlg_vec_tst/i1/*
add wave /*
run -all
