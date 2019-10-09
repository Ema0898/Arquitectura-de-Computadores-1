module io_deco2(input logic [23:0] direction, 
					output logic mem_enb, show_enb, original_enb, process_enb);

  logic mem_condition, show_condition, original_condition, process_condition;   
  
  //assign show_condition = (direction > 100);
  
  assign mem_condition = (direction <= 96);
<<<<<<< HEAD
  assign show_condition = (direction > 100);
=======
  assign show_condition = (direction <= 116);
>>>>>>> c9ba90840e60ad14c5f5ff539c15feeba067e3e4
  assign original_condition = (direction >= 120 & direction < 130);
  assign process_condition = (direction >= 130 & direction <= 140);
  
  mux_2_x_1 #(1) mux0(1'b0, 1'b1, mem_condition, mem_enb);
  mux_2_x_1 #(1) mux1(1'b0, 1'b1, show_condition, show_enb);  
  mux_2_x_1 #(1) mux3(1'b0, 1'b1, original_condition, original_enb);
  mux_2_x_1 #(1) mux4(1'b0, 1'b1, process_condition, process_enb);

endmodule 