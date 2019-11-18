program NUM118a;

const
    n=10000;

var s:real;
    z,i:integer;
    t:text;

begin
  assign(t,'NUM118a.txt');
  append(t);
    {Ход программы}
  z:=-1;
  s:=0;
  for i:=1 to n do
    begin
      z:=-z;
      s:=s+z/i;
    end;
  writeln('1-(1/2)+(1/3)-...+(1/9999)-(1/10000)=',s:0:3);
  writeln(t,'1-(1/2)+(1/3)-...+(1/9999)-(1/10000)=',s:0:3);
    close(t);
end.