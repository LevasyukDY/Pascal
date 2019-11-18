program NUM196;

var
  a: array [1..50] of integer; 
  i: integer;
  t: text;
  ex: string;

begin
    {Запись в текстовый файл}
  assign(t, 'NUM196.txt');
  append(t);
  
    {Для повторного запуска программы}
  repeat
    
    {Ход программы}
    writeln('Исходная последовательность:');
    writeln(t, 'Исходная последовательность:');
    
    for i := 1 to 50 do 
    begin
      a[i] := random(100);
      write(a[i], ' ');
      write(t, a[i], ' ');
    end;
    
    writeln;
    writeln('Новая последовательность:');
    writeln(t);
    writeln(t, 'Новая последовательность:');
    
    for i := 1 to 50 do 
    begin
      if a[i] mod 2 = 0 then 
      begin
        write(a[i], ' ');
        write(t, a[i], ' ');
      end
      else
      begin
        write(a[i] * 2, ' ');
        write(t, a[i] * 2, ' ');
      end;
    end;
    
      {Выход из программы или продолжение}
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
    {Закрытие текстового файла}
  close(t);
end.