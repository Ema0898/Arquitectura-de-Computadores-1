module decode(input logic clk, rst, reg_write_write_back,
				  input logic [23:0] instruction_decode_in, pc_plus_8_in, result_decode_in,
				  input logic [3:0] write_register_decode_in,
				  output logic [23:0] rd1, rd2, rd3, imm_ext, 
				  output logic pc_src_d, reg_write_d, mem_write_d, mem_reg_d, alu_src_d, no_write_d, mov_src_d, 
				  output logic flag_write_d,
				  output logic [1:0] alu_control_d,
				  output logic branch_taken_d, mem_read_d,
				  output logic [3:0] ra1_d, ra2_d, ra3_d);

	// Declaracion logics para la etapa de decode
	logic [3:0] reg1_in;
	logic [1:0] imm_src;
	
	logic reg_src;
	
	mux_2_x_1 #(4) mux_reg1(instruction_decode_in[14:11], 4'b1011, reg_src, reg1_in);
	
	register_file rf(clk, rst, reg_write_write_back, reg1_in, instruction_decode_in[6:3], write_register_decode_in, 
						  write_register_decode_in, result_decode_in, pc_plus_8_in, rd1, rd2, rd3);
						  
	extend ext(instruction_decode_in[18:0], imm_src, imm_ext);
	
	decode_unit_pipe deco_unit_pipe(instruction_decode_in[20:19], instruction_decode_in[18:15], instruction_decode_in[10:7],
					pc_src_d, reg_write_d, mem_write_d, mem_reg_d, alu_src_d, no_write_d, mov_src_d, reg_src, 
					flag_write_d, branch_taken_d, alu_control_d, imm_src);	
			
	assign ra1_d = reg1_in;
	assign ra2_d = instruction_decode_in[6:3];
	assign ra3_d = instruction_decode_in[14:11];
	assign mem_read_d = ~instruction_decode_in[20] & instruction_decode_in[19] & instruction_decode_in[16];
	
endmodule 