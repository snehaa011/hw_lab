module B220068CS_SNEHA_1_tb;
	reg x,clk,reset;
	wire y;
	B220068CS_SNEHA_1 dut(y, x,clk,reset);
	initial #200 $stop;
	initial begin
	clk=0;
	forever #5 clk=!clk;
	end
	initial
	fork
	reset=1; x=0;
	#2 reset=0;
	#87 reset=1;
	#89 reset=0;
	#10 x=1;
	#30 x=0;
	#40 x=1;
	#50 x=0;
	#60 x=1;
	#64 x=1;
	#70 x=0;
	#80 x=0;
	#90 x=0;
	#100 x=1;
	#120 x=1;
	#160 x=0;
	#170 x=1;
	join
endmodule