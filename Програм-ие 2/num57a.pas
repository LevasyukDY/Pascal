program num57a;

var a,b:real;
    t:text;

begin
  assign(t,'num57a.txt');
  append(t);
  write('Ââåäèòå ÷èñëî a=');readln(a); 
  if (a>=-2) and (a<2) then 
    begin
      b:=a*a;
    end
    else
    begin
      b:=4;
    end;
    writeln('f(',a:5:2,')=',b:5:2);
    writeln(t,'f(',a:5:2,')=',b:5:2);
  close(t);
end.