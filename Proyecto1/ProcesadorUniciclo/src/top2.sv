module top2(input logic clk, reset, btn, 
			  output logic vga_hs, vga_vs, vga_blank_n, clockVGA,
			  output logic [7:0] red, green, blue);
			  
  logic [21:0] pc, instr, read_data, data_mem_out, data_adr, write_data;  
  logic [7:0] RGB, RGB_out1, RGB_out2;
  logic [17:0] out;
  logic mem_enb, show_enb, mem_read, btn_in, vga_enb, mem_write, counter_out;
  
  assign mem_read = ~instr[20] & instr[19] & instr[16];
  
  data_path CPU(clk, ~reset, instr, read_data, mem_write, pc, data_adr, write_data);  
  instruction_memory im(pc, instr);
  data_memory dm(clk, mem_write & mem_enb, data_adr, write_data, data_mem_out);
  
  flip_flop_D #(1) ff0(clk, ~reset, 1'b1, ~btn, btn_in);
  flip_flop_D #(1) ff1(clk, ~reset, show_enb & mem_write, write_data[0], vga_enb);
  
  io_deco2 deco(data_adr, mem_enb, show_enb);	
  
  mux_2_x_1 #(22) mux0({ 21'b0, btn_in }, data_mem_out, mem_enb & mem_read, read_data);  
    
  RAM ram (out, clk, 8'b0, 1'b1, 1'b0, RGB);
  VGA vga(clk, reset, vga_hs, vga_vs, vga_blank_n, clockVGA, counter_out, out);
  
  mux_2_x_1 #(8) mux1(8'b0, RGB, vga_enb, RGB_out1); 
  mux_2_x_1 #(8) mux2(RGB_out1, 8'b0, counter_out, RGB_out2); 
  
  assign red = RGB_out2;
  assign green = RGB_out2;
  assign blue = RGB_out2;
  
endmodule 