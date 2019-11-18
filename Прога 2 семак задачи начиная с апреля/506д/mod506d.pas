unit mod506d;

interface

type
  baggage = record
    weight: real;
    sum: integer;
  end;
  ft = file of baggage;

procedure Bagaj(var f: ft);
procedure passenger(var f: ft; var t: text);
procedure write_in_text(var f: ft; var t: text);

implementation

{заполнение типизированного файла}
procedure Bagaj(var f: ft);
var
  i, n: integer; k: baggage;
begin
  rewrite(f);
  write('Введите количество пассажиров: ');
  readln(n);
  for i := 1 to n do
  begin
    with k do 
    begin
      write('Багаж ', i, ' пассажира: ');
      write('Введите количество вещей: ');
      readln(sum);
      write('Введите общий вес вещей (в кг): ');
      readln(weight);
      write(f, k);
    end;
  end;
  close(f);
end;

{определение пассажира, багаж которого состоит из 1 вещи и >= 30 кг}
procedure passenger(var f: ft; var t: text);
var
  w: baggage; a, i, db: byte;
begin
  a := 0;
  i := 0; 
  while not eof(f) do
  begin
    i := i + 1;
    read(f, w);
    if (w.sum = 1) and (w.weight >= 30) then
    begin
      a := a + 1;
      db := i;
    end;
  end;
  writeln(t);
  if (a = 1) then 
    writeln(t, 'Имеется такой пассажир. Номер его багажа ', db)
  else
  begin
    if (a > 1) then writeln(t, 'Имеется несколько таких пассажиров')
    else writeln(t, 'Такого пассажира нет');
  end;
  writeln(t);
  write(t, '-----------------------------------------');
  writeln(t, '---------------------------------------');
  writeln(t);
end;

{вывод данных из тип. файла в текстовый}
procedure write_in_text(var f: ft; var t: text);
var
  w: baggage; k: integer;
begin
  k := 0;
  write(t, 'Имеется ли пассажир, багаж которого состоит');
  writeln(t, ' из одной вещи весом не менее 30 кг?');
  writeln(t);
  writeln(t, '| № багажа | Кол-во вещей | Общий вес вещей |');
  while not eof(f) do
  begin
    k := k + 1;
    read(f, w);
    writeln(t, k:7, w.sum:13, w.weight:15, ' кг');
  end;
  seek(f, 0);
end;

begin
end.  