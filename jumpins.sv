module jumpins#(parameter n=32)(input logic [n-1:0] instruccion, 
										  output logic senable, //Bandera de salto activado
										  output logic [7:0] pc);
					
	logic[5:0] aux_operacion;
	logic[2:0] aux_destino;
	logic[2:0] aux_r1;
	logic[2:0] aux_r2;
	logic[7:0] aux_inmediato;
	logic[7:0] aux_etiqueta;
	logic[7:0] aux_pc, aux_pc_s, aux_pc_seq, aux_pc_slt, aux_pc_sle, aux_pc_sgt, aux_pc_sge;
	logic aux_senable, aux_senable_seq, aux_senable_slt, aux_senable_sle, aux_senable_sgt, aux_senable_sge;
	
	// main 		04 - 00000100
	// loop 		16 - 00010000
	// suma 		56 - 00111000
	// sumaaux 	80 - 01010000
	// done 		112- 01110000
	// exit 		128- 10000000
	
	muxControl mc(instruccion, aux_operacion, aux_r1,aux_r2,aux_destino,aux_inmediato,aux_etiqueta);
	
	logic[n-1:0] r_s; saltobasico s(aux_etiqueta, aux_pc_s);
	logic[n-1:0] r_seq; saltoeq seq(aux_etiqueta, aux_r1, aux_r2, aux_inmediato, aux_senable_seq, aux_pc_seq);
	logic[n-1:0] r_slt; saltoslt slt(aux_etiqueta, aux_r1, aux_r2, aux_inmediato, aux_senable_slt, aux_pc_slt);
	logic[n-1:0] r_sle; saltosle sle(aux_etiqueta, aux_r1, aux_r2, aux_inmediato, aux_senable_sle, aux_pc_sle);
	logic[n-1:0] r_sgt; saltosgt sgt(aux_etiqueta, aux_r1, aux_r2, aux_inmediato, aux_senable_sgt, aux_pc_sgt);
	logic[n-1:0] r_sge; saltosge sge(aux_etiqueta, aux_r1, aux_r2, aux_inmediato, aux_senable_sge, aux_pc_sge);
	
	
	always @(*) begin
		case (aux_operacion)
			6'b001100 : begin  //S
									aux_senable = 1'b1;
									aux_pc <= aux_pc_s;
							end
						
			6'b001101 : begin  //SEQ
									aux_senable <= aux_senable_seq;
									aux_pc <= aux_pc_seq;
							end
							
			6'b001110 : begin //SLT 
									aux_senable <= aux_senable_slt;
									aux_pc <= aux_pc_slt;
							end
							
			6'b001111 : begin //SLE
									aux_senable <= aux_senable_sle;
									aux_pc <= aux_pc_sle;
							end	
			
			6'b010000 : begin //SGT
									aux_senable <= aux_senable_sgt;
									aux_pc <= aux_pc_sgt;
							end
							
			6'b010001 : begin //SGE
									aux_senable <= aux_senable_sge;
									aux_pc <= aux_pc_sge;
							end
			
			default: aux_senable  = 1'b0;				
			
		endcase
						  
	end
	
	assign pc = aux_pc;
	assign senable = aux_senable;

endmodule 