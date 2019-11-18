program NUM243a;

var
  n, x, y: integer;
  t: text;
  ex: string;
  f, k: boolean;

begin
    {Запись в текстовый файл}
  assign(t, 'NUM243a.txt');
  append(t);
  
    {Для повторного запуска программы}
  repeat
    
    {Ход программы}
    write('Введите натуральное число n=');readln(n);
    
    f := true; k := false;
    
    for x := 1 to trunc(sqrt(n)) do 
    begin
      for y := 1 to trunc(sqrt(n)) do 
        if n = sqr(x) + sqr(y) then 
        begin
          writeln('При введённом n=', n, ' получили x=', x, ' y=', y);
          writeln(t, 'При введённом n=', n, ' получили x=', x, ' y=', y);
          f := false;k := true;
          break
        end;
      if not (f) then break;
    end;
    
    {Выход из программы или продолжение}
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
    {Закрытие текстового файла}
  close(t);
end.