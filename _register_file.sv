//WE: Write enable
//WD: Write data

module _register_file(input clk, WE3,Rwe2,
								input [2:0] A1, A2, A3,
								input [31:0] WD3,
								input rst,
								input[7:0] i2,
								output logic [31:0] RD1, RD2);
								
	logic [63:0] register_file [31:0];
	logic[31:0] aux_rd2;
	muxRI mc(A2,i2,aux_rd2);
	
	always_ff @(posedge clk or posedge rst) begin
		
		if (rst) begin
//			register_file[0] <= 0;
			register_file[1] <= 0;
			register_file[2] <= 0;
			register_file[3] <= 0;
			register_file[4] <= 0;
			register_file[5] <= 0;
			register_file[6] <= 0;
//			register_file[7] <= 0;
//			register_file[8] <= 0;
//			register_file[9] <= 0;
//			register_file[10] <= 0;
//			register_file[11] <= 0;
//			register_file[12] <= 0;
//			register_file[13] <= 0;
//			register_file[14] <= 0;
//			register_file[15] <= 0;
		end else begin

			if (WE3) register_file[A3] <= WD3;
			
			if (Rwe2) register_file[A3] <= i2;
			end
		end
		
	always_comb begin
			RD1 = register_file[A1];
			RD2 = aux_rd2;
			if(A2 != 3'b0)begin 
				RD2 = register_file[A2];
			end
	end
	

endmodule 