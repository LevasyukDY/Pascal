program num_430;

const
  n = 5;

type
  mass = array [1..n] of real;

var
  k, l, m: integer;
  x, y, z: mass;
  t: real;
  f: text;
  ex: string;
  i, j: byte;

  {$include 'num_430_procedure_function.txt'}

begin
  
    {Для повторного запуска программы}
  repeat
    
    {Запись в текстовый файл}
    assign(f, 'num_430.txt');
    append(f);
    
    {Ход программы}
    writeln('Введите последовательность x:');
    InputImass(x, n);
    
    writeln('Исходная последовательность x:');
    Output(x, n);
    
    writeln(f, 'Исходная последовательность x:');
    FileOutput(x, n, f);
    
    if maximum(x, n) < 0 then 
    begin
      t := 1 + Power(maximum(x, n), 2);
    end
    else
    begin
      
      writeln('Введите последовательность y:');
      InputImass(y, n);
      writeln('Введите последовательность z:');
      InputImass(z, n);
      
      writeln('Исходная последовательность y:');
      Output(y, n);
      writeln('Исходная последовательность z:');
      Output(z, n);
      
      writeln(f, 'Исходная последовательность y:');
      FileOutput(y, n, f);
      writeln(f, 'Исходная последовательность z:');
      FileOutput(z, n, f);
      
      t := (maximum(y, n) + maximum(z, n)) / 2;
      
    end;
    
    writeln;
    writeln('t = ', t);
    writeln(f);
    writeln(f, 't = ', t);
    
    {Закрытие текстового файла}
    close(f);
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
end.