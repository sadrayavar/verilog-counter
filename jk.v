module  JK(j,k,clock,clear,Q,Qbar);
  
  input j,k,clock,clear;
  output Q,Qbar;

  nand(temp1,Qbar,j,clock);
  nand(temp2,Q,k,clock);  
  nand(Qbar,Q,temp2,clear);
  nand(Q,Qbar,temp1,1);
  
endmodule
