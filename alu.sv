	
/**
	Unidad logica aritmetrica
*/
module alu #(parameter n=32)(
	input logic[n-1:0] A,B,
	input logic[5:0] control,
	output N,Z,C,V, // Negativo, Cero, Carry, Desbordamiento
	output[n-1:0] salida
);
 

	logic[n-1:0] AUXresult;
	logic AuxCs, AuxNs, AuxZs, AuxVs;
	logic AuxCr, AuxNr, AuxZr, AuxVr;
	logic auxN, auxZ, auxC,auxV;

	// Códigos de la señal de control
	logic[n-1:0] r_suma; adder_substractor #(n) sumador(A,B,r_suma,0,AuxCs, AuxNs, AuxZs, AuxVs); //0000 - suma
	logic[n-1:0] r_resta; adder_substractor #(n) restador(A,B,r_resta,1,AuxCr, AuxNr, AuxZr, AuxVr); //0001 - resta
	
	always @* begin
		case(control)
		6'b000001: begin AUXresult <= r_suma; auxN <= AuxNs; auxZ <= AuxZs; auxC <= AuxCs; auxV <= AuxVs; end
		6'b000010: begin AUXresult <= r_resta; auxC <= AuxCr; auxN <= AuxNr; auxZ <= AuxZr; auxV <= AuxVr; end 
		
		default: AUXresult <= 0;
		endcase
	end

	assign N = auxN;
	assign Z = auxZ;
	assign C = auxC;
	assign V = auxV;

	assign salida = AUXresult;

endmodule
