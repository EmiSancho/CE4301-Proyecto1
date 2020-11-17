
module imRAddress4(
		input clk,
		input logic[31:0] imRAactual,
		input logic imRe, //image memory read enable
		output logic[31:0] imRAnext
);
	logic [31:0] aux = 0;
	always@(*)begin
		if(imRe)begin
				aux = imRAactual + 32'b1;
		end
	end
	assign imRAnext = aux;
endmodule 