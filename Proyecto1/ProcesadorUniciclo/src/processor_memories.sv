module processor_memories(input logic clk, reset,
			  output logic mem_write,
			  output logic [21:0] write_data, data_adr);
			  
  logic [21:0] pc, instr, read_data, data_mem_out;  
  logic [7:0] img_mem_out;
  //logic [21:0] img_mem_out;
  logic mem_enb, show_enb, mem_read;
  
  assign mem_read = ~instr[20] & instr[19] & instr[16];
  
  data_path CPU(clk, reset, instr, read_data, mem_write, pc, data_adr, write_data);
  
  instruction_memory im(pc, instr);
  data_memory dm(clk, mem_write & mem_enb, data_adr, write_data, data_mem_out);
  RAM image(data_adr[18:0], clk, write_data[7:0], 1'b1, show_enb & mem_write, img_mem_out);
  //image_memory image(clk, mem_write & show_enb, data_adr, write_data[7:0], img_mem_out);
  
  io_deco deco(data_adr, mem_enb, show_enb);	
  
  mux_2_x_1 #(22) mux0({ 14'b0, img_mem_out }, data_mem_out, mem_enb & mem_read, read_data);
  //mux_2_x_1 #(22) mux0(data_mem_out, img_mem_out, mem_enb, read_data);
  
endmodule 