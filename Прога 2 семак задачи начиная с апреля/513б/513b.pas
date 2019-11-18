program num_511b;

uses mod_513b;

var
  f: ft;
  t: text;
  ch: char;

begin
  assign(f, 'books.dat');
  assign(t, 'output.txt');
  append(t);
  reset(f);
  
  
  
  close(f);
  close(t);
end.