onerror {quit -f}
vlib work
vlog -work work RegFile.vo
vlog -work work RegFile.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.RegFile_vlg_vec_tst
vcd file -direction RegFile.msim.vcd
vcd add -internal RegFile_vlg_vec_tst/*
vcd add -internal RegFile_vlg_vec_tst/i1/*
add wave /*
run -all
