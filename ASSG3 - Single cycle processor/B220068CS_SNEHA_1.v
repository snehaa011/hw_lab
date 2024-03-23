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





