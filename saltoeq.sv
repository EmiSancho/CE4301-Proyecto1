module saltoeq(input logic [7:0] etq, 
					input logic [2:0] r1,
					input logic [2:0] r2,
					input logic [7:0] inm1,
					output logic senable, //Bandera de salto activado
					output logic [7:0] pc);
						 
	logic [7:0] aux_pc;
	logic [7:0] aux_ope2;
	
	// main 		04 - 00000100
	// loop 		16 - 00010000
	// suma 		56 - 00111000
	// sumaaux 	80 - 01010000
	// done 		112- 01110000
	// exit 		128- 10000000
	
	always @( * ) begin
	  if (r2 == 3'b0)
		 begin
			aux_ope2 <= inm1;
		 end
	  else
		 begin
			aux_ope2 <= r2;
		 end
	end
	
	always @( * ) begin
	  if (r1 == aux_ope2)
		 begin
			pc <= etq;
			senable = 1'b1;
		 end
	  else
		 begin
			senable = 1'b0;
		 end
	end
	
endmodule 