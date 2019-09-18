module test();

	logic [21:0] direction;
	logic mem_enb, show_enb, show_original_enb, original_enb, process_enb;
	logic [1:0] btn_selecc; 
	
	io_deco DUT(direction, mem_enb, show_enb, show_original_enb, original_enb, process_enb, btn_selecc);
	
   initial begin
		#10 direction = 22'd50;
		#1	$display("direction = %b, mem_enb = %b, show_enb = %b, show_original_enb = %b, original_enb = %b, process_enb = %b, btn_selecc = %b",
						direction, mem_enb, show_enb, show_original_enb, original_enb, process_enb, btn_selecc);
	end

endmodule 