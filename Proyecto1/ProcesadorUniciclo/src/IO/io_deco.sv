module io_deco(input logic [23:0] direction, 
					output logic mem_enb, show_enb, show_original_enb, original_enb, process_enb,
					output logic [1:0] btn_selecc);

  logic mem_condition, show_condition, show_original_condition, original_condition, process_condition;   
  
  //assign show_condition = (direction > 100);
  
  assign mem_condition = (direction <= 96);
  assign show_original_condition = (direction == 100);
  assign show_condition = (direction == 116);
  assign original_condition = (direction >= 120 & direction < 160120);
  assign process_condition = (direction >= 160120 & direction <= 320120);
  
  mux_2_x_1 #(1) mux0(1'b0, 1'b1, mem_condition, mem_enb);
  mux_2_x_1 #(1) mux1(1'b0, 1'b1, show_condition, show_enb);  
  mux_2_x_1 #(1) mux2(1'b0, 1'b1, show_original_condition, show_original_enb);
  mux_2_x_1 #(1) mux3(1'b0, 1'b1, original_condition, original_enb);
  mux_2_x_1 #(1) mux4(1'b0, 1'b1, process_condition, process_enb);
  
  deco_buttons deco_btn(direction[6:0], btn_selecc);

endmodule 