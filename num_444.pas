program num_444;

const
  z = 100;

type
  mass = array [1..z] of real;

var
  x, y: mass;
  n: integer;
  f: text;
  ex: string;

  {$include 'num_444_procedure_function.txt'}

begin
  
    {Для повторного запуска программы}
  repeat
    
    {Запись в текстовый файл}
    assign(f, 'num_444.txt');
    append(f);
    
    {Ход программы}
    write('Количество вершин (не больше 100): '); readln(n);
    writeln('Внимание: Вводите координаты против часовой стрелки!');
    
    InputVer(x, y, n);
    
    writeln;
    
    OutputVer(x, y, n);
    FileOutputVer(x, y, n, f);
    
    writeln;
    writeln(f);
    
    writeln('Площадь многоугольника = ', PolygonArea(x, y, n));
    writeln(f, 'Площадь многоугольника = ', PolygonArea(x, y, n));
    
    writeln;
    writeln(f);
    
    {Закрытие текстового файла}
    close(f);
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
end.