program NUM162;

var
  t: text; {��������� ����} 
  ex: string;
  A: array[1..100] of real;
  i, j, n: byte;
  sr, s: real;

begin
    {������ � ��������� ����}
  assign(t, 'NUM162.txt');
  append(t);
  
    {��� ���������� ������� ���������}
  repeat
    
    {��� ���������}
    write('������� n: ');readln(n);
    repeat
      write('������� i: ');readln(i);
    until i in [1..n];
    for j := 1 to n do
    begin
      A[j] := random * 100;
      write(A[j]:0:2, ' ');
      write(t, A[j]:0:2, ' ');
      if i <> j then s := s + A[j];
    end;
    sr := s / (n - 1);
    writeln;
    writeln('������� �������������� ��� A[', i, '] => ', sr:0:2);
    writeln(t);
    writeln(t, '������� �������������� ��� A[', i, '] => ', sr:0:2);
    
    {����� �� ��������� ��� �����������}
    writeln('��� ������ �� ��������� �������� "exit", ��� ����������� ������� ����� ������');
    readln(ex);
  until (ex = 'exit');
  
    {�������� ���������� �����}
  close(t);
end.