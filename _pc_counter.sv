module _pc_counter(clk, rst,s,se,slt,sle,sgt,sge,sle2,sle3,sle4,sle5,sle6,sle7,sle8, next, actual);
	input clk, rst,s,se,slt,sle,sgt,sge,sle2,sle3,sle4,sle5,sle6,sle7,sle8;
	input [7:0] next;
	output logic [7:0] actual;
	
	always_ff @(negedge clk or posedge rst) begin
		if (rst) actual = 0;
		else if (s) actual = 8'b10010110; //150
		else if (slt) actual = 8'b10010100; //148
		else if (sle) actual = 8'b00001000 ; //8
		else if (sge) actual =  8'b10010000;//144
		else if (sle2) actual = 8'b00011000;//24
		else if (sle3) actual = 8'b00110000;//48
		else if (sle4) actual = 8'b01001100;//76
		else if (sle5) actual = 8'b01100010;//98
		else if (sle6) actual = 8'b10001010;//138
		else if (sle7) actual = 8'b10000010;//130
		else if (sle8) actual = 8'b10111000;//184
		else actual = next;
	end
endmodule 