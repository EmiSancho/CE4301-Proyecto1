module _pc_counter(clk, rst, next, actual);
	input clk, rst;
	input [7:0] next;
	output logic [7:0] actual;
	
	always_ff @(negedge clk or posedge rst)
		if (rst) actual = 0;
		else actual = next;
	
endmodule 