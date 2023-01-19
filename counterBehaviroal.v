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