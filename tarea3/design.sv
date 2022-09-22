// Code your design here
// Code your design here
module bitwiseNot(
  input logic[7:0] a,
  output logic[7:0] x);
  assign x=~a;
endmodule

module bitwiseOr(
  input logic[7:0] a,b,
  output logic[7:0] x);
  assign x=a|b;
endmodule

module bitwiseAnd(
  input logic[7:0] a,b,
  output logic[7:0] x);
  assign x=a&b;
endmodule

module bitwiseXor(
  input logic[7:0] a,b,
  output logic[7:0] x);
  assign x=a^b;
endmodule

module Shifter(
  input logic s,x,x1,
  output logic y
);
  assign y=(~s&x)|(s&x1);
endmodule


module LogicShiftR(
  input logic [7:0] a,b,
  output logic [7:0] y);
  
  logic [7:0] t,t1,t2,t3;
  logic s1,s2,s3,s4;
  
  assign s1=b[0];
  assign s2=b[1];
  assign s3=b[2];
  assign s4=b[3]|b[4]|b[5]|b[6]|b[7];
  
  Shifter zs7(s1,a[7],0,t[7]);
  Shifter zs[6:0](s1,a[6:0],a[7:1],t[6:0]);
  
  Shifter os7(s2,t[7],0,t1[7]);
  Shifter os6(s2,t[6],0,t1[6]);
  Shifter os[5:0](s2,t[5:0],t[7:2],t1[5:0]);
  
  Shifter ts7(s3,t1[7],0,t2[7]);
  Shifter ts6(s3,t1[6],0,t2[6]);
  Shifter ts5(s3,t1[5],0,t2[5]);
  Shifter ts4(s3,t1[4],0,t2[4]);
  Shifter ts[3:0](s3,t1[3:0],t1[7:4],t2[3:0]);
  

  assign t3[7]=t2[7]&~s4;
  assign t3[6]=t2[6]&~s4;
  assign t3[5]=t2[5]&~s4;
  assign t3[4]=t2[4]&~s4;
  assign t3[3]=t2[3]&~s4;
  assign t3[2]=t2[2]&~s4;
  assign t3[1]=t2[1]&~s4;
  assign t3[0]=t2[0]&~s4;
  
  assign y=t3;
  
  
endmodule

module LogicShiftL(
  input logic [7:0] a,b,
  output logic [7:0] y);
  logic [7:0] t,t1,t2,t3;
  logic s1,s2,s3,s4,zero;
  assign zero=0;
  assign s1=b[0];
  assign s2=b[1];
  assign s3=b[2];
  assign s4=b[3]|b[4]|b[5]|b[6]|b[7];
 
  Shifter zs0(s1,a[0],zero,t[0]);
  Shifter zs[7:1](s1,a[7:1],a[6:0],t[7:1]);
  
  Shifter os0(s2,t[0],zero,t1[0]);
  Shifter os1(s2,t[1],zero,t1[1]);
  Shifter os[7:2](s2,t[7:2],t[5:0],t1[7:2]);
  
  Shifter ts0(s3,t1[0],zero,t2[0]);
  Shifter ts1(s3,t1[1],zero,t2[1]);
  Shifter ts2(s3,t1[2],zero,t2[2]);
  Shifter ts3(s3,t1[3],zero,t2[3]);
  Shifter ts[7:4](s3,t1[7:4],t1[3:0],t2[7:4]);
  
  assign t3[7]=t2[7]&~s4;
  assign t3[6]=t2[6]&~s4;
  assign t3[5]=t2[5]&~s4;
  assign t3[4]=t2[4]&~s4;
  assign t3[3]=t2[3]&~s4;
  assign t3[2]=t2[2]&~s4;
  assign t3[1]=t2[1]&~s4;
  assign t3[0]=t2[0]&~s4;
  
  assign y=t3;
endmodule

module ArShiftR(
  input logic [7:0] a,b,
  output logic [7:0] y);
  
  logic [7:0] t,t1,t2,t3;
  logic s1,s2,s3,s4;
  
  assign s1=b[0];
  assign s2=b[1];
  assign s3=b[2];
  assign s4=b[3]|b[4]|b[5]|b[6]|b[7];
  
  Shifter zs7(s1,a[7],a[7],t[7]);
  Shifter zs[6:0](s1,a[6:0],a[7:1],t[6:0]);
  
  Shifter os7(s2,t[7],t[7],t1[7]);
  Shifter os6(s2,t[6],t[7],t1[6]);
  Shifter os[5:0](s2,t[5:0],t[7:2],t1[5:0]);
  
  Shifter ts7(s3,t1[7],t1[7],t2[7]);
  Shifter ts6(s3,t1[6],t1[7],t2[6]);
  Shifter ts5(s3,t1[5],t1[7],t2[5]);
  Shifter ts4(s3,t1[4],t1[7],t2[4]);
  Shifter ts[3:0](s3,t1[3:0],t1[7:4],t2[3:0]);
  
  assign t3[7]=t2[7]&~s4;
  assign t3[6]=t2[6]&~s4;
  assign t3[5]=t2[5]&~s4;
  assign t3[4]=t2[4]&~s4;
  assign t3[3]=t2[3]&~s4;
  assign t3[2]=t2[2]&~s4;
  assign t3[1]=t2[1]&~s4;
  assign t3[0]=t2[0]&~s4;
  
  assign y=t3;  
endmodule

module RotateL(
  input logic[7:0] a,b,
  output logic[7:0] y
);
  logic [7:0] t,t1,t2;
  logic s1,s2,s3,s4;
  
  assign s1=b[0];
  assign s2=b[1];
  assign s3=b[2];
  
  
  Shifter sh0(s1,a[0],a[7],t[0]);
  Shifter sh1(s1,a[1],a[0],t[1]);
  Shifter sh2(s1,a[2],a[1],t[2]);
  Shifter sh3(s1,a[3],a[2],t[3]);
  Shifter sh4(s1,a[4],a[3],t[4]);
  Shifter sh5(s1,a[5],a[4],t[5]);
  Shifter sh6(s1,a[6],a[5],t[6]);
  Shifter sh7(s1,a[7],a[6],t[7]);
  
  Shifter st0(s2,t[0],t[6],t1[0]);
  Shifter st1(s2,t[1],t[7],t1[1]);
  Shifter st2(s2,t[2],t[0],t1[2]);
  Shifter st3(s2,t[3],t[1],t1[3]);
  Shifter st4(s2,t[4],t[2],t1[4]);
  Shifter st5(s2,t[5],t[3],t1[5]);
  Shifter st6(s2,t[6],t[4],t1[6]);
  Shifter st7(s2,t[7],t[5],t1[7]);
  
  Shifter sz0(s3,t1[0],t1[4],t2[0]);
  Shifter sz1(s3,t1[1],t1[5],t2[1]);
  Shifter sz2(s3,t1[2],t1[6],t2[2]);
  Shifter sz3(s3,t1[3],t1[7],t2[3]);
  Shifter sz4(s3,t1[4],t1[0],t2[4]);
  Shifter sz5(s3,t1[5],t1[1],t2[5]);
  Shifter sz6(s3,t1[6],t1[2],t2[6]);
  Shifter sz7(s3,t1[7],t1[3],t2[7]);
  
  assign y=t2;
endmodule
module RotateR(
  input logic[7:0] a,b,
  output logic[7:0] y
);
  logic [7:0] t,t1,t2;
  logic s1,s2,s3,s4;
  
  assign s1=b[0];
  assign s2=b[1];
  assign s3=b[2];
  
  
  Shifter sh0(s1,a[0],a[1],t[0]);
  Shifter sh1(s1,a[1],a[2],t[1]);
  Shifter sh2(s1,a[2],a[3],t[2]);
  Shifter sh3(s1,a[3],a[4],t[3]);
  Shifter sh4(s1,a[4],a[5],t[4]);
  Shifter sh5(s1,a[5],a[6],t[5]);
  Shifter sh6(s1,a[6],a[7],t[6]);
  Shifter sh7(s1,a[7],a[0],t[7]);
  
  Shifter st0(s2,t[0],t[2],t1[0]);
  Shifter st1(s2,t[1],t[3],t1[1]);
  Shifter st2(s2,t[2],t[4],t1[2]);
  Shifter st3(s2,t[3],t[5],t1[3]);
  Shifter st4(s2,t[4],t[6],t1[4]);
  Shifter st5(s2,t[5],t[7],t1[5]);
  Shifter st6(s2,t[6],t[0],t1[6]);
  Shifter st7(s2,t[7],t[1],t1[7]);
  
  Shifter sz0(s3,t1[0],t1[4],t2[0]);
  Shifter sz1(s3,t1[1],t1[5],t2[1]);
  Shifter sz2(s3,t1[2],t1[6],t2[2]);
  Shifter sz3(s3,t1[3],t1[7],t2[3]);
  Shifter sz4(s3,t1[4],t1[0],t2[4]);
  Shifter sz5(s3,t1[5],t1[1],t2[5]);
  Shifter sz6(s3,t1[6],t1[2],t2[6]);
  Shifter sz7(s3,t1[7],t1[3],t2[7]);
  
  assign y=t2;
endmodule

module Multiplier(
  input logic [7:0] a,b,
  output logic [7:0] x,
output logic V);
  
  logic[3:0] t,t1,t2,t3,p,p1,p2;
  logic[3:0] ab2,ab3;
  logic cin;
  assign cin=0;
  
  assign V=a[7]|a[6]|a[5]|b[4]|b[7]|b[6]|b[5]|b[4];
    
  assign t[3]=0;
  assign t[2]=a[3]&b[0];
  assign t[1]=a[2]&b[0];
  assign t[0]=a[1]&b[0];
  
  assign t1[3]=a[3]&b[1];
  assign t1[2]=a[2]&b[1];
  assign t1[1]=a[1]&b[1];
  assign t1[0]=a[0]&b[1];
  
  FourLA f1(t,t1,cin,p,t2[3]);
  assign t2[2]=p[3];
  assign t2[1]=p[2];
  assign t2[0]=p[1];
  
  assign ab2[3]=a[3]&b[2];
  assign ab2[2]=a[2]&b[2];
  assign ab2[1]=a[1]&b[2];
  assign ab2[0]=a[0]&b[2];
  
  FourLA f2(ab2,t2,cin,p1,t3[3]);
  
  assign t3[2]=p1[3];
  assign t3[1]=p1[2];
  assign t3[0]=p1[1];
  assign ab3[3]=a[3]&b[3];
  assign ab3[2]=a[2]&b[3];
  assign ab3[1]=a[1]&b[3];
  assign ab3[0]=a[0]&b[3];
  FourLA f3(ab3,t3,cin,p2,x[7]);

  
  
  assign x[0]=a[0]&b[0];
  assign x[1]=p[0];
  assign x[2]=p1[0];
  assign x[3]=p2[0];
  assign x[4]=p2[1];
  assign x[5]=p2[2];
  assign x[6]=p2[3];
endmodule

module Divider(
  input logic [7:0] a,b,               
  output logic [7:0] x,
output logic E);
  logic[7:0] z;
  assign z[7]= b[7]|b[6]|b[5]|b[4]|b[3]|b[2]|b[1]|b[0];
  assign z[6]=z[7];
  assign z[5]=z[7];
  assign z[4]=z[7];
  assign z[3]=z[7];
  assign z[2]=z[7];
  assign z[1]=z[7];
  assign z[0]=z[7];
  
  assign x=(a/b)&z;
  assign E=~&b;
endmodule



module FullAdder(
    input logic a, b, cin,
    output logic g, p, s,cout);
    
    assign g = a & b;
    assign p = (a ^ b) & cin;
    assign s = cin ^ (a ^ b);
  	assign cout = g|p;
    
endmodule

module FourLALogic(
    input logic cin,
    input logic [3:0] g, p,
    output logic [3:0] c);   

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
    

endmodule

module FourLA(
  	input logic [3:0] a, b,
    input logic cin,
  	output logic [3:0] s,
    output logic cout);
    
  	logic [3:0] g, p,c;
  
    FullAdder fa0(a[0], b[0], cin, g[0], p[0], s[0]);
    FullAdder fa1(a[1], b[1], c[0], g[1], p[1], s[1]);
	FullAdder fa2(a[2], b[2], c[1], g[2], p[2], s[2]);
	FullAdder fa3(a[3], b[3], c[2], g[3], p[3], s[3]);
	FourLALogic cla(cin, g[3:0], p[3:0], c[3:0]);
	assign cout = c[3];
  
endmodule

module LookAheadAdder8(
	input logic [7:0] a, b,
	input logic cin,
    output logic [7:0] s,
	output logic cout,v);
    
   
	logic cout1;
	FourLA LA30(a[3:0],b[3:0],cin,s[3:0],cout1);
	FourLA LA74(a[7:4],b[7:4],cout1,s[7:4],cout);
  assign v =~a[7]&~b[7]&s[7]|a[7]&b[7]&~s[7]|a[7]&~b[7]&~s[7]|~a[7]&b[7]&s[7];
  	
    
endmodule

module RestaRCA(
  input logic [7:0]a,b,
  input logic cin,
  output logic [7:0] s,
	output logic cout,v);
  
  logic [7:0] c,x;
  bitwiseNot Nt(b,x);
  FullAdder R0(a[0],x[0],cin,,,s[0],c[0]);
  FullAdder R[7:1](a[7:1],x[7:1],c[6:0],,,s[7:1],c[7:1]);
  assign cout=c[7];
  assign v =~a[7]&~b[7]&s[7]|a[7]&b[7]&~s[7];
  
endmodule

module deMux(
  input logic[7:0] a,b,
  input logic s,
  output logic[7:0] a0,b0,a1,b1);
  logic[7:0]sel;
  assign sel[7]=s;
  assign sel[6]=s;
  assign sel[5]=s;
  assign sel[4]=s;
  assign sel[3]=s;
  assign sel[2]=s;
  assign sel[1]=s;
  assign sel[0]=s;
  assign a0=a&~sel;
  assign b0=b&~sel;
  assign a1=a&sel;
  assign b1=b&sel;


endmodule
module deMux5(
  input logic[7:0] a,b,
  input logic[2:0] s,
  output logic[7:0] a0,b0,a1,b1,a2,b2,a3,b3,a4,b4);
  logic[7:0]sel2,sel1,sel0;
  assign sel2[7]=s[2];
  assign sel2[6]=s[2];
  assign sel2[5]=s[2];
  assign sel2[4]=s[2];
  assign sel2[3]=s[2];
  assign sel2[2]=s[2];
  assign sel2[1]=s[2];
  assign sel2[0]=s[2];
  assign sel1[7]=s[1];
  assign sel1[6]=s[1];
  assign sel1[5]=s[1];
  assign sel1[4]=s[1];
  assign sel1[3]=s[1];
  assign sel1[2]=s[1];
  assign sel1[1]=s[1];
  assign sel1[0]=s[1];
  assign sel0[7]=s[0];
  assign sel0[6]=s[0];
  assign sel0[5]=s[0];
  assign sel0[4]=s[0];
  assign sel0[3]=s[0];
  assign sel0[2]=s[0];
  assign sel0[1]=s[0];
  assign sel0[0]=s[0];
  assign a0=a&(~sel2&~sel1&~sel0);
  assign b0=b&(~sel2&~sel1&~sel0);
  assign a1=a&~sel2&~sel1&sel0;
  assign b1=b&~sel2&~sel1&sel0;
  assign a2=a&~sel2&sel1&~sel0;
  assign b2=b&~sel2&sel1&~sel0;
  assign a3=a&~sel2&sel1&sel0;
  assign b3=b&~sel2&sel1&sel0;
  assign a4=a&sel2&~sel1&~sel0;
  assign b4=b&sel2&~sel1&~sel0;


endmodule

module register(
  input logic[7:0] a,b,
  input logic enable,clk,clear,
  output logic[7:0] a0,b0	);
  
  always @(posedge clk)
    begin
    if (clear) begin
      
    a0=0;
  	b0=0;
    end
      else
        
    if (enable) begin  
      
    	a0=a;
  		b0=b; 
      
    end
  end
endmodule


module counter1(
input logic clk,reset,
  output logic c);
  
  always @(posedge clk) begin
    
    	if(!reset)
      	c=0;
    	else
          if(!c)
      			c<=c+1;
    
  end
    
endmodule
module counter3(
input logic clk,reset,
  output logic[2:0] c);
  
  always @(posedge clk) begin
    
    	if(!reset)
      	c=0;
    	else
          if(!c[2])
      			c<=c+1;
        
    
  end
    
endmodule

module PesoLigero(
  input logic [7:0] a,b,
  input logic clk,rst,
  output logic [7:0] w,poder1,poder2,agi1,agi2,est1,est2,
  
  output logic c);
  
  reg[7:0] wr,o0,o1;
  counter1 con(clk,rst,c);
  deMux dmx(a,b,c,o0,o1,agi1,agi2);
  register regi(o0,o1,~c,clk,,est1,est2);
    
  //logic [7:0]c
  assign poder1=((est1/agi1) + (100/est1) +agi1);
  assign poder2=((est2/agi2) + (100/est2) +agi2);
  
    
  assign wr=(poder2-poder1);
  
  assign w[7]= ~wr[7]&c;
  assign w[6]= ~wr[7]&c;
  assign w[5]= ~wr[7]&c;
  assign w[4]= ~wr[7]&c;
  assign w[3]= ~wr[7]&c;
  assign w[2]= ~wr[7]&c;
  assign w[1]= ~wr[7]&c;
  assign w[0]= ~wr[7]&c;
    
    

endmodule



module PesoPesado(
input logic [7:0] a,b,
  input logic clk,rst,
  output logic [7:0] w,poder1,poder2,res1,res2,peso1,peso2,
  
  output logic c);
  
  reg[7:0] wr,o0,o1;
  counter1 con(clk,rst,c);
  deMux dmx(a,b,c,o0,o1,res1,res2);
  register regi(o0,o1,~c,clk,,peso1,peso2);
    
  //logic [7:0]c
  assign poder1=(5*peso1 + 2*res1);
  assign poder2=(5*peso2 + 2*res2);
  
    
  assign wr=(poder2-poder1);
  
  assign w[7]= ~wr[7]&c;
  assign w[6]= ~wr[7]&c;
  assign w[5]= ~wr[7]&c;
  assign w[4]= ~wr[7]&c;
  assign w[3]= ~wr[7]&c;
  assign w[2]= ~wr[7]&c;
  assign w[1]= ~wr[7]&c;
  assign w[0]= ~wr[7]&c;
    
    

endmodule
module PesoMixto(
input logic [7:0] a,b,
  input logic clk,rst,
  output logic [7:0] w,poder1,poder2,est1,est2,agi1,agi2,peso1,peso2,str1,str2,res1,res2,
  
  output logic[2:0] c,
	output logic s);
  
  reg[7:0] wr,o0,o1,o2,o3,o4,o5,o6,o7;
  reg s1,s2,s3,clr;
  assign clr=0;
  assign s=~c[2]&~c[1]&~c[0];
  assign s1=~c[2]&~c[1]&c[0];
  assign s2=~c[2]&c[1]&~c[0];
  assign s3=~c[2]&c[1]&c[0];
 
  counter3 con(clk,rst,c);
  deMux5 dmx(a,b,c,o0,o1,o2,o3,o4,o5,o6,o7,res1,res2);
 
  register regi(o0,o1,s,clk,clr,est1,est2);
  register regi1(o2,o3,s1,clk,clr,agi1,agi2);
  register regi2(o4,o5,s2,clk,clr,peso1,peso2);
  register regi3(o6,o7,s3,clk,clr,str1,str2);
    
  //logic [7:0]c
  assign poder1=((est1/agi1) + 3*peso1+((str1+agi1+res1)/3));
  assign poder2=((est2/agi2) + 3*peso2+((str2+agi2+res2)/3));
  
    
  assign wr=(poder2-poder1);
  
  assign w[7]= ~wr[7]&c[2];
  assign w[6]= ~wr[7]&c[2];
  assign w[5]= ~wr[7]&c[2];
  assign w[4]= ~wr[7]&c[2];
  assign w[3]= ~wr[7]&c[2];
  assign w[2]= ~wr[7]&c[2];
  assign w[1]= ~wr[7]&c[2];
  assign w[0]= ~wr[7]&c[2];
    
    

endmodule
module PC(
input logic clk,reset,
  output logic[3:0] c);
  
  always @(posedge clk) begin
    
    	if(!reset)
      	c=0;
    	else
          if(c!=4'b1111)
      			c<=c+1;
    
  end
    
endmodule
module ROM(
  input [3:0] addr,
  input clk, 
  output logic [3:0] q
);
 
	
  logic [3:0] rom[2**4:0];
 
  initial
    begin
      $readmemh("operaciones.dat", rom);
    end

  always_ff @ (posedge clk)
    begin
      q <= rom[addr];
    end
 
endmodule
module Carry(
input logic csum,cres,
  input logic[3:0]ctrl,
  output logic c
);
  assign c=csum&~ctrl[3]&~ctrl[2]&~ctrl[1]&~ctrl[0]|cres&~ctrl[3]&~ctrl[2]&~ctrl[1]&ctrl[0];
endmodule
module Over(
  input logic vm,vs,vr,
  input logic [3:0] ctrl,
  output logic V
);
 
  assign V=vm&~ctrl[3]&~ctrl[2]&ctrl[1]&~ctrl[0]|vs&~ctrl[3]&~ctrl[2]&~ctrl[1]&~ctrl[0]|vr&~ctrl[3]&~ctrl[2]&~ctrl[1]&ctrl[0];
endmodule



module MuxAluContrl(
  input logic[7:0] suma,resta,mult,div,notv,orv,andv,xorv,lsl,lsr,asr,rol,ror,pesol,pesop,pesom,
  input logic[3:0] ctrl,
  input logic carry,over,E,
  output logic[7:0] S,
  output logic[11:0] flags
);
 
  
  logic[7:0]ctrl3,ctrl2,ctrl1,ctrl0;
  assign ctrl3[7]=ctrl[3];
  assign ctrl3[6]=ctrl[3];
  assign ctrl3[5]=ctrl[3];
  assign ctrl3[4]=ctrl[3];
  assign ctrl3[3]=ctrl[3];
  assign ctrl3[2]=ctrl[3];
  assign ctrl3[1]=ctrl[3];
  assign ctrl3[0]=ctrl[3];
  assign ctrl2[7]=ctrl[2];
  assign ctrl2[6]=ctrl[2];
  assign ctrl2[5]=ctrl[2];
  assign ctrl2[4]=ctrl[2];
  assign ctrl2[3]=ctrl[2];
  assign ctrl2[2]=ctrl[2];
  assign ctrl2[1]=ctrl[2];
  assign ctrl2[0]=ctrl[2];
  assign ctrl1[7]=ctrl[1];
  assign ctrl1[6]=ctrl[1];
  assign ctrl1[5]=ctrl[1];
  assign ctrl1[4]=ctrl[1];
  assign ctrl1[3]=ctrl[1];
  assign ctrl1[2]=ctrl[1];
  assign ctrl1[1]=ctrl[1];
  assign ctrl1[0]=ctrl[1];
  assign ctrl0[7]=ctrl[0];
  assign ctrl0[6]=ctrl[0];
  assign ctrl0[5]=ctrl[0];
  assign ctrl0[4]=ctrl[0];
  assign ctrl0[3]=ctrl[0];
  assign ctrl0[2]=ctrl[0];
  assign ctrl0[1]=ctrl[0];
  assign ctrl0[0]=ctrl[0];

  assign S=	(suma& ~ctrl3&~ctrl2&~ctrl1&~ctrl0)|
    (resta& ~ctrl3&~ctrl2&~ctrl1&ctrl0)|
    (mult& ~ctrl3&~ctrl2&ctrl1&~ctrl0)|
    (div& ~ctrl3&~ctrl2&ctrl1&ctrl0)|
    (notv& ~ctrl3&ctrl2&~ctrl1&~ctrl0)|
    (orv& ~ctrl3&ctrl2&~ctrl1&ctrl0)|
    (andv& ~ctrl3&ctrl2&ctrl1&~ctrl0)|
    (xorv& ~ctrl3&ctrl2&ctrl1&ctrl0)|
    (lsl& ctrl3&~ctrl2&~ctrl1&~ctrl0)|
    (lsr& ctrl3&~ctrl2&~ctrl1&ctrl0)|
    (asr& ctrl3&~ctrl2&ctrl1&~ctrl0)|
    (rol& ctrl3&~ctrl2&ctrl1&ctrl0)|
    (ror& ctrl3&ctrl2&~ctrl1&~ctrl0)|
    (pesol& ctrl3&ctrl2&~ctrl1&ctrl0)|
    (pesop& ctrl3&ctrl2&ctrl1&~ctrl0)|
    (pesom& ctrl3&ctrl2&ctrl1&ctrl0);
  
  assign flags[11]=0;
  assign flags[10]=0;
  assign flags[9]=0;
  assign flags[8]= (~ctrl3&~ctrl2&~ctrl1&~ctrl0)|
    (~ctrl3&~ctrl2&~ctrl1&ctrl0)|
    (~ctrl3&~ctrl2&ctrl1&~ctrl0)|
    (~ctrl3&~ctrl2&ctrl1&ctrl0);
  assign flags[7]=(~ctrl3&ctrl2&~ctrl1&~ctrl0)|
    (~ctrl3&ctrl2&~ctrl1&ctrl0)|
    (~ctrl3&ctrl2&ctrl1&~ctrl0)|
  (~ctrl3&ctrl2&ctrl1&ctrl0);
  assign flags[6]=(ctrl3&~ctrl2&~ctrl1&~ctrl0)|
    (ctrl3&~ctrl2&~ctrl1&ctrl0)|
    (ctrl3&~ctrl2&ctrl1&~ctrl0)|
    (ctrl3&~ctrl2&ctrl1&ctrl0)|
    (ctrl3&ctrl2&~ctrl1&~ctrl0);
  assign flags[5]=(ctrl3&ctrl2&~ctrl1&ctrl0)|
    (ctrl3&ctrl2&ctrl1&~ctrl0)|
    (ctrl3&ctrl2&ctrl1&ctrl0);
  assign flags[4]= ~S[7]&~S[6]&~S[5]&~S[4]&~S[3]&~S[2]&~S[1]&~S[0];
  assign flags[3]=S[7];
  assign flags[2]=carry;
  assign flags[1]=over;
  assign flags[0]=E&~ctrl[3]&~ctrl[2]&~ctrl[1]&ctrl[0];
 
endmodule

module RstPL(
  input logic[3:0] ctrl,
  output logic reset
);
  
  assign reset= ctrl[3]&ctrl[2]&~ctrl[1]&ctrl[0];
  
endmodule
module RstPP(
  input logic[3:0] ctrl,
  output logic reset
);
  
  assign reset= ctrl[3]&ctrl[2]&ctrl[1]&~ctrl[0];
  
endmodule
module RstPM(
  input logic[3:0] ctrl,
  output logic reset
);
  
  assign reset= ctrl[3]&ctrl[2]&ctrl[1]&ctrl[0];
  
endmodule
