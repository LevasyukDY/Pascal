program NUM76b;

var
  k, l, m, n: byte; {координаты}
  t: text;{текстовый файл}

begin
  assign(t, 'NUM76b.txt');
  append(t);
    {Ввод координат}
  writeln('Введите координаты поля ферзя:');
  write('x='); read(k); write('y='); read(l);
  writeln('Введите координаты поля, которое нужно проверить:');
  write('x='); read(m); write('y='); read(n);
    {Проверка угрозы}
  if (k <= 8) and (l <= 8) and (m <= 8) and (n <= 8) then 
  begin
    if (k = m) or (l = n) or (abs(k - m) = abs(l - n)) then 
    begin
      writeln('Да, ферзь в x=', k, ' и y=', l, ' угрожает полю x=', m, ' y=', n);
      writeln(t, 'Да, ферзь в x=', k, ' и y=', l, ' угрожает полю x=', m, ' y=', n);
    end
    else 
    begin
      writeln('Нет, ферзь в x=', k, ' и y=', l, ' не угрожает полю x=', m, ' y=', n);
      writeln(t, 'Нет, ферзь в x=', k, ' и y=', l, ' не угрожает полю x=', m, ' y=', n);
    end;
  end
    else 
  begin
    writeln('Вы ввели некорректные координаты'); 
  end;
  close(t);
end.