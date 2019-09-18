module data_path(input clk, rst, 
					  input logic [23:0] instruction, read_data,
					  output logic mem_write,
					  output logic [23:0] pc, alu_result_dir, write_data);
					  
	logic carry_out, carry_out1;
	logic [3:0] reg1_in;
	logic [23:0] pc_plus_4, pc_plus_8, pc_mux, rd1, rd2, rd3, imm_ext, mux2_out, read_data_mux, mov_mux_out;
	
	// Cables que salen de la unidad de control hacia el datapath
	logic pc_src_previous, pc_src, reg_write_previous, reg_write, mem_write_previous;
	logic mem_reg, alu_src, reg_src, mov_src, no_write, flag_write;
	logic [1:0] imm_src, alu_control;
	logic [3:0] alu_flags;
					  
	generic_adder #(24) adder1(pc, 24'b000000000000000000000100, 1'b0, pc_plus_4, carry_out);
   generic_adder #(24) adder2(pc_plus_4, 24'b000000000000000000000100, 1'b0, pc_plus_8, carry_out1);
	
	mux_2_x_1 #(24) mux0(pc_plus_4, read_data_mux, pc_src, pc_mux);
	mux_2_x_1 #(24) mux1(alu_result_dir, read_data, mem_reg, read_data_mux);
	
	flip_flop_D #(24) ff(clk, rst, 1'b1, pc_mux, pc); 
	
	mux_2_x_1 #(4) mux_reg1(instruction[14:11], 4'b1011, reg_src, reg1_in);
	
	register_file rf(clk, rst, reg_write, reg1_in, instruction[6:3], instruction[10:7], instruction[10:7], 
							read_data_mux, pc_plus_8, rd1, rd2, rd3);
							
	extend ext(instruction[18:0], imm_src, imm_ext);
	
	mux_2_x_1 #(24) mux2(rd2, imm_ext, alu_src, mux2_out);
	mux_2_x_1 #(24) mux3(rd1, 24'b0, mov_src, mov_mux_out); // Si esta haciendo mov, pone un 0 para que el alu 
	// sume con 0 y el inmediato
							
	ALU #(24) alu(mov_mux_out, mux2_out, alu_control, alu_result_dir, alu_flags);
	
	// Unidad de decodificacion de instruccion
	decode_unit decode(instruction[20:19], instruction[18:15], instruction[10:7], pc_src_previous, reg_write_previous, 
							 mem_write_previous, mem_reg, alu_src, no_write, mov_src, reg_src, flag_write,
							 alu_control, imm_src);
							 
	// Unidad de ejecucion condicional de instruccion
	cond_logic cl(clk, rst, pc_src_previous, reg_write_previous, mem_write_previous, no_write, instruction[23:21], flag_write,
					  alu_flags, pc_src, reg_write, mem_write);
							
	assign write_data = rd3;
	
endmodule 