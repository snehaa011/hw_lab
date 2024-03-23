module B220068CS_SNEHA_1_tb;
reg [7:0]x,y;
wire [7:0]sum;
wire carry;

B220068CS_SNEHA_1 test(x,y,sum,carry);

integer count;
initial begin
for(count=0;count<65536;count=count+1) begin
{x,y}=count;
#20;
end
end

endmodule