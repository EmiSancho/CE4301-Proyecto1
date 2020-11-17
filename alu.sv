	
/**
	Unidad logica aritmetrica
*/
module alu #(parameter n=32)(
	input logic[n-1:0] A,B,
	input logic[5:0] control,
	output[n-1:0] salida,
	output se,seqe,slte,slee,sgte,sgee,sle2,sle3,sle4,sle5,sle6,sle7,sle8
);
 

	logic[n-1:0] AUXresult;

	// Códigos de la señal de control
//	logic[n-1:0] r_suma; adder_substractor #(n) sumador(A,B,0,r_suma); //0000 - suma
//	logic[n-1:0] r_resta; adder_substractor #(n) restador(A,B,1,r_resta); //0001 - resta
	logic[n-1:0] r_div; division#(n) myDiv(A,B, r_div);
	logic[n-1:0] r_or; bor#(n) myOr(A,B, r_or);
	logic[n-1:0] r_and; band#(n) myband(A,B, r_and);
	logic[n-1:0] r_mult; mult#(n) myMulti(A,B, r_mult);
	
	logic aux_s = 0;
	logic aux_seq = 0;
	logic aux_slt = 0;
	logic aux_sle = 0;
	logic aux_sgt = 0;
	logic aux_sge = 0;
	
	logic aux_sle2 = 0;
	logic aux_sle3 = 0;
	logic aux_sle4 = 0;
	logic aux_sle5 = 0;
	logic aux_sle6 = 0;
	logic aux_sle7 = 0;
	logic aux_sle8 = 0;
	
	
	always @* begin
		case(control)
		6'b000000: begin AUXresult <= 0; 
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0; 
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0; 	end //default
								
		6'b000001: begin AUXresult <= A + B; 
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0; 
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0; 	end //suma
		
		6'b000010: begin AUXresult <= A - B; 
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0; end //resta
								
		6'b000100: begin AUXresult <= r_div; 
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0; end// division
								
		6'b000101: begin AUXresult <= r_mult; 
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0; 
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0; end // multiplicacion
								
		6'b000110: begin AUXresult <= r_and;
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0; end // AND
								
		6'b000111: begin AUXresult <= r_or; 
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;	end // OR
		
		6'b001100: begin AUXresult	<=0;	
								aux_s=1;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;	end	//S	
							
						
						
			6'b001101 : begin AUXresult <=0;	
								aux_s=0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A == B)begin
									aux_seq = 1;
								end
							end				//SEQ
							
			6'b001110 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A < B)begin
									aux_slt = 1;
								end
							end					//SLT
							
			6'b001111 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sgt = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A <= B)begin
									aux_sle = 1;
								end	
							end			//SLE	
			
			6'b010000 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sge = 0; 
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A > B)begin
									aux_sgt = 1;
								end	
							end	//SGT
							
			6'b010001 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sle = 0;
								aux_sgt = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A >= B)begin
									aux_sge = 1;
								end
							end	//SGE
							
			6'b010010 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;								
							
								if(A <= B)begin
									aux_sle2 = 1;
								end	
							end			//SLE2
							
			6'b010011 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle = 0;
								aux_sle2 = 0;	
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A <= B)begin
									aux_sle3 = 1;
								end	
							end			//SLE3
			
			6'b010100 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A <= B)begin
									aux_sle4 = 1;
								end	
							end			//SLE4

			6'b010101 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A <= B)begin
									aux_sle5 = 1;
								end	
							end			//SLE5
							
			6'b010110 : begin AUXresult <=0;	
								aux_s=0;
								aux_seq = 0;
								aux_slt = 0;
								aux_sgt = 0;
								aux_sge = 0;
								aux_sle = 0;
								aux_sle2 = 0;
								aux_sle3 = 0;
								aux_sle4 = 0;
								aux_sle5 = 0;
								aux_sle6 = 0;
								aux_sle7 = 0;
								aux_sle8 = 0;
								
								if(A <= B)begin
									aux_sle6 = 1;
								end	
							end			//SLE6				
			
			6'b010111 : begin AUXresult <=0;	
									aux_s=0;
									aux_seq = 0;
									aux_slt = 0;
									aux_sgt = 0;
									aux_sge = 0;
									aux_sle = 0;
									aux_sle2 = 0;
									aux_sle3 = 0;
									aux_sle4 = 0;
									aux_sle5 = 0;
									aux_sle6 = 0;
									aux_sle7 = 0;
									aux_sle8 = 0;									
									if(A <= B)begin
										aux_sle7 = 1;
									end	
							end			//SLE7
				
			6'b011000 : begin AUXresult <=0;	
									aux_s=0;
									aux_seq = 0;
									aux_slt = 0;
									aux_sgt = 0;
									aux_sge = 0;
									aux_sle = 0;
									aux_sle2 = 0;
									aux_sle3 = 0;
									aux_sle4 = 0;
									aux_sle5 = 0;
									aux_sle6 = 0;
									aux_sle7 = 0;
									aux_sle8 = 0;	
									if(A <= B)begin
										aux_sle8 = 1;
									end	
							end			//SLE8
							
		default: AUXresult <= 0;
		endcase
	end

	assign salida = AUXresult;
	assign se = aux_s;
	assign seqe = aux_seq;
	assign slte = aux_slt;
   assign slee = aux_sle;
	assign sgte = aux_sgt;
	assign sgee = aux_sge;
	assign sle2 = aux_sle2;
	assign sle3 = aux_sle3;
	assign sle4 = aux_sle4;
	assign sle5 = aux_sle5;
	assign sle6 = aux_sle6;
	assign sle7 = aux_sle7;
	assign sle8 = aux_sle8;

endmodule
