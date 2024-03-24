module register #(parameter n=8)
	(input clk,read,write, input [n-1:0] write1, output reg [n-1:0] read1);
	reg [n-1:0] data;
	initial data<=0;
	always @(posedge clk) begin
		if (read && write) begin
			
			read1<=write1;
		end
		if (write)
			data<=write1;
		else if (read)
			read1<=data;
		
	end
endmodule


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

