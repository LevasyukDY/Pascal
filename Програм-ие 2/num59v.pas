program num59v;

var x,y:real;
    t:text;

begin
  assign(t,'num59v.txt');
  append(t);
  writeln('������� ���������� x,y ����� ������');readln(x,y); 
  if (abs(x)<=1) and (abs(y)<=1) then 
    begin
      writeln('����� � ������������ x=',x,' � y=',y,' ����������� �������������� ���������');
      writeln(t,'����� � ������������ x=',x,' � y=',y,' ����������� �������������� ���������');
    end
    else
    begin
      writeln('����� � ������������ x=',x,' � y=',y,' �� ����������� �������������� ���������');
      writeln(t,'����� � ������������ x=',x,' � y=',y,' �� ����������� �������������� ���������');
    end;
  close(t);
end.