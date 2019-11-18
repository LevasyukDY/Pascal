unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ModWorkList, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    List1: TMenuItem;
    BuildList1: TMenuItem;
    DeleteList1: TMenuItem;
    WorkList1: TMenuItem;
    Search1: TMenuItem;
    byname1: TMenuItem;
    bycode1: TMenuItem;
    Close1: TMenuItem;
    DisposeEl1: TMenuItem;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Volumeofsales1: TMenuItem;
    tocalculate1: TMenuItem;
    InsertElement1: TMenuItem;
    SavetoTextFile1: TMenuItem;
    SavetoTipFile1: TMenuItem;
    RestoreFromTipFile1: TMenuItem;
    Insertinhead1: TMenuItem;
    Insertinanyposition1: TMenuItem;
    Memo1: TMemo;
    Outputonscreen1: TMenuItem;
    ChangeElement1: TMenuItem;
    procedure BuildList1Click(Sender: TObject);
    procedure DeleteList1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure DisposeEl1Click(Sender: TObject);
    procedure byname1Click(Sender: TObject);
    procedure SavetoTextFile1Click(Sender: TObject);
    procedure SavetoTipFile1Click(Sender: TObject);
    procedure RestoreFromTipFile1Click(Sender: TObject);
    procedure tocalculate1Click(Sender: TObject);
    procedure bycode1Click(Sender: TObject);
    procedure Insertinanyposition1Click(Sender: TObject);
    procedure Insertinhead1Click(Sender: TObject);
    procedure Outputonscreen1Click(Sender: TObject);
    procedure ChangeElement1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; head: PUzel;
  t: TextFile; tipf: ft;

implementation

{$R *.dfm}

procedure TForm1.BuildList1Click(Sender: TObject);
begin
if (head = nil) then
BuildSpisok(head) else
  ShowMessage('Список уже создан!'+#13#10+
  'Удалите его и создайте новый.');
end;

procedure TForm1.DeleteList1Click(Sender: TObject);
begin
if (head = nil) then
 begin
  ShowMessage('Список пуст!');
 exit;
end else
  DelSpisok(head);
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.DisposeEl1Click(Sender: TObject);
begin
Delete1(head);
end;

procedure TForm1.byname1Click(Sender: TObject);
begin
Search_by_name(head);
end;

procedure TForm1.SavetoTextFile1Click(Sender: TObject);
var s: string;
begin
if SaveDialog1.Execute then
       s:= SaveDialog1.FileName
      else exit;
AssignFile(t, s);
   Rewrite(t);
   write_in_text(t, head);
   CloseFile(t);
end;

procedure TForm1.SavetoTipFile1Click(Sender: TObject);
var s: string;
begin
if SaveDialog2.Execute then
       s:= SaveDialog2.FileName
      else exit;
   AssignFile(tipf, s);
   Rewrite(tipf);
   write_in_tip_file(head, tipf);
   CloseFile(tipf);
end;

procedure TForm1.RestoreFromTipFile1Click(Sender: TObject);
var s: string;
begin
   if (head <> nil) then
   begin
    ShowMessage('Список уже открыт!');
    exit;
   end;
if OpenDialog1.Execute then
       s:= OpenDialog1.FileName
      else exit;
   AssignFile(tipf, s);
   reset(tipf);
   RTF(head, tipf);
   CloseFile(tipf);
end;

procedure TForm1.tocalculate1Click(Sender: TObject);
begin
if (head = nil) then
ShowMessage('Список не создан!')
else
VolOfSale(head);
end;

procedure TForm1.bycode1Click(Sender: TObject);
begin
Search_by_code(head);
end;

procedure TForm1.Insertinanyposition1Click(Sender: TObject);
begin
InsertAnyPos(head);
end;

procedure TForm1.Insertinhead1Click(Sender: TObject);
begin
InsertInHead(head);
end;

procedure TForm1.Outputonscreen1Click(Sender: TObject);
var p: PUzel; s, s1: string;
begin
Memo1.Clear;
if (head = nil) then
 begin
   ShowMessage('Список пуст!');
   exit;
 end;
p := head;
s := '================================================================'+
#13#10+' код| название| ед. изм.| цена| дата продажи| кол-во| продавец'+
#13#10+'================================================================';
Memo1.Lines.add(s);
Memo1.Lines.add('');
while (p <> nil) do
   begin
   with p^.x do
     begin
     s1 := IntToStr(code)+' | '+nameT+' | '+ed_iz+' | '+
   FloatToStr(price)+' р. | '+date+' | '+IntToStr(sum)+' | '+
   Fam+' '+Name[1]+'.'+Otch[1]+'.';
     Memo1.Lines.add(s1);
    p := p^.next;
     end;
   end;
end;

procedure TForm1.ChangeElement1Click(Sender: TObject);
begin
Change_Element(head);
end;

end.
