program n11;
var x,y,z,a,b:real;
    t:text;
begin
assign(t,'n11.txt');
append(t);
writeln('Введи x,y,z через пробел');
readln(x,y,z);
a:=ln(abs((y-sqrt(abs(x)))*(x-(y/(z+x*x/4)))));
b:=x-(x*x)/(1*2*3)+(x*x*x*x*x*x)/(1*2*3*4*5);
writeln('При x=',x,' y=',y,' z=',z);
writeln('Получили a=',a:5:2,' b=',b:5:2);
writeln(t,'При x=',x,' y=',y,' z=',z);
writeln(t,'Получили a=',a:5:2,' b=',b:5:2);
close(t);
end.