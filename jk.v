module  JK(j,k,clock,clear,Q);
  input j,k,clock,clear;
  output Q=0;

    req Q;

  always @ (posedge clock, clear)
  if (clear==1'b1)
  begin
    case ({j, k})
    2'b00 : q=q;
    2'b01 : q=0;
    2'b10 : q=1;
    2'b11 : q=~q;
    endcase
  end  else q=0;
endmodule
