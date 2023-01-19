module Gate_Counter(count, load , inp , clock , clear , out , carry);
  
    input count , load , clock , clear ;
    input [0:3] inp ;
    
    output carry ;
    output [0:3] out=0;
    
    reg [0:3] out;
    
    and(a,count,~load);
    and(b,load,inp[0]);
    and(c,load,~inp[0]);
    and(d,load,inp[1]);
    and(e,load,~inp[1]);
    and(f,load,inp[2]);
    and(g,load,~inp[2]);
    and(h,load,inp[3]);
    and(i,load,~inp[3]);
    and(k,a,out[0]);
    and(l,a,out[0],out[1]);
    and(m,a,out[0],out[1],out[2]);
    and(j,a,out[0],out[1],out[2],out[3]);
    or(n,a,b);
    or(o,a,c);
    or(p,k,d);
    or(q,k,e);
    or(r,l,f);
    or(s,l,g);
    or(t,m,h);
    or(u,m,i);
    JK aa(n,o,clock,clear,out[0]);
    JK bb(p,q,clock,clear,out[1]);
    JK cc(r,s,clock,clear,out[2]);
    JK dd(t,u,clock,clear,out[3]);
  
endmodule
