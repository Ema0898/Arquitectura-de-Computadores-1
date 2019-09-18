module top(input logic clk, reset, original,
			  input logic [2:0] btn, 
			  output logic vga_hs, vga_vs, vga_blank_n, clockVGA,
			  output logic [7:0] red, green, blue);
			  
  logic [23:0] pc, instr, read_data, data_mem_out, data_adr, write_data;  
  logic [7:0] original_image_mem_out, proccess_image_mem_out, RGB_out1, RGB_out2, image_mem_out, RGB_out3;
  logic [17:0] original_image_mem_address, proccess_image_mem_address_previous, proccess_image_mem_address;
  logic [17:0] out, original_image_mem_address_previous;
  logic mem_enb, show_enb, mem_read, vga_enb, mem_write, show_original_enb, original_enb, process_enb;
  logic btn_read, counter_out;
  logic [2:0] btn_in;
  logic [1:0] btn_selecc;
  logic [23:0] mux1_out, mux2_out;
  logic clk25MHz;
  
  ClkDivisor divisor(clk, clk25MHz);
  
  assign mem_read = ~instr[20] & instr[19] & instr[16];
  
  data_path CPU(clk25MHz, ~reset, instr, read_data, mem_write, pc, data_adr, write_data);  
  instruction_memory im(pc, instr);
  data_memory dm(clk, mem_write & mem_enb, data_adr, write_data, data_mem_out); 
  
  //RAM ram(original_image_mem_address, clk, 8'b0, 1'b1, 1'b0, original_image_mem_out);  
  //RAM2 ram2(proccess_image_mem_address, clk, write_data[7:0], 1'b1, mem_write & process_enb, proccess_image_mem_out);
  
  image_memory_controller image_controller(clk, 1'b0, original_image_mem_address, 8'b0, original_image_mem_out);
  image_memory_controller_process image_process(clk, mem_write & process_enb, proccess_image_mem_address, write_data[7:0], proccess_image_mem_out);
  
  //image_memory image(clk, mem_write & original_enb, data_adr, write_data[7:0], image_mem_out);
  
  io_deco deco(data_adr, mem_enb, show_enb, show_original_enb, original_enb, process_enb, btn_selecc);	

  flip_flop_D #(1) ff0(clk, ~reset, mem_read, ~btn[0], btn_in[0]);
  flip_flop_D #(1) ff1(clk, ~reset, mem_read, ~btn[1], btn_in[1]);
  flip_flop_D #(1) ff2(clk, ~reset, mem_read, ~btn[2], btn_in[2]); 
 
  mux_4_x_1 #(1) mux0(btn_in[0], btn_in[1], btn_in[2], 1'b0, btn_selecc, btn_read);   
  mux_2_x_1 #(24) mux1({ 23'b0, btn_read }, data_mem_out, mem_enb & mem_read, mux1_out);
  mux_2_x_1 #(24) mux2(mux1_out, { 16'b0, original_image_mem_out }, mem_read & original_enb, read_data);
  //mux_2_x_1 #(22) mux2(mux1_out, { 14'b0, image_mem_out }, mem_read & original_enb, mux2_out);
  //mux_2_x_1 #(22) mux3(mux2_out, { 14'b0, proccess_image_mem_out }, mem_read & process_enb, read_data); 


  flip_flop_D #(1) ff3(clk, ~reset, show_enb & mem_write, write_data[0], vga_enb); 
  
  VGA vga(clk, reset, vga_hs, vga_vs, vga_blank_n, clockVGA, counter_out, out);
  
  
  offset_image_mem offset(data_adr, original_image_mem_address_previous, proccess_image_mem_address_previous);
  mux_2_x_1 #(18) mux4(original_image_mem_address_previous, out, ~original, original_image_mem_address);
  mux_2_x_1 #(18) mux7(proccess_image_mem_address_previous, out, vga_enb, proccess_image_mem_address);
  
  mux_2_x_1 #(8) mux5(8'b0, proccess_image_mem_out, vga_enb, RGB_out1);   
  mux_2_x_1 #(8) mux8(RGB_out1, original_image_mem_out, ~original, RGB_out2);
  mux_2_x_1 #(8) mux6(RGB_out2, 8'b0, counter_out, RGB_out3); 
  
  assign red = RGB_out3;
  assign green = RGB_out3;
  assign blue = RGB_out3;
  
endmodule 