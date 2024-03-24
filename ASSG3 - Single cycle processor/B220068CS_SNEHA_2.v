module register #(parameter n=16)
	(input clk,read_write, input [15:0] write1, write2, output reg [15:0] read1);
	integer counter;
	reg [15:0] data;
	initial begin
		read1<=0;
		counter=0;
	end
	always @(posedge clk) begin
		if (read_write) begin
			if (counter%2 ==0)
				data<=write1;
			else
				data<=write2;
			counter=counter+1;
		end

		else
			read1<=data;
	end
endmodule


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


