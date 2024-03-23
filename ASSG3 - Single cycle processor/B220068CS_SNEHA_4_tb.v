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
