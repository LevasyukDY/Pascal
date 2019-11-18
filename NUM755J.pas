program NUM755j;

var
  x, e, sum, f: real;
  k: integer;
  t: text;
  ex: string;

  {$include 'NUM755j_function.txt'}

begin
  
    {Для повторного запуска программы}
  repeat
    
    {Запись в текстовый файл}
    assign(t, 'NUM755j.txt');
    append(t);
    
      {Ход программы}
    
    write('Введи x: '); readln(x);
    write('Введи e: '); readln(e);
    sum := 0.0;
    k := 0;
    repeat
      f := (exponent(-1.0, k + 1) * exponent(x, 2 * k - 1)) / ((2 * k - 1) * FACT(2 * k + 1));
      sum := sum + f;
      k := k + 1;
    until abs(f) < e;
    writeln('При x=',x,' и e=',e,' получили s=', sum:0:3, ' k=',k);
    writeln(t, 'При x=',x,' и e=',e,' получили s=', sum:0:3, ' k=',k);
    
    {Закрытие текстового файла}
    close(t);
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
end.