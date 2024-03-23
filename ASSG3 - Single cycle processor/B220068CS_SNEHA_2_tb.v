module tb;

	reg clk,rw;
	reg [15:0]w1,w2;
	wire [15:0]r1;
	register dut(clk,rw,w1,w2,r1);
	initial begin
		clk=0;
		forever #5 clk=!clk;
	end

	initial begin
		rw=1; w1=$random; w2=$random;
		#10 rw=0; w1=$random; w2=$random;
		#10 rw=1; w1=$random; w2=$random;
		#10 rw=0; w1=$random; w2=$random;
		#10 rw=1; w1=$random; w2=$random;
		#10 rw=0; w1=$random; w2=$random;
		#10 rw=1; w1=$random; w2=$random;
		#10 rw=0; w1=$random; w2=$random;
		#10 rw=1; w1=$random; w2=$random;
		#10 $finish;
	end
endmodule
