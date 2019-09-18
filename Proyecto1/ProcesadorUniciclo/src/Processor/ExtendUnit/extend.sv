module extend(input logic [18:0] imm, input logic [1:0] imm_src,
				  output logic [23:0] imm_ext);
				  
  logic [23:0] imm_data_process, imm_memory_address, imm_branch;

  assign imm_data_process[23:7] = 17'b0;
  assign imm_data_process[6:0] = imm[6:0];
  
  assign imm_memory_address[23:7] = 17'b0;
  assign imm_memory_address[6:0] = imm[6:0];
  
  assign imm_branch = {{5{imm[18]}}, imm[18:0]};
  
  mux_4_x_1 #(24) mux0(imm_data_process, imm_memory_address, imm_branch, 24'b0, imm_src, imm_ext);
				 
endmodule 