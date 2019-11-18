program NUM162;

var
  t: text; {Текстовый файл} 
  ex: string;
  A: array[1..100] of real;
  i, j, n: byte;
  sr, s: real;

begin
    {Запись в текстовый файл}
  assign(t, 'NUM162.txt');
  append(t);
  
    {Для повторного запуска программы}
  repeat
    
    {Ход программы}
    write('Введите n: ');readln(n);
    repeat
      write('Введите i: ');readln(i);
    until i in [1..n];
    for j := 1 to n do
    begin
      A[j] := random * 100;
      write(A[j]:0:2, ' ');
      write(t, A[j]:0:2, ' ');
      if i <> j then s := s + A[j];
    end;
    sr := s / (n - 1);
    writeln;
    writeln('Среднее арифметическое без A[', i, '] => ', sr:0:2);
    writeln(t);
    writeln(t, 'Среднее арифметическое без A[', i, '] => ', sr:0:2);
    
    {Выход из программы или продолжение}
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
    {Закрытие текстового файла}
  close(t);
end.