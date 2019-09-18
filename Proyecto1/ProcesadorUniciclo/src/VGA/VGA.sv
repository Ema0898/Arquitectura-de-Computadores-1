module VGA (input clk, reset,
       	   output logic vga_hs, vga_vs, vga_blank_n, clockVGA, counter_out,
				output logic [17:0] out);
    
	logic [9:0] hCounter, vCounter;	
	logic refreshDraw, d_reset;
	logic counter_outX, counter_outY;
	assign counter_outX = (hCounter >= 400);
	assign counter_outY = (vCounter >= 400);
	assign counter_out = counter_outX | counter_outY;
	 
	assign d_reset = ~reset;
	     
  ClkDivisor VGAClkDivisor(clk, clockVGA);		     
  ControllerSync VGASync(clockVGA, d_reset, vga_hs, vga_vs, hCounter, vCounter, vga_blank_n, refreshDraw);	
  vga_mem_map map(hCounter, vCounter, out);	
    
endmodule 
