module processor_memories(input logic clk, reset,
			  output logic mem_write, vga,
			  output logic [23:0] write_data, data_adr);
			  
  logic [23:0] pc, instr, read_data, data_mem_out;  
  logic [7:0] img_mem_out, img_mem2_out;
  logic mem_enb, show_enb, mem_read;
  logic [23:0] mux0_out, mux1_out;
  logic original_enb, process_enb;
  
  assign mem_read = ~instr[20] & instr[19] & instr[16];
  
  data_path CPU(clk, reset, instr, read_data, mem_write, pc, data_adr, write_data);
  
  instruction_memory im(pc, instr);
  data_memory dm(clk, mem_write & mem_enb, data_adr, write_data, data_mem_out);
  //RAM ram(data_adr[17:0], clk, write_data[7:0], 1'b1, mem_write & original_enb, img_mem_out);
  //image_memory image2(clk, mem_write & process_enb, data_adr, write_data[7:0], img_mem2_out);
  
  io_deco2 deco(data_adr, mem_enb, show_enb, original_enb, process_enb);
 
  flip_flop_D #(1) ff1(clk, ~reset, show_enb & mem_write, write_data[0], vga); 
  
  mux_2_x_1 #(24) mux0(24'b0, data_mem_out, mem_enb & mem_read, read_data);
  
endmodule 