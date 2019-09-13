module memory(input logic clk,
				  input logic mem_write_m,
				  input logic [21:0] alu_result_memory_in, write_data_memory_in,
				  output logic [21:0] read_data_memory);
				  
	logic mem_enb, img_enb;
	logic [21:0] data_mem_out;
	logic [7:0] img_mem_out;
	
	io_deco deco(alu_result_memory_in, mem_enb, img_enb);	
				  
	data_memory dm(clk, mem_enb & mem_write_m, alu_result_memory_in, write_data_memory_in, data_mem_out);	
	image_memory im(clk, img_enb & mem_write_m, alu_result_memory_in, write_data_memory_in[7:0], img_mem_out);
	
	mux_2_x_1 #(22) mux0(data_mem_out, { 14'b0, img_mem_out }, mem_enb, read_data_memory);
	
	//assign alu_result_memory_out = alu_result_memory_in;
	//assign write_register_memory_out = write_register_memory_in;
	//assign pc_src_w = pc_src_m;
	//assign reg_write_w = reg_write_m;
	//assign mem_reg_w = mem_reg_m;
	
endmodule 