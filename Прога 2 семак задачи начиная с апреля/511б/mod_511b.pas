unit mod_511b;

interface

type
  books = record
    fam_aut, name_of_book: string[20];
    year: integer;
  end;
  ft = file of books;

procedure InputBooks(var f: ft);
procedure Write_In_Text(var f: ft; var t: text);
procedure Book_Data(var f: ft; var t: text);

implementation

{���������� ��������������� �����}
procedure InputBooks(var f: ft);
var
  i, n: integer; k: books;
begin
  rewrite(f);
  write('������� ���������� ����: ');
  readln(n);
  for i := 1 to n do
  begin
    with k do 
    begin
      write('����� �', i, ' / ');
      write('������� ������� ������: ');
      readln(fam_aut);
      write('������� �������� �����: ');
      readln(name_of_book);
      write('������� ��� ������� �����: ');
      readln(year);
      write(f, k);
    end;
  end;
  close(f);
end;

{����� ������ �� ���. ����� � ���������}
procedure Write_In_Text(var f: ft; var t: text);
var
  w: books; k: integer;
begin
  k := 0;
  writeln(t, '������� �� ����� � ��������� "�����������"?');
  writeln(t);
  writeln(t, '| � ����� | ������� ������ |    ��������    | ��� ������� |');
  while not eof(f) do
  begin
    k := k + 1;
    read(f, w);
    writeln(t, k:6, ' ':7, w.fam_aut, ' ':17 - Length(w.fam_aut), 
      w.name_of_book, ' ':19 - Length(w.name_of_book), w.year);
  end;
  seek(f, 0);
  writeln(t);
end;

{����������� ����� � ��������� "�����������"}
procedure Book_Data(var f: ft; var t: text);
var
  w: books; i, a: byte;
begin
  a := 0;
  i := 0; 
  while not eof(f) do
  begin
    i := i + 1;
    read(f, w);
    if (w.name_of_book = '�����������') then
    begin
      a := a + 1;
      if (a = 1) then 
      begin
        writeln(t, '��������� �����:');
        writeln(t);
      end;
      writeln(t, '| �', i, ' | �����: ', w.fam_aut, 
        ' | ':17 - Length(w.fam_aut), '��� �������: ', w.year, ' |');
    end
  end;
  if (a = 0) then writeln(t, '���� � ��������� "�����������" �� �������');
  writeln(t);
  writeln(t, '-----------------------------------------------------------');
  writeln(t);
end;

begin
end.  