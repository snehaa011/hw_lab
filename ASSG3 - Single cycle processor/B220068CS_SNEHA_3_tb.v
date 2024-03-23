module tb;
	parameter n=8;
	reg clk,read,write;
	reg [n-1:0]in;
	wire [n-1:0]out;
	register dut(clk,read,write,in,out);
	initial begin
		clk=0;
		forever #5 clk=!clk;
	end
	initial begin
		read=0; write=1; in=$random;
		#10 read=1;write=0; in=$random;
		#10 read=1;write=1; in=$random;
		#10 read=1;write=0; in=$random;
		#10 read=0;write=1; in=$random;
		#10 read=1;write=0; in=$random;
		#10 $finish;
	end
endmodule
