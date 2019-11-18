program k1;

var x1,x2,x3,y1,y2,y3,s1,s2,s3,p,s:real;
    t:text;

begin
  assign(t,'num54.txt');
  append(t);
  writeln ('Введите координаты точки через пробел x1,y1');
  readln (x1,y1);
  writeln ('Введите координаты точки через пробел x2,y2');
  readln (x2,y2);
  writeln ('Введите координаты точки через пробел x3,y3');
  readln (x3,y3);
  
  s1:=sqrt(sqr(x2-x1)+sqr(y2-y1));
  s2:=sqrt(sqr(x3-x1)+sqr(y3-y1));
  s3:=sqrt(sqr(x3-x2)+sqr(y3-y2));
  p:=(s1+s2+s3)/2;
  s:=sqrt(p*(p-s1)*(p-s2)*(p-s3));
  
  
  close(t);
end.