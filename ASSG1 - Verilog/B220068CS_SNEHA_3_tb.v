module B220068CS_SNEHA_3_tb;
	reg[2:0] sw;
	reg clk,reset;
	wire locked,alarm,entimer;
	wire[1:0] selsw;
	B220068CS_SNEHA_3 dut(sw,clk,reset,alarm,locked,entimer, selsw);
	initial begin
		clk=0;
		forever #5 clk=~clk;
	end
	initial #200 $stop;
	initial begin
	reset=0;
		#5 reset=1;
		#5 reset=0;
		sw=0;
		#10 sw=1;
		#10 sw=2;
		#10 sw=3;
		#10 sw=4;
		#110 sw=6;
		#10 reset=1;
		#10 reset=0;sw=5;
	end
endmodule