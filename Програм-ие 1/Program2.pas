program n7;
var a,b,c,d,e,f:real;
    t:text;
begin
assign(t,'n7.pas');
append(t);
writeln('Введи V1,V2,t1,t2 через пробел');
readln(a,b,c,d);
e:=a+b;
f:=(c*a+d*b)/e;
writeln('При V1=',a,' V2=',b,' t1=',c,' t2=',d);
writeln('Получили V=',e:5:2,' t=',f:5:2);
writeln(t,'При V1=',a,' V2=',b,' t1=',c,' t2=',d);
writeln(t,'Получили V=',e:5:2,' t=',f:5:2);
close(t);
end.