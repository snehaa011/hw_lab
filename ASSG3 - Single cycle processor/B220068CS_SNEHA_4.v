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


module tb;

reg clk;
reg [2:0] read_port_1, read_port_2, write_port_1;
reg [7:0] write_data;
reg write_enable;
wire [7:0] read_data_1, read_data_2;

regfile dut ( clk, read_port_1, read_port_2, write_port_1, write_data, write_enable, read_data_1, read_data_2 );
    
initial begin
    clk = 0;
    read_port_1 = 3;
    read_port_2 = 5;
    write_port_1 = 7;
    write_data = $random;
    write_enable = 1;

#10; write_port_1 = 4;
    write_data = $random;
    write_enable = 1;


    #10;
    write_enable = 0;
    read_port_1 = 7;
    read_port_2 = 4;

    #10;
    write_port_1 = 2;
    write_data = $random;
    write_enable = 1;

    #10;
    write_enable = 0;
    read_port_1 = 2;
   

    #10;
    $finish;
end

always #5 clk = ~clk;

endmodule



