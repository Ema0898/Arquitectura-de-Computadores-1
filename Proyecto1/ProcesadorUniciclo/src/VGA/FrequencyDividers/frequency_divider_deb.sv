module frequency_divider_deb
	(input logic clk, reset, output logic clk_out);	

	logic [27:0] counter;

	always_ff @(posedge clk, posedge reset)
		begin
			if(reset)
				begin
					counter <= 28'd0;
					clk_out <= 1'b0;
				end
			else if(counter == 28'd25000000)
				begin
					counter <= 28'd0;
					clk_out <= ~clk_out;
				end
			else
				begin
					counter <= counter + 1;
				end
		end

endmodule