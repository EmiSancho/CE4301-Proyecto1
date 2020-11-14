module _mux_2_1_a#(parameter size = 32)(input [size-1:0] in_0, in_1, input sel, output logic [size-1:0] mux_out);

	always_comb
	case(sel)
		1'b0: mux_out = in_0;
		1'b1: mux_out = in_1;
		default: mux_out = in_0;
	endcase

endmodule 