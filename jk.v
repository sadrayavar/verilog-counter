module  JK(j,k,clock,clear,preset,Q);
  
  input j,k,clock,clear,preset;
  output Q;

  nand(temp1,Qbar,j,clock);
  nand(temp2,Q,k,clock);  
  nand(Qbar,Q,temp2,clear);
  nand(Q,Qbar,temp1,preset);
  
endmodule
