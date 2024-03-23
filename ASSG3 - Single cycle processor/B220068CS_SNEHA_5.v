module regfile (
    input wire clk,
    input wire [4:0] read_port1,
    input wire [4:0] read_port2,
	 input wire [4:0] read_port3,
    input wire [4:0] read_port4,
    input wire [4:0] write_port1,
	 input wire [4:0] write_port2,
    input wire [63:0] write_data1,
	 input wire [63:0] write_data2,
    input wire write, read,
    output reg [63:0] read_data1,
    output reg [63:0] read_data2,
	 output reg [63:0] read_data3,
	 output reg [63:0] read_data4
);

reg [63:0] registers [31:0]; // 64 bit registers of depth 32 ( 32 rows )

reg [63:0] temp1,temp2;

always @(posedge clk) begin
    if (write) begin
			registers[write_port2] = write_data2;
         registers[write_port1] = write_data1;
    end
	if (read) begin
		read_data4 <= registers[read_port4];
		read_data3 <= registers[read_port3];
		read_data2 <= registers[read_port2];
		read_data1 <= registers[read_port1];
	end
end

endmodule



