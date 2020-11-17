module image_procesada_memory(input logic CLK, WE,
						input [31:0] wA,
						input [7:0] WD,
						output logic [7:0]  RD);
						
	logic [7:0] memory [152099:0];
	//WE Write Enable
	
	assign RD = memory[wA[7:0]];
		// Verificar implementación de memoria.
	initial begin
	$readmemh("C:/Users/emily/Desktop/CE4301-Proyecto1/imagenProcesada.img", memory);	
	end

	
	always_ff @(posedge CLK) 
	begin
		if(WE)	memory[wA[7:0]] <= WD;
		$writememh("C:/Users/emily/Desktop/CE4301-Proyecto1/imagenProcesada.img", memory);
	end
	
endmodule
