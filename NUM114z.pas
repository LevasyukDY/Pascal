program NUM114z;

var
  i, n, f: longint;
  r: real;
  t: text;

begin
  assign(t, 'NUM114z.txt');
  append(t);
  {Ход программы}
  readln(n);
  r := 1;
  f := 1;
  for i := 2 to n do
  begin
    f := f * i;
    r := r * sqr(1 - 1 / f);
  end;
  writeln('При n=', n, ' получили ', r:0:5);
  writeln(t, 'При n=', n, ' получили ', r:0:5);
  close(t);
end.