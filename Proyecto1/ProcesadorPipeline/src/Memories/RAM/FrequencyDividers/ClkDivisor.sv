module ClkDivisor(
	input logic clock,
	output logic clk25Mhz
	);

 logic counter;
 
always @(posedge clock) 
	begin
		if(counter == 0)
			begin
				clk25Mhz = 1;
				counter <= 1;
			end
		
		else 
			begin
				clk25Mhz = 0;
				counter <=0;
			end
	end
  
endmodule 