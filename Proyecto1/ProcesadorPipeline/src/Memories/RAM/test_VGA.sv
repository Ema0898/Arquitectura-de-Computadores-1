module test_VGA ();

	logic clk, reset;
	logic [9:0] vCounter, hCounter;
	logic [18:0] out;

	vga_mem_map DUT(clk, reset, hCounter, vCounter, out);
	
	 initial begin
		reset <= 0; #5; reset <= 1; #5 reset <= 0;#5 hCounter <= 10'b0;#5 vCounter <= 10'd300;
	end
	
	// generate clock to sequence tests
	always begin
		clk <= 1; hCounter <= hCounter + 1; # 5; clk <= 0; # 5;
		
	end


	


endmodule
