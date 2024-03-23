module B220068CS_SNEHA_2_tb;
	reg clk;
	wire ns,ew;
	B220068CS_SNEHA_2 dut(ns,ew,clk);
	initial #200 $stop;
	initial begin
	clk=1;
	forever #5 clk=!clk;
	end
endmodule
