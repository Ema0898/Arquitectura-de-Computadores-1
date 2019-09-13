module processor_test();

  logic clk, reset, mem_write;
  logic [21:0] write_data, data_adr;
  
  processor_memories DUT(clk, reset, mem_write, write_data, data_adr);
  
  initial begin
		reset <= 0; #5; reset <= 1; #5 reset <= 0;
	end
	
	// generate clock to sequence tests
	always begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

endmodule 