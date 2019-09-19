module execute(input logic clk, rst,
					input logic [3:0] flags, 
					input logic branch_e,
					input logic pc_src_e, reg_write_e, mem_write_e, alu_src_e, no_write_e, 
					input mov_src_e, flag_write_e, 
					input logic [2:0] cond_e,
					input logic [1:0] alu_control_e,
					input logic [23:0] rd1_execute_in, rd2_execute_in, extened_execute_in,
					input logic [23:0] result_write_back, alu_result_memory,
					input logic [1:0] forwardAE, forwardBE,
					output logic [23:0] alu_result_execute_out, write_data,
					output logic pc_src_m, reg_write_m, mem_write_m,
					output logic [3:0] flag_zero_p, 
					output logic branch_taken_e);

	logic [23:0] mux2_out, mov_mux_out, mux0_out,  mux1_out;
	logic [3:0] alu_flags;
	
	mux_4_x_1 #(24) mux0(rd1_execute_in, result_write_back, alu_result_memory, 24'b0, forwardAE, mux0_out);
	mux_4_x_1 #(24) mux1(rd2_execute_in, result_write_back, alu_result_memory, 24'b0, forwardBE, mux1_out);	
	
	mux_2_x_1 #(24) mux2(mux1_out, extened_execute_in, alu_src_e, mux2_out);
	mux_2_x_1 #(24) mux3(mux0_out, 24'b0, mov_src_e, mov_mux_out); // Si esta haciendo mov, pone un 0 para que el alu 
	// sume con 0 y el inmediato
	
	ALU #(24) alu(mov_mux_out, mux2_out, alu_control_e, alu_result_execute_out, alu_flags);
	
	cond_logic2 cl(clk, rst, pc_src_e, reg_write_e, mem_write_e, no_write_e, cond_e, flag_write_e, flags,
				     branch_e, pc_src_m, reg_write_m, mem_write_m, branch_taken_e);	
	
	assign flag_zero_p = alu_flags;
	assign write_data = mux1_out;

	//assign write_data_execute_out = rd3_execute_in;
	//assign write_register_execute_out = write_register_execute_in;
	//assign mem_reg_m = mem_reg_e;
endmodule 