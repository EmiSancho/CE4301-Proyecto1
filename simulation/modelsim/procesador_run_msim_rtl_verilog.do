transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/instr_mem.v}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/mult.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/division.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/bor.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/band.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/muxRI.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/_register_file.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/_pc_counter_4.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/_pc_counter.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/_control_unit.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/instruction_memory.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/alu.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/PROCESADOR.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/tb_procesador.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/muxControl.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/data_memory.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/image_cruda_memory.sv}
vlog -sv -work work +incdir+C:/Users/emily/Desktop/CE4301-Proyecto1 {C:/Users/emily/Desktop/CE4301-Proyecto1/image_procesada_memory.sv}

