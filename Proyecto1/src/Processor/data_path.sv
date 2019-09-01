module data_path(input clk, rst,
					  input pc_src, reg_write, alu_src, mem_reg, reg_src, mov_src,
					  input logic [1:0] alu_control, imm_src, 
					  input logic [21:0] instruction, read_data,
					  output logic [3:0] alu_flags,
					  output logic [21:0] pc, alu_result_dir, write_data);
					  
	logic carry_out, carry_out1;
	logic [3:0] reg1_in;
	logic [21:0] pc_plus_4, pc_plus_8, pc_mux, rd1, rd2, rd3, imm_ext, mux2_out, read_data_mux, mov_mux_out;
					  
	generic_adder #(22) adder1(pc, 22'b0000000000000000000100, 1'b0, pc_plus_4, carry_out);
   generic_adder #(22) adder2(pc_plus_4, 22'b0000000000000000000100, 1'b0, pc_plus_8, carry_out1);
	
	mux_2_x_1 #(22) mux0(pc_plus_4, read_data, pc_src, pc_mux);
	mux_2_x_1 #(22) mux1(alu_result_dir, read_data, mem_reg, read_data_mux);
	
	flip_flop_D #(22) ff(clk, rst, 1'b1, pc_mux, pc); 
	
	mux_2_x_1 #(4) mux_reg1(instruction[14:11], 4'b1111, reg_src, reg1_in);
	
	register_file rf(clk, rst, reg_write, reg1_in, instruction[6:3], instruction[10:7], instruction[10:7], 
							read_data_mux, pc_plus_8, rd1, rd2, rd3);
							
	extend ext(instruction[18:0], imm_src, imm_ext);
	
	mux_2_x_1 #(22) mux2(rd2, imm_ext, alu_src, mux2_out);
	mux_2_x_1 #(22) mux3(rd1, 22'b0, mov_src, mov_mux_out); // Si esta haciendo mov, pone un 0 para que el alu 
	// sume con 0 y el inmediato
							
	ALU #(22) alu(mov_mux_out, mux2_out, alu_control, alu_result_dir, alu_flags);
							
	assign write_data = rd3;
	
endmodule 