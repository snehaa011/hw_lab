module B220068CS_SNEHA_2_tb;
reg [7:0]x,y;
wire [7:0]diff;
wire borrow;

B220068CS_SNEHA_2 test(x,y,diff,borrow);

integer count;
initial begin
for(count=0;count<65536;count=count+1) begin
{x,y}=count;
#20;
end
end

endmodule