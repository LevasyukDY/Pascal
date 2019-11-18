program NUM145a;

type
  lol = array [1..100] of real;

var
  i, j, n, l, k, m: integer;
  x: lol;
  t: text;

begin
  assign(t, 'NUM145a.txt');
  append(t);
  
  write('Введите размерность матрицы = ');
  read(n);
  
  x[1] := 0;
  x[2] := 5 / 8;
  
  for i := 3 to n do
    x[i] := x[i - 1] / 2 + (3 / 4) * x[i - 2];
  
  write('Введите число элементов в строке массива = ');
  readln(l); 
  
  writeln('  Вывод массива:');
  writeln(t, '  Вывод массива:');
  
  k := n div l; {Кол-во строк} 
  m := n mod l; {Кол-во элементов в последней неполной строке} 
  
  for i := 0 to (k - 1) do 
  begin
    for j := 1 to l do 
    begin
      write(x[i * l + j]:8:3); 
      write(t, x[i * l + j]:8:3);
    end;
    writeln('');
    writeln(t, '');
  end; 
  
  if m > 0 then 
  begin
    for j := 1 to m do 
    begin
      write(x[k * l + j]:8:3);
      write(t, x[k * l + j]:8:3);
    end;
  end;
  
  close(t);
end.
