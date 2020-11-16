	
/**
	Unidad logica aritmetrica
*/
module alu #(parameter n=32)(
	input logic[n-1:0] A,B,
	input logic[5:0] control,
	input logic[31:0] dmRd,
	input logic[31:0] imRd,
	output[n-1:0] salida
);
 

	logic[n-1:0] AUXresult;

	// Códigos de la señal de control
//	logic[n-1:0] r_suma; adder_substractor #(n) sumador(A,B,0,r_suma); //0000 - suma
//	logic[n-1:0] r_resta; adder_substractor #(n) restador(A,B,1,r_resta); //0001 - resta
	logic[n-1:0] r_div; division#(n) myDiv(A,B, r_div);
	logic[n-1:0] r_or; bor#(n) myOr(A,B, r_or);
	logic[n-1:0] r_and; band#(n) myband(A,B, r_and);
	logic[n-1:0] r_mult; mult#(n) myMulti(A,B, r_mult);
	
	always @* begin
		case(control)
		6'b000001: begin AUXresult <= A + B;  end //suma
		6'b000010: begin AUXresult <= A - B; end //resta
		6'b000100: begin AUXresult <= r_div; end// division
		6'b000101: begin AUXresult <= r_mult; end // multiplicacion
		6'b000110: begin AUXresult <= r_and; end // AND
		6'b000111: begin AUXresult <= r_or; end // OR
		6'b001001: begin AUXresult <= 31'b0 + dmRd; end // LDR desde la memoria de datos
		6'b001011: begin AUXresult <= 31'b0 + imRd; end // LDR desde la imagen cruda
		default: AUXresult <= 0;
		endcase
	end

	assign salida = AUXresult;

endmodule
