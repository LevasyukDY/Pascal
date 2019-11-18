program NUM138;

const
  n = 70;

var
  a: array[1..n] of integer; {массив от 1 до n}
  i: integer; {порядковый номер эл-та}
  t: text; {текстовый файл}
  h: string; {переменная для выбора ввода}
  c: integer; {для замены эл-ов}
  pr: string;

begin
  
  assign(t, 'NUM138.txt');
  append(t);
  
  repeat
    
    {Выбор ввода элементов}
    writeln('Введи 1 для ручного ввода или 2 для случайного');
    readln(h);
    
    if h = '1' then  {Ввод вручную}
      for i := 1 to n do
      begin
        write('a', i, ' = '); readln(a[i]);
      end
    
    else
    
      for i := 1 to n do  {Случайный ввод}
      begin
        a[i] := random(1, 100);
      end;
    
    {Вывод в текстовый файл исходного массива}
    writeln(t);
    writeln(t, 'Исходный массив:');
    for i := 1 to n do
      writeln(t, a[i]);
    
    c := a[1];
    a[1] := a[70];
    a[70] := c;
    
    {Вывод на экран}
    writeln;
    for i := 1 to n do
      writeln(a[i]);
    {Вывод в текстовый файл}
    writeln(t);
    writeln(t, 'Изменённый массив:');
    for i := 1 to n do
      writeln(t, a[i]);
    
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(pr);
  until (pr = 'exit');
  
  close(t);
end.