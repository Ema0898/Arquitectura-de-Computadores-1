module memory(input logic clk,
				  input logic pc_src_m, reg_write_m, mem_reg_m, mem_write_m,
				  input logic [21:0] alu_result_memory_in, write_data_memory_in,
				  input logic [3:0] write_register_memory_in,
				  output logic [21:0] read_data_memory, alu_result_memory_out, 
				  output logic [3:0] write_register_memory_out,
				  output logic pc_src_w, reg_write_w, mem_reg_w);

	data_memory dm(clk, mem_write_m, alu_result_memory_in, write_data_memory_in, read_data_memory);
	assign alu_result_memory_out = alu_result_memory_in;
	assign write_register_memory_out = write_register_memory_in;
	assign pc_src_w = pc_src_m;
	assign reg_write_w = reg_write_m;
	assign mem_reg_w = mem_reg_m;
	
endmodule 