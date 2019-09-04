module execute(input logic clk, rst,
					input logic pc_src_e, reg_write_e, mem_write_e, mem_reg_e, alu_src_e, no_write_e, 
					input mov_src_e, flag_write_e, cond_e,
					input logic [1:0] alu_control_e,
					input logic [21:0] rd1_execute_in, rd2_execute_in, rd3_execute_in, extened_execute_in,
					input logic [3:0] write_register_execute_in,
					output logic [21:0] write_data_execute_out, alu_result_execute_out, 
					output logic [3:0] write_register_execute_out,
					output logic pc_src_m, reg_write_m, mem_reg_m, mem_write_m);

	logic [21:0] mux2_out, mov_mux_out;
	logic [3:0] alu_flags;
	
	mux_2_x_1 #(22) mux2(rd2_execute_in, extened_execute_in, alu_src_e, mux2_out);
	mux_2_x_1 #(22) mux3(rd1_execute_in, 22'b0, mov_src_e, mov_mux_out); // Si esta haciendo mov, pone un 0 para que el alu 
	// sume con 0 y el inmediato
	
	ALU #(22) alu(mov_mux_out, mux2_out, alu_control_e, alu_result_execute_out, alu_flags);
	
	cond_logic cl(clk, rst, pc_src_e, reg_write_e, mem_write_e, no_write_e, cond_e, flag_write_e, alu_flags[2],
				     pc_src_m, reg_write_m, mem_write_m);
	
	assign write_data_execute_out = rd3_execute_in;
	assign write_register_execute_out = write_register_execute_in;
	assign mem_reg_m = mem_reg_e;

endmodule 