	
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
	logic[n-1:0] r_suma; adder_substractor #(n) sumador(A,B,0,r_suma,AuxNs,AuxZs,AuxVs,AuxCs); //0000 - suma
	logic[n-1:0] r_resta; adder_substractor #(n) restador(A,B,1,r_resta,AuxNr,AuxZr,AuxVr,AuxCr); //0001 - resta
	logic[n-1:0] r_div; division#(n) myDiv(A,B, r_div);
	logic[n-1:0] r_or; bor#(n) myOr(A,B, r_or);
	logic[n-1:0] r_and; band#(n) myband(A,B, r_and);
	logic[n-1:0] r_mult; mult#(n) myMulti(A,B, r_mult);
	
	always @* begin
		case(control)
		6'b000001: begin AUXresult <= r_suma; auxN <= AuxNs; auxZ <= AuxZs; auxC <= AuxCs; auxV <= AuxVs; end //suma
		6'b000010: begin AUXresult <= r_resta; auxC <= AuxCr; auxN <= AuxNr; auxZ <= AuxZr; auxV <= AuxVr; end //resta
		6'b000100: begin AUXresult <= r_div; end// division
		6'b000101: begin AUXresult <= r_mult; end // multiplicacion
		6'b000110: begin AUXresult <= r_and; end // AND
		6'b000111: begin AUXresult <= r_or; end // OR
		
		default: AUXresult <= 0;
		endcase
	end

	assign N = auxN;
	assign Z = auxZ;
	assign C = auxC;
	assign V = auxV;

	assign salida = AUXresult;

endmodule
