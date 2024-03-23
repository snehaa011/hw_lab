module tb;

	 reg clk, write, read;
    reg [4:0] read_port1, read_port2, read_port3, read_port4, write_port1, write_port2;
    reg [63:0] write_data1, write_data2;
    
    wire [63:0] read_data1, read_data2, read_data3, read_data4 ;

regfile dut (
    clk,
    read_port1,
    read_port2,
	 read_port3,
    read_port4,
    write_port1,
	 write_port2,
    write_data1,
	 write_data2,
    write, read,
    read_data1,
    read_data2,
	 read_data3, 
	 read_data4 
);

initial begin
    clk = 0;
    read=0;
    write_port1 = 10;
    write_port2 = 15;
    write_data1 = $random;
    write_data2 = $random;
    write = 1;

#10; write_port1 = 4;
    write_data1 = $random;
	 write_port2 = 12;
    write_data2 = $random;
    write= 1;
	 read=1;
	 read_port1=10;
	 read_port2=15;
	 read_port3=4;
	 read_port4=12;
	 

    #10;
    write_port1 = 2;
	 write_port2=2;
    write_data1 = $random;
	 write_data2 = $random;
    write = 1;

    
	 #10;
    read=1;
    read_port1 = 2;
    

    #10;
    $finish;
end

always #5 clk = ~clk;

endmodule

