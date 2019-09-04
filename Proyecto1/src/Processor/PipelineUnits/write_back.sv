module write_back(input logic [21:0] read_data_write_back_in, alu_result_write_back_in, 
						input logic [3:0] write_register_write_back_in,
						input logic mem_reg,
						output logic [21:0] result_write_back_out,
						output logic [3:0] write_register_back_out);
						
	mux_2_x_1 #(22) mux_wb(alu_result_write_back_in, read_data_write_back_in, mem_reg, result_write_back_out);
	assign write_register_back_out = write_register_write_back_in;
						
endmodule 