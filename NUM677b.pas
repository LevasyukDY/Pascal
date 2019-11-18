program NUM677b;

const
  n = 3;

type
  arr = array[1..n, 1..n] of integer;

var
  a, b: arr;
  i, j, k, l: byte;
  sum: integer;
  t: text;
  ex: string;

begin
    {Для повторного запуска программы}
  repeat
    
    {Запись в текстовый файл}
    assign(t, 'NUM677b.txt');
    append(t);
    
      {Ход программы}
    writeln('Матрица A:');
    writeln(t, 'Матрица A:');
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        a[i, j] := random(10);
        write(a[i, j]:4);
        write(t, a[i, j]:4);
      end;
      writeln;
      writeln(t);
    end;
      
      writeln;
      writeln(t);

    // Подсчёт суммы:
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        
      end;
      writeln;
      writeln(t);
    end;

    
  {  writeln('Матрица B:');
    writeln(t, 'Матрица B:');
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        if (i = 4) or (j = 1) then
        begin
          write(a[i, j]:4);
          write(t, a[i, j]:4);
        end
        else
        begin
          write(sum:4);
          write(t, sum:4);
        end;
      end;
      writeln;
      writeln(t);
    end; }
    
    {Закрытие текстового файла}
    close(t);
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "ex", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'ex');
end.