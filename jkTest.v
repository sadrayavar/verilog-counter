
module jkTest (); 

    reg j=0,k=0,clock=1,clear=0,preset=0;
    wire q;

    JK test(j,k,clock,clear,preset,q);

    always 
    fork
        #23 clock=~clock;
    join 
    
endmodule