module B220068CS_SNEHA_4_tb;
reg [7:0]D;
reg en, reset;
wire [7:0] Q, QBAR;
B220068CS_SNEHA_4 dut(D,en,reset,Q,QBAR);

initial begin
reset=0; en=1;
#100 reset=1;D=$random;
#100 D=$random;
#100 en=0;D=$random;
#100 reset=0;D=$random;
#100 reset=1;D=$random;
#100 en=1;D=$random;
end
endmodule