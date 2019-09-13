module flip_flop_D	
	#(parameter N = 20)
	(input logic clk, reset, enb, input logic [N-1:0] d, output logic [N-1:0] q);
	
	always_ff @(posedge clk)
		begin
		if (reset) q <= 'b0;
		else if (enb) q <= d;	
		end

endmodule
