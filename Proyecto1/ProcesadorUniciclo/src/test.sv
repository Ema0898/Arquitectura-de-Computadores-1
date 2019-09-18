module test();

	logic [7:0] a, b, s;
	logic cout;
	
	multiplier DUT(a, b, s, cout);
	
   initial begin
		#10 a = 8'd100; b = 8'b11111111;
		#1	$display("a = %b, b = %b, s = %b, cout = %b",
						a, b, s, cout);
	end

endmodule 