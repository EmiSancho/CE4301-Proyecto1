module _pc_counter_4(pc, pcnew);
	input logic [7:0] pc;
	output logic [7:0] pcnew;

	assign pcnew = pc + 8'd4 ;

endmodule 