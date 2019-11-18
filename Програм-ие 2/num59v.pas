program num59v;

var x,y:real;
    t:text;

begin
  assign(t,'num59v.txt');
  append(t);
  writeln('Введите координаты x,y через пробел');readln(x,y); 
  if (abs(x)<=1) and (abs(y)<=1) then 
    begin
      writeln('Точка с координатами x=',x,' и y=',y,' принадлежит заштрихованной плоскости');
      writeln(t,'Точка с координатами x=',x,' и y=',y,' принадлежит заштрихованной плоскости');
    end
    else
    begin
      writeln('Точка с координатами x=',x,' и y=',y,' не принадлежит заштрихованной плоскости');
      writeln(t,'Точка с координатами x=',x,' и y=',y,' не принадлежит заштрихованной плоскости');
    end;
  close(t);
end.