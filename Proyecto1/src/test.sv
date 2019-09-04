module test();

	logic [3:0] a, b, c, d;
	logic clk, reset;
	
	flip_flop_D #(8) DUT(clk, reset, 1'b1, {a, b}, {c, d});
	
	initial begin
		assign a = 4'b1111;
		assign b = 4'b0000;
		reset <= 0; #5; reset <= 1; #5 reset <= 0;
	end
	
	// generate clock to sequence tests
	always begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

endmodule 