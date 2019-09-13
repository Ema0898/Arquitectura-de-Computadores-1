module alu_test();

	logic[7:0] A, B, Z;
	logic [3:0] flags;
	logic [1:0] s;

	ALU #(8) DUT(A, B, s, Z, flags);

	initial begin
		#10 A = 'b011111111; B = 'b000000001; s = 'b01; 
		#1	$display("A = %b, B = %b, s = %b, Z = %b, flags = %b", A, B, s, Z, flags);
	end 


endmodule 