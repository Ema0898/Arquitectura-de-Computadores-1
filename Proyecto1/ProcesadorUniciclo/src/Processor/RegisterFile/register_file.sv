module register_file(input logic clk, rst,
							input logic we3,
							input logic [3:0] ra1, ra2, ra3, ra4,
							input logic [23:0] wd3, r11,
							output logic [23:0] rd1, rd2, rd3);
							
  logic [23:0] rf[10:0];
	
  always_ff @(negedge clk)
	 begin
		if (rst) rf[ra4] <= 'b0;
		else 
			begin
			  if (we3) rf[ra4] <= wd3;
			end		
		end    	 
	 
  assign rd1 = (ra1 == 4'b1011) ? r11 : rf[ra1];
  assign rd2 = (ra2 == 4'b1011) ? r11 : rf[ra2];
  assign rd3 = (ra3 == 4'b1011) ? r11 : rf[ra3];

endmodule 