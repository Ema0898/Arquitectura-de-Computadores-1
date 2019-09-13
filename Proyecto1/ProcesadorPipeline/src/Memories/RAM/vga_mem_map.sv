module vga_mem_map(input logic clk, rst, 
						  input logic [9:0] hCounter, vCounter, 
						  output logic [18:0] out);
						  
	logic v_enb, h_enb;
	logic [9:0] ff_v_out, ff_h_out;
	
	assign v_enb = (vCounter < 479);
	assign h_enb = (hCounter < 639);
	
	//flip_flop_D #(10) ff_h(clk, rst, h_enb, hCounter, ff_h_out);
	//flip_flop_D #(10) ff_v(clk, rst, v_enb, vCounter, ff_v_out);
	
	assign out =  hCounter+  (10'b1010000000 * vCounter) + 1'b1; // hCounter + (640 * vCounter) + 1

endmodule 