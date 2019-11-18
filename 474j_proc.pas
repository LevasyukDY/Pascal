procedure filling_array(nn: byte; var m: mass);//заполнение массива
var
  i: byte;
begin
  m[1] := 1;
  for i := 2 to nn do
    m[i] := m[i-1] + 1/i;
end;

procedure write_array_file(f: file of real; nn: byte; var m: mass);//вывод в файл
var
  i: byte;
begin
  for i := 1 to nn do
    write(f, m[i]);
end;

procedure print_array(nn: byte; var m: mass);//вывод в программу
var
  i: byte;
begin
  for i := 1 to nn do
    write(m[i]:6:2);
end;