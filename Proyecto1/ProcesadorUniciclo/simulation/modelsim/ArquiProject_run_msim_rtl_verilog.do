transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/uGit/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/multiplier.sv}
vlog -sv -work work +incdir+D:/uGit/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src {D:/uGit/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/test.sv}

