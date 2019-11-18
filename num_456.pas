program num_456;

var
  n: integer;
  t: text;

{$include 'procedure_456.txt'}

begin
  assign(t, 'num_456.txt');
  append(t);
  write('(N>2) N:');
  readln(n);
  if n > 2 then 
  begin
    writeln(t, 'При N=', n, ' получили:');
    write('0 1 ');
    write(t,'0 1 ');
    Count(0, 1, n, t);
    writeln(t);
    writeln(t);
  end
  else
  begin
    writeln('Не выполнено условие');
    writeln(t, 'Не выполнено условие');
    writeln;
    writeln(t);
  end;
  close(t);
end.