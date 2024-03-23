module B220068CS_SNEHA_3(input [2:0]sw, input clk,clear, output reg alarm,locked,entimer,output reg [1:0]selsw);

	parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, wrong=3'b100, unlock=3'b101;
	
	reg [2:0]present=s0,next=s0;
	reg [31:0]counter='d0;
	
	always @ (posedge clk) begin
		if (clear)
			present<=s0;
		else begin
			present<=next;
			if (present==unlock) begin
				if (counter==9) begin
					counter<='d0;
				end
				else begin
					counter<=counter+1;
				end
			end		
		end	
	end

	always @ (present,sw,counter) begin
		case (present)
		s0:
			begin
				locked<=1; alarm<=1; entimer<=0; selsw<=2'b00;
				if (sw==0)
					next<=s1;
				else
					next<=wrong;
			end

		s1:
			begin
				locked<=1; alarm<=1; entimer<=0; selsw<=2'b01;
				if (sw==1)
					next<=s2;
				else
					next<=wrong;
			end

		s2:
			begin
				locked<=1; alarm<=1; entimer<=0; selsw<=2'b10;
				if (sw==2)
					next<=s3;
				else
					next<=wrong;
			end

		s3:
			begin
				locked<=1; alarm<=1; entimer<=0; selsw<=2'b11;
				if (sw==3)
					next<=unlock;
				else
					next<=wrong;
			end
		
		wrong:
			begin
				locked<=1; alarm<=0; entimer<=0; selsw<=2'b00;
				next<=wrong;
			end
		
		unlock:
			begin
				locked<=0; alarm<=1; entimer<=1; selsw<=2'b00;
				if (counter==9) begin
					next<=s0;
				end
				else begin
					next<=unlock;
				end
		end

		endcase
	end
	
endmodule
