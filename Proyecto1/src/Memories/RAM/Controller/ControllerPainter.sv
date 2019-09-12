module ControllerPainter (
  input reset,
  input logic [23:0] color,
  output logic [7:0] blue,
  output logic [7:0] green,
  output logic [7:0] red
  );

  always_comb begin
    if(reset) begin
      blue <= 8'd0;
      green <= 8'd0;
      red <= 8'd0;
	 end else begin
      blue <= color[23:16];
      green <= color[15:8];
      red <= color[7:0];
	 end
	end

endmodule