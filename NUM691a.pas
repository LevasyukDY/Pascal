program NUM691a;

const
  n = 8;

type
  amr = array[1..n, 1..n] of integer;

var
  t: text;
  ex: string;
  a: amr;
  i, j: integer;

begin
  
    {Для повторного запуска программы}
  repeat
    
    {Запись в текстовый файл}
    assign(t, 'NUM691a.txt');
    append(t);
    
      {Ход программы}
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        if odd(j) then a[i, j] := n * (j - 1) + i
        else a[i, j] := n * j - i + 1;
        write(a[i, j]:4);
        write(t, a[i, j]:4);
      end;
      writeln;
      writeln(t);
    end;
    
    {Закрытие текстового файла}
    close(t);
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
end.