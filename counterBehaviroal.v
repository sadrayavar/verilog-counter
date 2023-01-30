module counterBehaviroal(count, load, inp, clock, clear, out, carry);

input count, load, clock, clear;
input [0:3] inp;

output carry;
output [0:3] out=0;

reg [0:3] out;
assign carry = count & ~load & (out == 4'b1111);

always @ (posedge clock)
if (load) out = inp;
else if (count) out = out + 1'b1;
else out = out;
  
always @ (negedge clear)
out=4'b0000;

endmodule

module behaviroalTest();
  
  reg count=1,load=0,clock=0,clear=1;
  reg [0:3] inp=4'b1111;
    
  wire carry=0;
  wire [0:3] out;
  
  counterBehaviroal test(count, load, inp, clock, clear, out, carry);
  
  always
  begin
    #10 clock=~clock;
  end
  
  always
  begin
    #500 clear=~clear;
    #200 load=~load;
    #20   load=~load;
    #50   count=0;
  end
  
endmodule