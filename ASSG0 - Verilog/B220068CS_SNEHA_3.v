module B220068CS_SNEHA_3(input [7:0]a,b,input [1:0]select, output reg [7:0]result);
 
    always @(*)
    begin
        case (select)
            2'b00:
                begin
                    result=a+b;        
                end
            2'b01:
                begin
                    result=a-b;
                end
            2'b10:
                begin
                    result=a^b;
                end
            2'b11:
                begin
                    result=a<<1;
                end
            default:
                    result= 8'b00000000;
        endcase
    end

endmodule