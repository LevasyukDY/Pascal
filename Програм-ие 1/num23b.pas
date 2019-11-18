program num23b;

var a,b,c,x,y,z,p:real;
    t:text;
    
begin
  assign(t,'num23b.pas');
  append(t);
  writeln('Введи длины сторон a,b,c через пробел');
  readln(a,b,c);
  p:=(a+b+c)/2;
  x:=2*sqrt(b*b+c*c-a*a);
  y:=2*sqrt(a*a+c*c-b*b);
  z:=2*sqrt(a*a+b*b-c*c);
  writeln('При a=',a:5:2,' b=',b:5:2,' c=',c:5:2);
  writeln('Получили ma=',x:5:2,' mb=',y:5:2,' mc=',z:5:2);
  writeln(t,'При a=',a:5:2,' b=',b:5:2,' c=',c:5:2);
  writeln(t,'Получили ma=',x:5:2,' mb=',y:5:2,' mc=',z:5:2);
  close(t);
end.