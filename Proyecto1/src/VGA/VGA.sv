module VGA (input clk, reset,
		      input logic [9:0] posX, posY,
       	   output logic vga_hs, vga_vs, vga_blank_n, clockVGA, 
	   		output logic [7:0] red, green, blue);
    
	logic [9:0] hCounter, vCounter;	  
	logic [23:0] RGB;
	logic [1:0] s;
	logic refreshDraw, low_clock, d_reset;	 
	 
	assign d_reset = ~reset;
	     
  ClkDivisor VGAClkDivisor(clk, clockVGA);
  frequency_divider_paint divider(clk, d_reset, low_clock);
		     
  ControllerSync VGASync(clockVGA, d_reset, vga_hs, vga_vs, hCounter, vCounter, vga_blank_n, refreshDraw);
		
  animation anm(low_clock, d_reset, refreshDraw, s);

  PixelGenerator pixel(posY, posX, vCounter, hCounter, RGB);		  
	 	
  assign red = RGB[23:16];
  assign green = RGB[15:8];
  assign blue = RGB[7:0];
    
endmodule 
