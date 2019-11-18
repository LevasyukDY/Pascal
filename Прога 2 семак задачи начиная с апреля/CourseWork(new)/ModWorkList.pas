unit ModWorkList;

interface
uses SysUtils, Dialogs;

type

 BD_products = record//запись данных о продажах товаров в магазине
   code: integer; //код товара
   nameT: string[50]; //наименование товара
   price: real; //стоимость покупки
   date: string[8];//дата продажи
   sum: integer;//количество проданного товара
   ed_iz: string[20];//единица измерения товара
   Fam,Name,Otch: string[20];//ФИО продавца
 end;
  
 PUzel = ^Sp;//тип указателя
 Sp = record//тип узла
   x: BD_products;
   next, pred: PUzel;
 end;
 
 ft = file of BD_products;

procedure AddFirst(var f, a: PUzel);//вставка узла в голову списка
procedure AddAfter(var old: PUzel; a: PUzel);//вставка узла после old
procedure BuildSpisok(var f: PUzel);//создание списка с нуля
procedure DelFirstElement(var f, a: PUzel);//выделение элемента, с начала
procedure DelSpisok(var f: PUzel);//удаление списка, начиная с головы
procedure write_in_text(var t: text; var f: PUzel);//запись в текстовый файл
procedure write_in_tip_file(var f: PUzel; var tipf: ft);//запись в
//типизированный файл
procedure RTF(var f:PUzel;var tipf:ft);//восстановление списка из
//типизированного файла
procedure FindPosEl(var f, PosEl: PUzel);//определение позиции элемента
procedure DelElement(var a:PUzel);//выделение элемента
procedure Search_by_name(var f:PUzel);//поиск товара по названию
procedure Search_by_code(var f: PUzel);//поиск товара по коду
procedure InsertInHead(var f: PUzel);//вставка элемента в начало списка
procedure InsertAnyPos(var f: PUzel);//вставка элемента в любую позицию
procedure VolOfSale(var f: PUzel);//рассчет объема продаж за день
procedure Delete1(var f: PUzel);//удаление любого элемента списка
procedure Change_Element(var f: PUzel);//изменение полей записи

implementation

 {вставка узла a в голову f}
procedure AddFirst(var f, a: PUzel);
begin
  a^.next:=f;
  if f<> nil then f^.pred:=a;
  f:=a;
end;

 {добавление элементов списка}
procedure AddAfter(var old: PUzel; a: PUzel);
begin
  a^.next := old^.next;
  old^.next := a;
  a^.pred := old;
end;

 {создание списка}
procedure BuildSpisok(var f: PUzel);
var
  a, d: PUzel; ch: PChar;
begin
 f := nil;
 repeat
  new(a);
 with a^.x do
  begin
   code := StrToInt(InputBox('Введите код товара: ','',''));
   nameT := InputBox('Введите наименование товара: ','','');
   ed_iz := InputBox('Введите ед. измерения товара:','','');
   price := StrToFloat(InputBox('Введите стоимость покупки: ','',''));
   date := InputBox('Введите дату продажи:','ДД.ММ.ГГ','');
   sum := StrToInt(InputBox('Введите количество продаж: ','',''));
   Fam := InputBox('Введите фамилию продавца:','','');
   Name := InputBox('Введите имя продавца:','','');
   Otch := InputBox('Введите отчество продавца:','','');
  end;
   if (f = nil) then
    begin
    AddFirst(f, a); d := f;
    end else
    begin
    AddAfter(d, a); d := a;
    end;
   ch := PChar(InputBox('Чтобы закончить введите Y','',''));
   until (ch = 'Y') or (ch = 'y');
end;

 {выделение первого эл-та из списка}
 procedure DelFirstElement(var f, a: PUzel);
 begin
  a := f;//получили указатель на выделяемый узел
  f := f^.next;
  if (f <> nil) then f^.pred := nil;
  a^.next := nil;
 end;
 
 {удаление списка}
 procedure DelSpisok(var f: PUzel);
  var a: PUzel;
   begin
    while (f <> nil) do
     begin
      DelFirstElement(f, a);
      dispose(a);
     end;
   end;
 
 {вывод в текстовый файл}  
procedure write_in_text(var t: text; var f: PUzel);
  var p: PUzel;
  begin
    p := f;
write(t,'Код товара','|',' Наименование':20,'|');
write(t,' Ед. измерения','|',' Цена':14,'|',' Дата продажи','|');
writeln(t,' Количество','|',' Продавец');
writeln(t);
  while (p <> nil) do
   begin
   with p^.x do
     begin
   write(t, code:8,' | ', nameT:20,' | ',ed_iz:10,' | ',
   price:10:2,' р. | ',date:8,' | ');
   writeln(t, sum:8,' | ',Fam:8,' ',Name[1],'.',Otch[1],'.');
    p := p^.next;
     end;
   end;
  end;

 {вывод в типизированный файл}
procedure write_in_tip_file(var f: PUzel; var tipf: ft);
var p: PUzel;
begin
 p := f;
 while (p <> nil) do
  begin
  write(tipf, p^.x);
  p := p^.next;
  end;
end;

{восстановление данных из типизированного файла}
procedure RTF(var f:PUzel;var tipf:ft);
    var a,d: PUzel;
    begin
     f:=nil;
     Seek(tipf,0);
     while not Eof(tipf) do
      begin
       New(a);
       read(tipf,a^.x);
       if f=nil then
           begin
            AddFirst(f,a); d:=f;
           end
         else
           begin
            AddAfter(d,a); d:=a;
           end;
       end;
    end;

 {определение позиции элемента}
   procedure FindPosEl(var f, PosEl: PUzel);
    var p{,old}: PUzel; m,n,i: integer; s:string;
     begin
      PosEl := nil;
      n := 0;
      p := f;
      while (p <> nil) do
      begin
       n := n+1;
       p := p^.next;
      end;
      s := 'Количество элементов в списке: '+IntToStr(n);
      ShowMessage(s);
      m := StrToIntDef(InputBox('',
      'Введите номер элемента,'+#13+#10+
      'после которого хотите добавить новый:',''),0);
      if m=0 then exit;
      if m>n then
      begin
      ShowMessage('Введеный номер больше, чем элементов в списке');
      exit;
      end;
      p := f;
      for i:=1 to (m-1) do
       p := p^.next;
      PosEl := p;
     end;

  {выделение элемента и передача указателя на него пользователю}
    procedure DelElement(var a:PUzel);
    var old: PUzel;
    begin 
    if (a^.next=nil) then//если удаляем последний элемент
    begin
      old:=a^.pred;
      a := old^.next;
      old^.next := nil;
    end else
     begin
     old := a^.pred;//если элемент в любой позиции
     a:=old^.next;
     old^.next:=a^.next;
     old^.next^.pred:=old;
     end;
    end;

  {поиск товара по названию}
   procedure Search_by_name(var f:PUzel);
   var
      p: PUzel; key,s: string; t: text; d: boolean;
   begin
   AssignFile(t, 'Данные о товарах.txt');
   Rewrite(t);
     if (f = nil) then
      ShowMessage('Список пуст!')
     else
     begin
      p:=f;
      d:=false;
      key := InputBox('Введите название товара:','','');
      while (p <> nil) do
       begin
       if (p^.x.nameT = key) then
        begin
        d := true;
        with p^.x do
          begin
        s:='Данные о товаре: '+nameT+', '+FloatToStr(price)+' р.'+
        #13#10+'Ед. изм: '+ed_iz+
        #13#10+'Количество продаж: '+IntToStr(sum)+
        #13#10+'Код товара: '+IntToStr(code)+
        #13#10+'Дата продажи: '+date+
        #13#10+'Работал: '+Fam+' '+Name[1]+'.'+Otch[1]+'.';
        ShowMessage(s);
        writeln(t,s);
        writeln(t);
          end;
        end;
       p:=p^.next;
       end;
       if (not d) then ShowMessage('Товар '+key+' не найден.');
     end;
    CloseFile(t);
   end;

   {поиск товара по коду}
    procedure Search_by_code(var f: PUzel);
    var key: integer; p: PUzel; s: string; d: boolean;
    t: text;
    begin
   AssignFile(t, 'Данные о товарах2.txt');
   Rewrite(t);
     if (f = nil) then
      ShowMessage('Список пуст!')
     else
     begin
      p:=f;
      d:=false;
      key := StrToIntDef(InputBox('Введите код товара:','',''),0);
      while (p <> nil) do
       begin
       if (p^.x.code = key) then
        begin
        d := true;
        with p^.x do
          begin
        s:='Данные о товаре: '+nameT+', '+FloatToStr(price)+' р.'+
        #13#10+'Ед. изм: '+ed_iz+
        #13#10+'Количество продаж: '+IntToStr(sum)+
        #13#10+'Код товара: '+IntToStr(code)+
        #13#10+'Дата продажи: '+date+
        #13#10+'Работал: '+Fam+' '+Name[1]+'.'+Otch[1]+'.';
        ShowMessage(s);
        writeln(t,s);
        writeln(t);
          end;
        end;
       p:=p^.next;
       end;
       if (not d) and (key <> 0) then
       ShowMessage('Товар с кодом '+IntToStr(key)+' не найден.');
     end;
    CloseFile(t);
    end;

   {удаление любого элемента}
   procedure Delete1(var f: PUzel);
   var m: integer; p, num: PUzel; d: boolean;
   begin
   if (f = nil) then
    begin
      ShowMessage('Список пуст!');
      exit;
    end;  
    p := f;
    d := false;
      m := StrToIntDef(InputBox('Введите код товара','',''),0);
      if m=0 then exit;
      while (p <> nil) do
      begin
      if (p^.x.code = m) then
      begin
       d := true;
       num := p;
      end;
       p := p^.next;
      end;
       if (not d) then ShowMessage('Товар не найден.')
       else
       begin
        ShowMessage('Товар '+num^.x.nameT);
        if (num = f) then
        begin
         DelFirstElement(f,num);
         dispose(num)
        end
        else
        begin
         DelElement(num);
         dispose(num);
        end;
        end;
   end;

   {вставка элемента в начало списка}
   procedure InsertInHead(var f: PUzel);
   var a: PUzel;
     begin
      if (f = nil) then
      begin
        ShowMessage('Список пуст!');
        exit;
      end;
      new(a);
  with a^.x do
   begin
    code := StrToInt(InputBox('Введите код товара: ','',''));
    nameT := InputBox('Введите наименование товара: ','','');
    ed_iz := InputBox('Введите ед. измерения товара:','','');
    price := StrToFloat(InputBox('Введите стоимость покупки: ','',''));
    date := InputBox('Введите дату продажи:','ДД.ММ.ГГ','');
    sum := StrToInt(InputBox('Введите количество продаж: ','',''));
    Fam := InputBox('Введите фамилию продавца:','','');
    Name := InputBox('Введите имя продавца:','','');
    Otch := InputBox('Введите отчество продавца:','','');
   end;
  AddFirst(f, a);
     end;

   {вставка элемента в любую позицию}
   procedure InsertAnyPos(var f: PUzel);
   var a, PosEl: PUzel;
     begin
     if (f = nil) then
     begin
       ShowMessage('Список пуст!');
       exit;
     end;
     FindPosEl(f, PosEl);
     if (PosEl = nil) then exit;
  new(a);
  with a^.x do
   begin
    code := StrToInt(InputBox('Введите код товара: ','',''));
    nameT := InputBox('Введите наименование товара: ','','');
    ed_iz := InputBox('Введите ед. измерения товара:','','');
    price := StrToFloat(InputBox('Введите стоимость покупки: ','',''));
    date := InputBox('Введите дату продажи:','ДД.ММ.ГГ','');
    sum := StrToInt(InputBox('Введите количество продаж: ','',''));
    Fam := InputBox('Введите фамилию продавца:','','');
    Name := InputBox('Введите имя продавца:','','');
    Otch := InputBox('Введите отчество продавца:','','');
   end;
    AddAfter(PosEl, a);
     end;

  {расчет объема продаж за день}
  procedure VolOfSale(var f: PUzel);
  var
     p: PUzel; d:string[8]; t: text;
     ras, s: real; st: string; key: boolean;
  begin
  AssignFile(t,'Отчет по объему продаж.txt');
  Rewrite(t);
    key := false;
    p := f;
    s := 0;
    d := InputBox('Введите дату:','ДД.ММ.ГГ','');
    st := 'Отчет за '+d;
    writeln(t, st);
    while (p <> nil) do
      begin
        with p^.x do
          begin
           if (d = date) then
            begin
             key := true;
             ras := price * sum;//расчет выручки за отдельный товар
             s := s + ras;//общая сумма всех продаж
             st := 'Товар: '+nameT+', выручка: '+FloatToStr(ras)+' р.';
             writeln(t, st);
            end;
          end;
       p := p^.next;
      end;
      if key then
      writeln(t, 'Общая выручка: ',s:0:2,' р.') else
      writeln(t, 'За указанный день не было продаж');
    CloseFile(t);
  end;

  {изменение полей записи}
  procedure Change_Element(var f: PUzel);
  var p: PUzel; code1, m: integer; s: string;
  d: boolean;
  begin
  if (f = nil) then
   begin
     ShowMessage('Список пуст!');
     exit;
   end;
   d := false;
   p := f;
   code1 := StrToIntDef(InputBox('Поиск товара для изменения',
   'Введите код товара:',''),0);;
   if code1=0 then exit;
   while (p <> nil) do
   begin
     with p^.x do
     begin
      if (code1=code) then
       begin
         d := true;
         ShowMessage('Товар: '+nameT);
         s := '1 - код товара'+
         #13#10+'2 - название товара'+
         #13#10+'3 - ед. измерения'+
         #13#10+'4 - стоимость покупки'+
         #13#10+'5 - дату продажи'+
         #13#10+'6 - количество продаж'+
         #13#10+'7 - ФИО продавца';
         repeat
         m := StrToIntDef(InputBox('Выберите, что хотите изменить:',s,''),0);
         case m of
         1: code := StrToInt(InputBox('Введите код товара','',''));
         2: nameT := InputBox('Введите название товара','','');
         3: ed_iz := InputBox('Введите ед. измерения','','');
         4: price := StrToFloat(InputBox('Введите стоимость покупки: ','',''));
         5: date := InputBox('Введите дату продажи:','ДД.ММ.ГГ','');
         6: sum := StrToInt(InputBox('Введите количество продаж: ','',''));
         7: begin
             Fam := InputBox('Введите фамилию продавца:','','');
             Name := InputBox('Введите имя продавца:','','');
             Otch := InputBox('Введите отчество продавца:','','');
            end;
         end;
         until (m = 0);
       end;
     end;
     p := p^.next;
   end;
   if not d then ShowMessage('Товар не найден');
  end;

end.
