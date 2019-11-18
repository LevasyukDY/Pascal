program num_506d;

uses mod506d;

var
  f: ft;
  t: text;
  ch: char;

begin
  assign(f, 'baggage.db');
  assign(t, 'output.txt');
  append(t);
  
  writeln('Хотите сформировать новые записи?');
  write('Для этого нажмите клавишу y: ');
  readln(ch);
  if (ch = 'y') or (ch = 'Y') then
    Bagaj(f);
  
  reset(f);
  
  write_in_text(f, t);
  passenger(f, t);
  
  close(f);
  close(t);
end.