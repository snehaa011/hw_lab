module B220068CS_SNEHA_2( output reg ns,ew,input clk);
	reg [1:0] present,next;
	parameter s0=1'b0,s1=1'b1;
	reg[3:0] count=0;
	initial begin present<=s1; next<=s0; end
	
	always @ (posedge clk) begin
		if (count==2) begin
			count<=0;
			present<=next;
		end
		else
			count<=count+1;
			present<=next;
	end
	
	always @ (present,count) begin
		case(present)
		s0:
			if (count==2) begin
				next=s1;ns=0;ew=1;
			end
			else begin
				next=s0; ns=1;ew=0;
			end
		s1:
			if (count==2) begin
				next=s0; ns=1;ew=0;
			end
			else begin
				next=s1;ns=0;ew=1;
			end
		endcase
	end
endmodule
