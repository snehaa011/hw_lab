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

