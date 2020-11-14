module _maindeco(ope);
	input logic [5:0] ope;
	output logic typeope; 
	output logic [5:0] control;
	
	always @* begin
		case(ope)
		6'b000000: begin 
							typeope=0;
						end
		6'b000001: begin 
							typeope=0;
						end 
		6'b000010: begin 
							typeope=0;
						end 
		6'b000011: begin 
							typeope=0;
						end 
						
		endcase
	end
	
	


endmodule 