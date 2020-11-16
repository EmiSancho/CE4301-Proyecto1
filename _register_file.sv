//WE: Write enable
//WD: Write data

module _register_file(input clk, rst, WE3,Rwe2, weIm,
								input [2:0] A1, A2, A3,
								input [31:0] WD3,
								input[7:0] i2,
								input[7:0] imRd,
								output logic [31:0] RD1, RD2,
								output logic[31:0] dmWd, dmWaddress,
							   output logic[31:0] imWd);
								
	logic [31:0] register_file [7:0];
	logic[31:0] aux_rd2;
	muxRI mc(A2,i2,aux_rd2);
	
	always_ff @(posedge clk or posedge rst) begin
		
		if (rst) begin

			register_file[1] <= 0;
			register_file[2] <= 0;
			register_file[3] <= 0;
			register_file[4] <= 0;
			register_file[5] <= 0;
			register_file[6] <= 0;
			register_file[7] <= 0;
	
			
		end else begin

			if (WE3) register_file[A3] <= WD3;
			if (weIm) register_file[A3] <= imRd;
			if (Rwe2) register_file[A3] <= i2;
			end
		end
		
	always_comb begin
			RD1 = register_file[A1];
			RD2 = aux_rd2;
			
			dmWaddress = register_file[A2];
			dmWd = register_file[A1];
			imWd = register_file[A1];
			
			
			if(A2 != 3'b0)begin 
				RD2 = register_file[A2];
			end
	end
	

endmodule 