program NUM694k;

type
  amr = array[0..100, 0..100] of integer;

var
  t: text;
  ex: string;
  a: amr;
  i, j, n, k: byte;

  {$include 'NUM694_procedure.txt'}

begin
  
    {Для повторного запуска программы}
  repeat
    
    {Запись в текстовый файл}
    assign(t, 'NUM694k.txt');
    append(t);
    
      {Ход программы}
    
    write('Введите n<=100, n = ');
    readln(n);
    
    MainDiaN(a, n);
    
    Output(a, n);
    FileOutput(a, n, t);
    
    {Закрытие текстового файла}
    close(t);
    
    {Выход из программы или продолжение}
    writeln;
    writeln('Для выхода из программы напишите "exit", для продолжения введите любой символ');
    readln(ex);
  until (ex = 'exit');
  
end.