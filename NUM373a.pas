program NUM373a;

var
  a: array[1..99, 1..99] of integer;
  n, i, j: integer;
  sr: real;
  t: text;
  ex: string;

  {$include 'NUM373a_procedure.txt'}

begin

    {Для повторного запуска программы}
  repeat

    {Запись в текстовый файл}
  assign(t, 'NUM373a.txt');
  append(t);
  
      {Ход программы}
    
    //Ввод элементов
    write('Введите n: '); readln(n);
    
    vvod;
    
    //Вывод элементов
    writeln(t);
    writeln(t);
    write('Массив:');
    write(t, 'Массив:');
    
    vivod;
    
    //Вывод среднего арифметического каждого столбца
    writeln;
    writeln('Среднее арифметическое каждого столбца:');
    writeln(t);
    writeln(t,'Среднее арифметическое каждого столбца:');
    
    for j := 1 to 9 do
    begin
      sr := 0;
      for i := 1 to n do
        sr := sr + a[i, j];
      write(sr / n:0:2, ' ');
      write(t, sr / n:0:2, ' ');
    end;
    writeln(t);
    writeln(t);
    {Закрытие текстового файла}
  close(t);
  
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
end.
