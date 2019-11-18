program NUM86v;

var
  n, e: integer;
  t: text;

begin
  assign(t, 'NUM86v.txt');
  append(t);
    {Ход программы}
  write('Введите число: ');
  readln(n);
  e := n;
  while n > 9 do 
  begin
    n := (n div 10);
  end; 
  writeln('Первая цифра числа ', e, ' => ', n);
  writeln(t, 'Первая цифра числа ', e, ' => ', n);
  close(t);
end.