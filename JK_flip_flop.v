module  JK(j,k,clock,clear,Q);
  
  input j,k,clock,clear;
  output Q;
  
  nand(a1,Qbar,j,clock);
  nand(a2,Q,k,clock);  
  nand(Qbar,Q,a2,clock);
  nand(Q,Qbar,a1,clock);
endmodule

