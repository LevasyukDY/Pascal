program NUM339a;

const
  n = 10;

var
  a: array[1..n] of integer;
  i, g, b: integer;
  t: text;
  ex: string;

begin
    {Запись в текстовый файл}
  assign(t, 'NUM339a.txt');
  append(t);
  
    {Для повторного запуска программы}
  repeat
    
    {Ход программы}
    for i := 1 to n do
    begin
      write('a[', i, ']=');
      readln(a[i]);
    end;
    
    writeln('Исходный массив:');
    writeln(t, 'Исходный массив:');
    
    for i := 1 to n do
    begin
      write('a[', i, ']=', a[i], ' ');
      write(t, 'a[', i, ']=', a[i], ' ');
    end;
    
    writeln;
    writeln(t);
    writeln('В массив входят по 1 разу:');
    writeln(t, 'В массив входят по 1 разу:');
    
    for i := 1 to n do
    begin
      b := 0;
      for g := 1 to n do
        if a[i] = a[g] then b := b + 1;
      if b = 1 then 
      begin
        write(a[i], ' ');
        write(t, a[i], ' ');
      end;
    end;
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
    {Закрытие текстового файла}
  close(t);
end.
