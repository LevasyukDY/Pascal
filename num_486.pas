program num_486;

var
  f, g, h: file of char; 
  a: char; 
  i: integer;

begin
  assign(f, 'file1.txt');
  assign(g, 'file2.txt');
  assign(h, 'file3.txt');
  reset(f);
  reset(g);
  rewrite(h);
  
  for i := 1 to filesize(f) do
  begin
    read(f, a);
    write(h, a);
  end;
  
  for i := 1 to filesize(g) do
  begin
    read(g, a);
    write(h, a);
  end;
  
  close(f);
  close(g);
  close(h);
  
  writeln('запись в файл прошла успешно...');
end.