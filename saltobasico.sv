module saltobasico(input logic [7:0] etq, 
						 output logic [7:0] pc);
						 
	logic [7:0] aux_pc;
	
	// main 		04 - 00000100
	// loop 		16 - 00010000
	// suma 		56 - 00111000
	// sumaaux 	80 - 01010000
	// done 		112- 01110000
	// exit 		128- 10000000
	
	always @(*) begin
		case (etq)
			8'b00000100 : begin //main
									aux_pc = 8'b00000100;
							end
			8'b00010000 : begin //loop
									aux_pc = 8'b00010000;
							end
			8'b00111000 : begin //suma
									aux_pc = 8'b00111000;
							end
			8'b01010000 : begin //sumaaux
									aux_pc = 8'b01010000;
							end
			8'b01110000 : begin //done
									aux_pc = 8'b01110000;
							end
			8'b10000000 : begin //exit
									aux_pc = 8'b10000000;
							end
			
			//default: aux_alu_control = 6'b000000;
		endcase
	end
	assign pc = aux_pc;
endmodule  