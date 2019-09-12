module VGA (input clk, reset,
       	   output logic vga_hs, vga_vs, vga_blank_n, clockVGA, 
	   		output logic [7:0] red, green, blue);
    
	logic [9:0] hCounter, vCounter;	  
	logic [7:0] RGB;
	logic [18:0] out;

	logic refreshDraw, low_clock, d_reset;	 
	 
	assign d_reset = ~reset;
	     
  ClkDivisor VGAClkDivisor(clk, clockVGA);
 
		     
  ControllerSync VGASync(clockVGA, d_reset, vga_hs, vga_vs, hCounter, vCounter, vga_blank_n, refreshDraw);
		  
  vga_mem_map map(clk,reset,hCounter,vCounter,out);	
  RAM ram (out,clk,8'b0,1'b1,1'b0,RGB);

  assign red = RGB;
  assign green = RGB;
  assign blue = RGB;
  
  
    
endmodule 
