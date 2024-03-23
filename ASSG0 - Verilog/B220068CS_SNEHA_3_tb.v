module B220068CS_SNEHA_3_tb;
reg [7:0]a,b;
reg[1:0]s;
wire [7:0]result;

B220068CS_SNEHA_3 test(a,b,s,result);

integer count;
initial begin
for (count=0;count<4;count=count+1) begin
s=count;
a=$random;
b=$random;
#20;
end
end
endmodule