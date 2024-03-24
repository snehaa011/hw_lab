//module register
//	(input clk,read_write, input [15:0] write_port1, output reg [15:0] read_port1);
//	initial read_port1<=0;
//	always @(posedge clk) begin
//		if (read_write)
//			read_port1<=write_port1;
//		else
//			read_port1<=read_port1;
//	end
//endmodule


module register
	(input clk,read_write, input [15:0]write_port1, output reg [15:0] read_port1);
	reg [15:0] data;
	initial begin
		data<=0;
		read_port1<=16'bx;
	end	
	always @(posedge clk) begin
		if (read_write) begin
			data<=write_port1;
		end
		else
			read_port1<=data;
	end
endmodule


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


