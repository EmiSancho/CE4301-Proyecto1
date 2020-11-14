module muxControl(
		input logic [31:0]instruccion,
		output logic [5:0]AluControl,
		output logic [2:0]R1,
		output logic [2:0]R2,
		output logic [2:0]RDestino,
		output logic [7:0] i1,//inmediatos
		output logic [7:0] i2 //inmediatos
		);
		
		always@(*)begin
			AluControl =  instruccion[31:26];
			RDestino = instruccion[24:22];
			R1 = instruccion[21:19];
			R2 = instruccion[18:16];
			i1 = instruccion[15:8];
			i2 = instruccion[7:0];
		end
		
endmodule