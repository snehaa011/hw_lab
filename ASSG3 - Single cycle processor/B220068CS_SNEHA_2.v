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


