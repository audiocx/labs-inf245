module Testbench();

  logic[11:0]flags;
  logic[7:0] a,b,s,suma,resta,mult,div,notv,orv,andv,xorv,lslv,lsrv,asrv,rolv,rorv,pesol,pesop,pesom;
  //logic[7:0] poder1,poder2,est1,est2,agi1,agi2,peso1,peso2,str1,str2,res1,res2,o0,o1,reg1,reg2;
  logic[3:0]ctrl,c;
  //logic[2:0]c2;
  logic clk,cin,reset,resetpl,resetpp,resetpm,csum,cres,vsum,vres,vmul,carry,over,E;
  
  //assign en2=~c2[2]&~c2[1]&~c2[0];
  
  
  always 
    begin
    #5 clk = 1;
    #5 clk = 0;
      
  end
  
  PC pc(clk,reset,c);
  ROM rm(c,clk,ctrl);
  //
  
  
  //
  RstPL rstpl(ctrl,resetpl);
  RstPP rstpp(ctrl,resetpp);
  RstPM rstpm(ctrl,resetpm);
  //aritmetica
  LookAheadAdder8 LAA8(a,b,cin,suma,csum,vsum);
  RestaRCA rest(a,b,cin,resta,cres,vres);
  Multiplier multi(a,b,mult,vmul);
  Divider divi(a,b,div,E);
  //logica
  bitwiseNot bnot(a,notv);
  bitwiseOr bor(a,b,orv);
  bitwiseAnd band(a,b,andv);
  bitwiseXor bxor(a,b,xorv);
  //traslacion
  LogicShiftL lsl(a,b,lslv);
  LogicShiftR lsr(a,b,lsrv);
  ArShiftR asr(a,b,asrv);
  RotateL rol(a,b,rolv);
  RotateR ror(a,b,rorv);
  //torneo
  PesoLigero pl(a,b,clk,resetpl,pesol);
  PesoPesado pp(a,b,clk,resetpp,pesop);
  PesoMixto pm(a,b,clk,resetpm,pesom);
  Carry carr(csum,cres,ctrl,carry);
  Over ovr(vmul,vsum,vres,ctrl,over);
  MuxAluContrl alu(suma,resta,mult,div,notv,orv,andv,xorv,lslv,lsrv,asrv,rolv,rorv,pesol,pesop,pesom,ctrl,carry,over,E,s,flags);
  initial begin
    reset=0;#10    
    a=8'h7f;b=8'h06;reset<=1;cin=0;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    $displayh(s);
    $displayh(flags);
    a=8'hff;b=8'h01;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    $displayh(s);
    $displayh(flags);
    a=8'h11;b=8'h04;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    $displayh(s);
    $displayh(flags);
    a=8'h55;b=8'h01;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
	$displayh(flags);
    a=8'h64;b=8'h60;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
	$displayh(flags);

    a=8'h07;b=8'h04;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    $displayh(s);    
    $displayh(flags);
    a=8'h3c;b=8'h53;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    $displayh(s);
    $displayh(flags);
    a=8'h04;b=8'h04;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
    $displayh(flags);
    a=8'h0f;b=8'h15;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    $displayh(s);
    $displayh(flags);
    a=8'h06;b=8'h01;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    
    $displayh(s);
    $displayh(flags);
    a=8'h05;b=8'h05;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);
    
    $displayh(s);
    $displayh(flags);
    a=8'h03;b=8'h05;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
    $displayh(flags);
    a=8'hff;b=8'h02;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
    $displayh(flags);
    a=8'hff;b=8'h02;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
    $displayh(flags);
    a=8'haa;b=8'h03;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
    $displayh(flags);
    a=8'h3b;b=8'h00;#10
    $displayh("a=",a," b=",b);
    $displayb(ctrl);  
    $displayh(s);
    $displayh(flags);
   
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  end
endmodule