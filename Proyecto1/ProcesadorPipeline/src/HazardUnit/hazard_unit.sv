module hazard_unit(input logic reg_write_m, reg_write_w, mem_reg_e, branch_taken_e,
						 input logic pc_src_d, pc_src_e, pc_src_m, pc_src_w,
						 input logic [4:0] match,
						 output logic [1:0] forwardAE, forwardBE,
						 output logic stallF, stallD, flushE, flushD);
						 
	logic ldr_stall;
	logic pc_wr_pending_f;
						 
	assign forwardAE[1] = match[4] & reg_write_m;
	assign forwardAE[0] = match[3] & reg_write_w;		

	assign forwardBE[1] = match[2] & reg_write_m;
	assign forwardBE[0] = match[1] & reg_write_w;	
	
	assign ldr_stall = match[0] & mem_reg_e;
	assign pc_wr_pending_f = pc_src_d | pc_src_e | pc_src_m;
	
	assign stallF = ldr_stall | pc_wr_pending_f;
	assign stallD = ldr_stall;
	assign flushE = ldr_stall | branch_taken_e;
	assign flushD = pc_wr_pending_f | pc_src_w | branch_taken_e;

endmodule 