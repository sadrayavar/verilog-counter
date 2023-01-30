module Gate_Counter(count, load , inp , clock , clear , out , carry);
  
    input count , load , clock , clear ;
    input [0:3] inp ;
    
    output carry ;
    output [0:3] out=4'b0000;
    
    reg [0:3] out;
    
    and(a,count,~load);

    and(b1,load,inp[0]);
    and(b2,load,~inp[0]);
    and(b3,load,inp[1]);
    and(b4,load,~inp[1]);
    and(b5,load,inp[2]);
    and(b6,load,~inp[2]);
    and(b7,load,inp[3]);
    and(b8,load,~inp[3]);
    
    and(c1,a,out[0]);
    and(c2,a,out[0],out[1]);
    and(c3,a,out[0],out[1],out[2]);

    or(d1,a,b1);
    or(d2,a,b2);
    or(d3,c1,b3);
    or(d4,c1,b4);
    or(d5,c2,b5);
    or(d6,c2,b6);
    or(d7,c3,b7);
    or(d8,c3,b8);

    JK a0(d1,d2,clock,clear,out[0]);
    JK a0(d3,d4,clock,clear,out[1]);
    JK a0(d5,d6,clock,clear,out[2]);
    JK a0(d7,d8,clock,clear,out[3]);
  
    and(carry,a,out[0],out[1],out[2],out[3]);

endmodule