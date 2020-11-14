module _pc_counter_4(pc, pcnew);
	input logic [31:0] pc;
	output logic [31:0] pcnew;

	assign pcnew = pc + 32'd4 ;

endmodule 