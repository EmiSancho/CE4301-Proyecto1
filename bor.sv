module bor #(parameter WIDTH = 32)(
					input logic[WIDTH-1:0] A,
					input logic[WIDTH-1:0] B,
					
					output logic[WIDTH-1:0] S);
					
					assign S = A | B;
endmodule 