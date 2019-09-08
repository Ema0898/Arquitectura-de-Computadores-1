module fetch(input logic pc_src_w, branch_taken_e, stallF,
				 input logic clk, rst,
				 input logic [21:0] result_fetch_in,
				 input logic [21:0] alu_result_fetch_in,
				 output logic [21:0] instruction_fetch_out, pc_plus_8_out);
				 
	logic [21:0] pc_plus_4_fetch, instruction_fetch, read_data_mux, pc, pc_mux, pc_mux2;
	logic carry_out;				 
				 
	generic_adder #(22) adder1(pc, 22'b0000000000000000000100, 1'b0, pc_plus_4_fetch, carry_out);
	
	mux_2_x_1 #(22) mux0(pc_plus_4_fetch, result_fetch_in, pc_src_w, pc_mux);
	mux_2_x_1 #(22) mux1(pc_mux, alu_result_fetch_in, branch_taken_e, pc_mux2);
	
	flip_flop_D #(22) ff(clk, rst, ~stallF, pc_mux2, pc); 	
	
	instruction_memory im(pc, instruction_fetch_out);
	
	assign pc_plus_8_out = pc_plus_4_fetch;
				 
endmodule 