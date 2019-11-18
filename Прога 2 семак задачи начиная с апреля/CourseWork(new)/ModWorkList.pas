unit ModWorkList;

interface
uses SysUtils, Dialogs;

type

 BD_products = record//������ ������ � �������� ������� � ��������
   code: integer; //��� ������
   nameT: string[50]; //������������ ������
   price: real; //��������� �������
   date: string[8];//���� �������
   sum: integer;//���������� ���������� ������
   ed_iz: string[20];//������� ��������� ������
   Fam,Name,Otch: string[20];//��� ��������
 end;
  
 PUzel = ^Sp;//��� ���������
 Sp = record//��� ����
   x: BD_products;
   next, pred: PUzel;
 end;
 
 ft = file of BD_products;

procedure AddFirst(var f, a: PUzel);//������� ���� � ������ ������
procedure AddAfter(var old: PUzel; a: PUzel);//������� ���� ����� old
procedure BuildSpisok(var f: PUzel);//�������� ������ � ����
procedure DelFirstElement(var f, a: PUzel);//��������� ��������, � ������
procedure DelSpisok(var f: PUzel);//�������� ������, ������� � ������
procedure write_in_text(var t: text; var f: PUzel);//������ � ��������� ����
procedure write_in_tip_file(var f: PUzel; var tipf: ft);//������ �
//�������������� ����
procedure RTF(var f:PUzel;var tipf:ft);//�������������� ������ ��
//��������������� �����
procedure FindPosEl(var f, PosEl: PUzel);//����������� ������� ��������
procedure DelElement(var a:PUzel);//��������� ��������
procedure Search_by_name(var f:PUzel);//����� ������ �� ��������
procedure Search_by_code(var f: PUzel);//����� ������ �� ����
procedure InsertInHead(var f: PUzel);//������� �������� � ������ ������
procedure InsertAnyPos(var f: PUzel);//������� �������� � ����� �������
procedure VolOfSale(var f: PUzel);//������� ������ ������ �� ����
procedure Delete1(var f: PUzel);//�������� ������ �������� ������
procedure Change_Element(var f: PUzel);//��������� ����� ������

implementation

 {������� ���� a � ������ f}
procedure AddFirst(var f, a: PUzel);
begin
  a^.next:=f;
  if f<> nil then f^.pred:=a;
  f:=a;
end;

 {���������� ��������� ������}
procedure AddAfter(var old: PUzel; a: PUzel);
begin
  a^.next := old^.next;
  old^.next := a;
  a^.pred := old;
end;

 {�������� ������}
procedure BuildSpisok(var f: PUzel);
var
  a, d: PUzel; ch: PChar;
begin
 f := nil;
 repeat
  new(a);
 with a^.x do
  begin
   code := StrToInt(InputBox('������� ��� ������: ','',''));
   nameT := InputBox('������� ������������ ������: ','','');
   ed_iz := InputBox('������� ��. ��������� ������:','','');
   price := StrToFloat(InputBox('������� ��������� �������: ','',''));
   date := InputBox('������� ���� �������:','��.��.��','');
   sum := StrToInt(InputBox('������� ���������� ������: ','',''));
   Fam := InputBox('������� ������� ��������:','','');
   Name := InputBox('������� ��� ��������:','','');
   Otch := InputBox('������� �������� ��������:','','');
  end;
   if (f = nil) then
    begin
    AddFirst(f, a); d := f;
    end else
    begin
    AddAfter(d, a); d := a;
    end;
   ch := PChar(InputBox('����� ��������� ������� Y','',''));
   until (ch = 'Y') or (ch = 'y');
end;

 {��������� ������� ��-�� �� ������}
 procedure DelFirstElement(var f, a: PUzel);
 begin
  a := f;//�������� ��������� �� ���������� ����
  f := f^.next;
  if (f <> nil) then f^.pred := nil;
  a^.next := nil;
 end;
 
 {�������� ������}
 procedure DelSpisok(var f: PUzel);
  var a: PUzel;
   begin
    while (f <> nil) do
     begin
      DelFirstElement(f, a);
      dispose(a);
     end;
   end;
 
 {����� � ��������� ����}  
procedure write_in_text(var t: text; var f: PUzel);
  var p: PUzel;
  begin
    p := f;
write(t,'��� ������','|',' ������������':20,'|');
write(t,' ��. ���������','|',' ����':14,'|',' ���� �������','|');
writeln(t,' ����������','|',' ��������');
writeln(t);
  while (p <> nil) do
   begin
   with p^.x do
     begin
   write(t, code:8,' | ', nameT:20,' | ',ed_iz:10,' | ',
   price:10:2,' �. | ',date:8,' | ');
   writeln(t, sum:8,' | ',Fam:8,' ',Name[1],'.',Otch[1],'.');
    p := p^.next;
     end;
   end;
  end;

 {����� � �������������� ����}
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

{�������������� ������ �� ��������������� �����}
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

 {����������� ������� ��������}
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
      s := '���������� ��������� � ������: '+IntToStr(n);
      ShowMessage(s);
      m := StrToIntDef(InputBox('',
      '������� ����� ��������,'+#13+#10+
      '����� �������� ������ �������� �����:',''),0);
      if m=0 then exit;
      if m>n then
      begin
      ShowMessage('�������� ����� ������, ��� ��������� � ������');
      exit;
      end;
      p := f;
      for i:=1 to (m-1) do
       p := p^.next;
      PosEl := p;
     end;

  {��������� �������� � �������� ��������� �� ���� ������������}
    procedure DelElement(var a:PUzel);
    var old: PUzel;
    begin 
    if (a^.next=nil) then//���� ������� ��������� �������
    begin
      old:=a^.pred;
      a := old^.next;
      old^.next := nil;
    end else
     begin
     old := a^.pred;//���� ������� � ����� �������
     a:=old^.next;
     old^.next:=a^.next;
     old^.next^.pred:=old;
     end;
    end;

  {����� ������ �� ��������}
   procedure Search_by_name(var f:PUzel);
   var
      p: PUzel; key,s: string; t: text; d: boolean;
   begin
   AssignFile(t, '������ � �������.txt');
   Rewrite(t);
     if (f = nil) then
      ShowMessage('������ ����!')
     else
     begin
      p:=f;
      d:=false;
      key := InputBox('������� �������� ������:','','');
      while (p <> nil) do
       begin
       if (p^.x.nameT = key) then
        begin
        d := true;
        with p^.x do
          begin
        s:='������ � ������: '+nameT+', '+FloatToStr(price)+' �.'+
        #13#10+'��. ���: '+ed_iz+
        #13#10+'���������� ������: '+IntToStr(sum)+
        #13#10+'��� ������: '+IntToStr(code)+
        #13#10+'���� �������: '+date+
        #13#10+'�������: '+Fam+' '+Name[1]+'.'+Otch[1]+'.';
        ShowMessage(s);
        writeln(t,s);
        writeln(t);
          end;
        end;
       p:=p^.next;
       end;
       if (not d) then ShowMessage('����� '+key+' �� ������.');
     end;
    CloseFile(t);
   end;

   {����� ������ �� ����}
    procedure Search_by_code(var f: PUzel);
    var key: integer; p: PUzel; s: string; d: boolean;
    t: text;
    begin
   AssignFile(t, '������ � �������2.txt');
   Rewrite(t);
     if (f = nil) then
      ShowMessage('������ ����!')
     else
     begin
      p:=f;
      d:=false;
      key := StrToIntDef(InputBox('������� ��� ������:','',''),0);
      while (p <> nil) do
       begin
       if (p^.x.code = key) then
        begin
        d := true;
        with p^.x do
          begin
        s:='������ � ������: '+nameT+', '+FloatToStr(price)+' �.'+
        #13#10+'��. ���: '+ed_iz+
        #13#10+'���������� ������: '+IntToStr(sum)+
        #13#10+'��� ������: '+IntToStr(code)+
        #13#10+'���� �������: '+date+
        #13#10+'�������: '+Fam+' '+Name[1]+'.'+Otch[1]+'.';
        ShowMessage(s);
        writeln(t,s);
        writeln(t);
          end;
        end;
       p:=p^.next;
       end;
       if (not d) and (key <> 0) then
       ShowMessage('����� � ����� '+IntToStr(key)+' �� ������.');
     end;
    CloseFile(t);
    end;

   {�������� ������ ��������}
   procedure Delete1(var f: PUzel);
   var m: integer; p, num: PUzel; d: boolean;
   begin
   if (f = nil) then
    begin
      ShowMessage('������ ����!');
      exit;
    end;  
    p := f;
    d := false;
      m := StrToIntDef(InputBox('������� ��� ������','',''),0);
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
       if (not d) then ShowMessage('����� �� ������.')
       else
       begin
        ShowMessage('����� '+num^.x.nameT);
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

   {������� �������� � ������ ������}
   procedure InsertInHead(var f: PUzel);
   var a: PUzel;
     begin
      if (f = nil) then
      begin
        ShowMessage('������ ����!');
        exit;
      end;
      new(a);
  with a^.x do
   begin
    code := StrToInt(InputBox('������� ��� ������: ','',''));
    nameT := InputBox('������� ������������ ������: ','','');
    ed_iz := InputBox('������� ��. ��������� ������:','','');
    price := StrToFloat(InputBox('������� ��������� �������: ','',''));
    date := InputBox('������� ���� �������:','��.��.��','');
    sum := StrToInt(InputBox('������� ���������� ������: ','',''));
    Fam := InputBox('������� ������� ��������:','','');
    Name := InputBox('������� ��� ��������:','','');
    Otch := InputBox('������� �������� ��������:','','');
   end;
  AddFirst(f, a);
     end;

   {������� �������� � ����� �������}
   procedure InsertAnyPos(var f: PUzel);
   var a, PosEl: PUzel;
     begin
     if (f = nil) then
     begin
       ShowMessage('������ ����!');
       exit;
     end;
     FindPosEl(f, PosEl);
     if (PosEl = nil) then exit;
  new(a);
  with a^.x do
   begin
    code := StrToInt(InputBox('������� ��� ������: ','',''));
    nameT := InputBox('������� ������������ ������: ','','');
    ed_iz := InputBox('������� ��. ��������� ������:','','');
    price := StrToFloat(InputBox('������� ��������� �������: ','',''));
    date := InputBox('������� ���� �������:','��.��.��','');
    sum := StrToInt(InputBox('������� ���������� ������: ','',''));
    Fam := InputBox('������� ������� ��������:','','');
    Name := InputBox('������� ��� ��������:','','');
    Otch := InputBox('������� �������� ��������:','','');
   end;
    AddAfter(PosEl, a);
     end;

  {������ ������ ������ �� ����}
  procedure VolOfSale(var f: PUzel);
  var
     p: PUzel; d:string[8]; t: text;
     ras, s: real; st: string; key: boolean;
  begin
  AssignFile(t,'����� �� ������ ������.txt');
  Rewrite(t);
    key := false;
    p := f;
    s := 0;
    d := InputBox('������� ����:','��.��.��','');
    st := '����� �� '+d;
    writeln(t, st);
    while (p <> nil) do
      begin
        with p^.x do
          begin
           if (d = date) then
            begin
             key := true;
             ras := price * sum;//������ ������� �� ��������� �����
             s := s + ras;//����� ����� ���� ������
             st := '�����: '+nameT+', �������: '+FloatToStr(ras)+' �.';
             writeln(t, st);
            end;
          end;
       p := p^.next;
      end;
      if key then
      writeln(t, '����� �������: ',s:0:2,' �.') else
      writeln(t, '�� ��������� ���� �� ���� ������');
    CloseFile(t);
  end;

  {��������� ����� ������}
  procedure Change_Element(var f: PUzel);
  var p: PUzel; code1, m: integer; s: string;
  d: boolean;
  begin
  if (f = nil) then
   begin
     ShowMessage('������ ����!');
     exit;
   end;
   d := false;
   p := f;
   code1 := StrToIntDef(InputBox('����� ������ ��� ���������',
   '������� ��� ������:',''),0);;
   if code1=0 then exit;
   while (p <> nil) do
   begin
     with p^.x do
     begin
      if (code1=code) then
       begin
         d := true;
         ShowMessage('�����: '+nameT);
         s := '1 - ��� ������'+
         #13#10+'2 - �������� ������'+
         #13#10+'3 - ��. ���������'+
         #13#10+'4 - ��������� �������'+
         #13#10+'5 - ���� �������'+
         #13#10+'6 - ���������� ������'+
         #13#10+'7 - ��� ��������';
         repeat
         m := StrToIntDef(InputBox('��������, ��� ������ ��������:',s,''),0);
         case m of
         1: code := StrToInt(InputBox('������� ��� ������','',''));
         2: nameT := InputBox('������� �������� ������','','');
         3: ed_iz := InputBox('������� ��. ���������','','');
         4: price := StrToFloat(InputBox('������� ��������� �������: ','',''));
         5: date := InputBox('������� ���� �������:','��.��.��','');
         6: sum := StrToInt(InputBox('������� ���������� ������: ','',''));
         7: begin
             Fam := InputBox('������� ������� ��������:','','');
             Name := InputBox('������� ��� ��������:','','');
             Otch := InputBox('������� �������� ��������:','','');
            end;
         end;
         until (m = 0);
       end;
     end;
     p := p^.next;
   end;
   if not d then ShowMessage('����� �� ������');
  end;

end.
