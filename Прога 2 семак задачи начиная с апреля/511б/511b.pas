program num_511b;

uses mod_511b;

var
  f: ft;
  t: text;
  ch: char;

begin
  assign(f, 'books.dat');
  assign(t, 'output.txt');
  append(t);

  writeln('Хотите сформировать новые записи?');
  write('Для этого нажмите клавишу y: ');
  readln(ch);
  if (ch = 'y') or (ch = 'Y') then
    InputBooks(f);
    
  reset(f);

  Write_In_Text(f, t);
  Book_Data(f, t);

  close(f);
  close(t);
end.