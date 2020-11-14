module bor #(parameter WIDTH = 32)(
					input [WIDTH-1:0] A,
					input [WIDTH-1:0] B,
					
					output S);
					
					always @ (A or B) begin 
					if (A == 1'b0 & B == 1'b0) 
						begin
						S = 1'b0; 
						end 
					else 
						begin
						S = 1'b1;
						end
				
endmodule 