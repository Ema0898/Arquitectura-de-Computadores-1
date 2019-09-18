transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ExtendUnit {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ExtendUnit/extend.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/RegisterFile {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/RegisterFile/register_file.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/multiplier.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/full_adder.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/flag_module.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/arithmetic_module.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/ALU.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/adder.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ALU/add_sub_module.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/data_path.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Memories {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Memories/instruction_memory.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Memories {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Memories/data_memory.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules/mux_4_x_1.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules/mux_2_x_1.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules/flip_flop_D.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules/generic_full_adder.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules/generic_adder.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/DecodeUnit {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/DecodeUnit/decode_unit.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ConditionalLogicUnit {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ConditionalLogicUnit/cond_check.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ConditionalLogicUnit {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Processor/ConditionalLogicUnit/cond_logic.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Generic_Modules/flip_flop_D_neg.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/processor_memories.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/processor_test.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Memories {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/Memories/image_memory.sv}
vlog -sv -work work +incdir+D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/IO {D:/uGit/BranchOldV/Arquitectura-de-Computadores-1/Proyecto1/ProcesadorUniciclo/src/IO/io_deco2.sv}

