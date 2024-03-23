module regfile (
    input wire clk,
    input wire [2:0] read_port_1,
    input wire [2:0] read_port_2,
    input wire [2:0] write_port_1,
    input wire [7:0] write_data,
    input wire write_enable,
    output reg [7:0] read_data_1,
    output reg [7:0] read_data_2
);

reg [7:0] registers [7:0];

always @(posedge clk) begin
    if (write_enable) begin
        registers[write_port_1] <= write_data;
    end
else begin
    read_data_1 <= registers[read_port_1];
    read_data_2 <= registers[read_port_2];
end
end

endmodule



