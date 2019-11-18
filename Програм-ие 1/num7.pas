program num7;

var v1,v2,t1,t2,a,b:real;
    t:text;

begin
  assign(t,'num7.pas');
  append(t);
  writeln('Введи V1,V2,t1,t2 через пробел');
  readln(v1,v2,t1,t2);
  a:=v1+v2;
  b:=(t1*v1+t2*v2)/a;
  writeln('При V1=',v1,' V2=',v2,' t1=',t1,' t2=',t2);
  writeln('Получили V=',a:5:2,' t=',b:5:2);
  writeln(t,'При V1=',v1,' V2=',v2,' t1=',t1,' t2=',t2);
  writeln(t,'Получили V=',a:5:2,' t=',b:5:2);
  close(t);
end.