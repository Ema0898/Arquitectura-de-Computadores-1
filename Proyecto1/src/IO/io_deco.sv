module io_deco(input logic [21:0] direction, output logic mem_enb, img_enb);

  logic mem_condition, img_condition;
  assign mem_condition = (direction <= 50);
  assign img_condition = (direction >= 51);
  
  mux_2_x_1 #(1) mux0(1'b0, 1'b1, mem_condition, mem_enb);
  mux_2_x_1 #(1) mux1(1'b0, 1'b1, img_condition, img_enb);  

endmodule 