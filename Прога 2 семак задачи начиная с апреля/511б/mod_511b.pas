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

{заполнение типизированного файла}
procedure InputBooks(var f: ft);
var
  i, n: integer; k: books;
begin
  rewrite(f);
  write('Введите количество книг: ');
  readln(n);
  for i := 1 to n do
  begin
    with k do 
    begin
      write('Книга №', i, ' / ');
      write('Введите фамилию автора: ');
      readln(fam_aut);
      write('Введите название книги: ');
      readln(name_of_book);
      write('Введите год издания книги: ');
      readln(year);
      write(f, k);
    end;
  end;
  close(f);
end;

{вывод данных из тип. файла в текстовый}
procedure Write_In_Text(var f: ft; var t: text);
var
  w: books; k: integer;
begin
  k := 0;
  writeln(t, 'Имеется ли книга с названием "Информатика"?');
  writeln(t);
  writeln(t, '| № книги | Фамилия автора |    Название    | Год издания |');
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

{определение книги с названием "информатика"}
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
    if (w.name_of_book = 'Информатика') then
    begin
      a := a + 1;
      if (a = 1) then 
      begin
        writeln(t, 'Найденные книги:');
        writeln(t);
      end;
      writeln(t, '| №', i, ' | Автор: ', w.fam_aut, 
        ' | ':17 - Length(w.fam_aut), 'Год издания: ', w.year, ' |');
    end
  end;
  if (a = 0) then writeln(t, 'Книг с названием "Информатика" не найдено');
  writeln(t);
  writeln(t, '-----------------------------------------------------------');
  writeln(t);
end;

begin
end.  