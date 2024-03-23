module B220068CS_SNEHA_1(input [7:0]x,y, output [7:0]sum,output carry);
wire a,b,c,d,e,f,g;
fa f0(x[0],y[0],0,sum[0],a);
fa f1(x[1],y[1],a,sum[1],b);
fa f2(x[2],y[2],b,sum[2],c);
fa f3(x[3],y[3],c,sum[3],d);
fa f4(x[4],y[4],d,sum[4],e);
fa f5(x[5],y[5],e,sum[5],f);
fa f6(x[6],y[6],f,sum[6],g);
fa f7(x[7],y[7],g,sum[7],carry);
endmodule


module fa(input A,B,cin, output reg S,cout);
always @(A or B or cin)
begin
 if(A==0 && B==0 && cin==0)
  begin
   S=0;
   cout=0;
  end

 else if(A==0 && B==0 && cin==1)
  begin
   S=1;
   cout=0;
  end

 else if(A==0 && B==1 && cin==0)
  begin
   S=1;
   cout=0;
  end

 else if(A==0 && B==1 && cin==1)
  begin
   S=0;
   cout=1;
  end

 else if(A==1 && B==0 && cin==0)
  begin
   S=1;
   cout=0;
  end

 else if(A==1 && B==0 && cin==1)
  begin
   S=0;
   cout=1;
  end

 else if(A==1 && B==1 && cin==0)
  begin
   S=0;
   cout=1;
  end

 else if(A==1 && B==1 && cin==1)
  begin
   S=1;
   cout=1;
  end

end

endmodule
