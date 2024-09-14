onerror {quit -f}
vlib work
vlog -work work processadorEnzoVini.vo
vlog -work work processadorEnzoVini.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.flopr_vlg_vec_tst
vcd file -direction processadorEnzoVini.msim.vcd
vcd add -internal flopr_vlg_vec_tst/*
vcd add -internal flopr_vlg_vec_tst/i1/*
add wave /*
run -all
