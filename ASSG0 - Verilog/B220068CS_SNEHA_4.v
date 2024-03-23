module B220068CS_SNEHA_4(input [7:0]d,input en, reset,output reg [7:0]q,qbar);
	always@(*) begin
	if (reset==0) begin
	q<='d0;
	qbar<=8'b11111111;
	end
	else if(en==1) begin
	q <= d;
	qbar =~q;
	end
	end
endmodule
