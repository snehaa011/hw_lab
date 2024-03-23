//module tb;
//
//	reg clk,rw;
//	reg [15:0]di;
//	wire [15:0]out;
//	register dut(clk,rw,di,out);
//	initial begin
//		clk=0;
//		forever #5 clk=!clk;
//	end
//	initial begin
//		rw=1; di=$random;
//		#10 rw=0; di=$random;
//		#10 rw=1; di=$random;
//		#10 rw=0; di=$random;
//		#10 rw=1; di=$random;
//		#10 $finish;
//	end
//endmodule


module tb;

	reg clk,rw;
	reg [15:0]write;
	wire [15:0]read;
	register dut(clk,rw,write,read);
	initial begin
		clk=0;
		forever #5 clk=!clk;
	end
	initial begin
		rw=1; write=$random;
		#10 rw=0; write=$random;
		#10 rw=1; write=$random;
		#10 rw=0; write=$random;
		#10 rw=1; write=$random;
		#20 $finish;
	end
endmodule