module cond_logic2(input logic clk, reset,
							input logic pc_src, reg_write, mem_write, no_write, 
							input logic [2:0] cond,
							input logic flag_write,
							input logic [3:0] alu_flags, 
							input logic branch_e,
							output logic pc_src_p, reg_write_p, mem_write_p, branch_taken);
							
  logic flag_write_p;
  logic flag_zero;
  logic cond_ex;
  
  //flip_flop_D_neg #(1) ff0(clk, reset, flag_write_p, alu_flag_zero, flag_zero);
  
  cond_check2 cc(cond, alu_flags, cond_ex);
  
  assign flag_write_p = flag_write & cond_ex;
  assign reg_write_p = reg_write & cond_ex & ~no_write;
  assign mem_write_p = mem_write & cond_ex;
  assign pc_src_p = pc_src & cond_ex;
  assign branch_taken = branch_e & cond_ex;
							
endmodule 