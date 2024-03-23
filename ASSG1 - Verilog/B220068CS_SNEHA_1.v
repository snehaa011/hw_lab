module B220068CS_SNEHA_1( output reg y,input x,clk,reset);
	reg [1:0] ps,ns;
	parameter s0=2'b00,s1=2'b01, s2= 2'b10;
	always @ (posedge clk,posedge reset) begin
		if (reset==1) begin
			ps<=s0;
		end
		else
			ps<=ns;
		end
	always @ (ps,x) begin
		case(ps)
		s0:
			if (x) begin
				ns=s1;y=0;
			end
			else begin
				ns=s0; y=0;
			end
		s1:
			if (x) begin
				ns=s1; y=0;
			end
			else begin
				ns=s2;y=0;
			end
		s2:
			if (x) begin
				ns=s1;y=1;
			end
			else begin
				ns=s0; y=0;
			end
		endcase
	end
endmodule
