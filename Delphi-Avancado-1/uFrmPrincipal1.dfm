object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 24
    Width = 202
    Height = 23
    Caption = 'Informe um N'#250'mero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNumero: TEdit
    Left = 80
    Top = 53
    Width = 202
    Height = 21
    TabOrder = 0
  end
  object btnTabuada: TButton
    Left = 80
    Top = 96
    Width = 202
    Height = 25
    Caption = 'Tabuada'
    TabOrder = 1
    OnClick = btnTabuadaClick
  end
end
