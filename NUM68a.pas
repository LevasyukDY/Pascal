program NUM68a;

var
  n, i, m, r: integer;
  t: text;

begin
  assign(t, 'NUM68a.txt');
  append(t);
      {Ход программы}
  repeat
    write('Введите натуральное четырехзначное число: ');
    readln(n);
  until (n < 10000);
  m := n;
  r := 0;
  for i := 1 to 4 do
  begin
    r := 10 * r + m mod 10;
    m := m div 10;
  end;
  if r = n then begin
    writeln('Число ', n, ' палиндром');
    writeln(t, 'Число ', n, ' палиндром');
  end
  else begin
    writeln('Число ', n, ' не палиндром');
    writeln(t, 'Число ', n, ' не палиндром');
  end;
  close(t);
end.