module B220068CS_SNEHA_2(input [7:0]x,y, output reg [7:0]diff,output reg borrow);
always @(*) begin
	{borrow,diff}=x-y;
end
endmodule
