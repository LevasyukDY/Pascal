program NUM196;

var
  a: array [1..50] of integer; 
  i: integer;
  t: text;
  ex: string;

begin
    {������ � ��������� ����}
  assign(t, 'NUM196.txt');
  append(t);
  
    {��� ���������� ������� ���������}
  repeat
    
    {��� ���������}
    writeln('�������� ������������������:');
    writeln(t, '�������� ������������������:');
    
    for i := 1 to 50 do 
    begin
      a[i] := random(100);
      write(a[i], ' ');
      write(t, a[i], ' ');
    end;
    
    writeln;
    writeln('����� ������������������:');
    writeln(t);
    writeln(t, '����� ������������������:');
    
    for i := 1 to 50 do 
    begin
      if a[i] mod 2 = 0 then 
      begin
        write(a[i], ' ');
        write(t, a[i], ' ');
      end
      else
      begin
        write(a[i] * 2, ' ');
        write(t, a[i] * 2, ' ');
      end;
    end;
    
      {����� �� ��������� ��� �����������}
    writeln('��� ������ �� ��������� �������� "exit", ��� ����������� ������� ����� ������');
    readln(ex);
  until (ex = 'exit');
  
    {�������� ���������� �����}
  close(t);
end.