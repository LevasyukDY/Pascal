program NUM67b;

var
  s, n, e: integer;
  t: text;

begin
  assign(t, 'NUM67b.txt');
  append(t);
    {Ход программы}
  s := 0;
  write('Введите число: ');
  readln(n);
  e := n;
  if n <= 100 then 
  begin
    while n > 0 do
    begin
      s := s + (n mod 10);
      n := (n div 10);
    end; 
    writeln('Сумма цифр числа ', e, ' => ', s);
    writeln(t, 'Сумма цифр числа ', e, ' => ', s);
  end else
  begin
    writeln('Число ', e, ' не удовлетворяет условиям');
    writeln(t, 'Число ', e, ' не удовлетворяет условиям');
  end;
  close(t);
end.