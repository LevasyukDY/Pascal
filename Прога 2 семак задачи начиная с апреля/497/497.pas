program num_497;

uses mod_497;

var
  f, g: typ_fil;

begin
  assign(f, 'input.txt');
  assign(g, 'output.txt');
  reset(f);
  rewrite(g);
  
  seek(f, filesize(f));
  write(f, ' ');
  seek(f, 0);
  Main_Work(g, f);
  
  close(f);
  close(g);
  
  writeln('Запись в файл прошла успешно...');
end.