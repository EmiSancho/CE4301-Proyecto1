module muxRI(
	input logic[2:0] r2,
	input logic[7:0] i2,
	output logic[31:0]B
);
	always@(*)begin 
		if(r2 == 31'b0)begin 
				B = i2;
		end else begin
			B = 31'b0;
			end
	end
	
endmodule