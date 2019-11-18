program NUM201j;

type
  mass = array[1..99] of real;

var
  a,b: mass;
  max: real;
  i, n: integer;
  t: text;
  ex: string;

begin
    {Запись в текстовый файл}
  assign(t, 'NUM201j.txt');
  append(t);
  
    {Для повторного запуска программы}
  repeat
    
    {Ход программы}
    write('Введите n='); readln(n);
    
    writeln('Исходный массив:');
    writeln(t, 'Исходный массив:');
    for i := 1 to n do 
    begin
      a[i] := random * 100;
      write(a[i]:7:2);
      write(t, a[i]:7:2)
    end;
    writeln;
    writeln(t);
    
    writeln('Новый массив:');
    writeln(t, 'Новый массив:');
    for i := 1 to n do 
    begin
    if i mod 2 <> 0 then 
      b[i] := (-1) * a[i] {Надо сделать без функции Power}
    else
      b[i]:= a[i];
      write(b[i]:7:2);
      write(t, b[i]:7:2)

    end;
    writeln;
    writeln(t);
    
    max := b[1];
    for i := 2 to n do
    begin
      if b[i] > max then max := b[i];
    end;
    writeln('Максимальное число = ', max:0:2);
    writeln(t, 'Максимальное число = ', max:0:2);
    writeln(t);
    
      {Выход из программы или продолжение}
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
    {Закрытие текстового файла}
  close(t);
end.