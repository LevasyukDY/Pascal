program num23a;

var a,b,c,x,y,z,p:real;
    t:text;
    
begin
  assign(t,'num23a.pas');
  append(t);
  writeln('Введи длины сторон a,b,c через пробел');
  readln(a,b,c);
  p:=(a+b+c)/2;
  x:=(2/a)*sqrt(p*(p-a)*(p-b)*(p-c));
  y:=(2/b)*sqrt(p*(p-a)*(p-b)*(p-c));
  z:=(2/c)*sqrt(p*(p-a)*(p-b)*(p-c));
  writeln('При a=',a:5:2,' b=',b:5:2,' c=',c:5:2);
  writeln('Получили ha=',x:5:2,' hb=',y:5:2,' hc=',z:5:2);
  writeln(t,'При a=',a:5:2,' b=',b:5:2,' c=',c:5:2);
  writeln(t,'Получили ha=',x:5:2,' hb=',y:5:2,' hc=',z:5:2);
  close(t);
end.��� a= 1.00 b= 1.00 c= 1.00
�������� ha= 0.87 hb= 0.87 hc= 0.87
��� a= 3.00 b= 4.00 c= 5.00
�������� ha= 4.00 hb= 3.00 hc= 2.40
