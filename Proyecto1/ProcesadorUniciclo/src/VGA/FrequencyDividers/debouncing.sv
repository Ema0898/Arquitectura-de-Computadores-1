module debouncing(input logic clock, pushb, output logic q);

	logic q1, q2;
	
	flip_flop_D #(1) ffD1(clock, 1'b0, 1'b1, pushb, q1);
	flip_flop_D #(1) ffD2(clock, 1'b0, 1'b1, q1, q2);
	
	assign q = q1 & q2;	
	
endmodule 