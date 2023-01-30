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

module jkTest (); 

    reg j=0,k=0,clock=1,clear=0;
    wire q,qBar;

    JK test(j,k,clock,clear,q,qBar);

    always 
    begin
        #23 clock=~clock;
    end

    always 
    begin
        #10 j=~j;
        #5 k=~k;
    end
    
endmodule