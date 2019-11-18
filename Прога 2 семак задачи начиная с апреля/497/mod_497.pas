unit mod_497;

interface 

type
  typ_fil = file of char;
  
procedure Print_in_File(var g: typ_fil; s: string);
procedure Main_Work(var g: typ_fil; f: typ_fil);

implementation 

procedure Print_in_File(var g: typ_fil; s: string);
var
  i: integer;
begin
  for i := 1 to length(s) do
    write(g, s[i]);  
end;

procedure Main_Work(var g: typ_fil; f: typ_fil);
var
  str: string; ch: char;
begin
  while not eof(f) do
  begin
    read(f, ch);
    if (ch <> ' ') then str := str + ch
    else if (length(str) = 1) then str := ''
    else if (length(str) > 1) then 
    begin
      str := str + ' ';
      Print_in_File(g, str);
      str := '';
    end;
  end;
end;

begin 
end. 