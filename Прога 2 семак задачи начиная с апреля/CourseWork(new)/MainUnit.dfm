object Form1: TForm1
  Left = 251
  Top = 137
  Width = 870
  Height = 480
  Caption = 'Data Base: '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1087#1088#1086#1076#1072#1078#1072#1093' '#1074' '#1084#1072#1075#1072#1079#1080#1085#1077
  Color = clBtnFace
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 870
  Constraints.MinHeight = 480
  Constraints.MinWidth = 870
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 48
    Top = 40
    Width = 761
    Height = 361
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 96
    object File1: TMenuItem
      Caption = 'File'
      object SavetoTextFile1: TMenuItem
        Caption = 'Save to Text File'
        OnClick = SavetoTextFile1Click
      end
      object SavetoTipFile1: TMenuItem
        Caption = 'Save to Tip File'
        OnClick = SavetoTipFile1Click
      end
    end
    object List1: TMenuItem
      Caption = 'List'
      object BuildList1: TMenuItem
        Caption = 'Build List'
        OnClick = BuildList1Click
      end
      object RestoreFromTipFile1: TMenuItem
        Caption = 'RestoreFromTipFile'
        OnClick = RestoreFromTipFile1Click
      end
      object DeleteList1: TMenuItem
        Caption = 'Delete List'
        OnClick = DeleteList1Click
      end
      object Outputonscreen1: TMenuItem
        Caption = 'Output on screen'
        OnClick = Outputonscreen1Click
      end
    end
    object WorkList1: TMenuItem
      Caption = 'Work with List'
      object Search1: TMenuItem
        Caption = 'Search'
        object byname1: TMenuItem
          Caption = 'by name'
          OnClick = byname1Click
        end
        object bycode1: TMenuItem
          Caption = 'by code'
          OnClick = bycode1Click
        end
      end
      object DisposeEl1: TMenuItem
        Caption = 'Delete Element'
        OnClick = DisposeEl1Click
      end
      object InsertElement1: TMenuItem
        Caption = 'Add Element'
        object Insertinhead1: TMenuItem
          Caption = 'Insert in head'
          OnClick = Insertinhead1Click
        end
        object Insertinanyposition1: TMenuItem
          Caption = 'Insert in any position'
          OnClick = Insertinanyposition1Click
        end
      end
      object ChangeElement1: TMenuItem
        Caption = 'Change Element'
        OnClick = ChangeElement1Click
      end
    end
    object Volumeofsales1: TMenuItem
      Caption = 'Volume of sales'
      object tocalculate1: TMenuItem
        Caption = 'To calculate'
        OnClick = tocalculate1Click
      end
    end
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Text file.txt|*.txt'
    Left = 80
    Top = 88
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = '*.db'
    Filter = 'Data base file.db|*.db'
    Left = 112
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Data base file.db|*.db'
    Left = 48
    Top = 88
  end
end
