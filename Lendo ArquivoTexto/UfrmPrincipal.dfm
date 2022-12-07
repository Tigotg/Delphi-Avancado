object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 601
  ClientWidth = 464
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
    Left = 8
    Top = 16
    Width = 231
    Height = 19
    Caption = 'Informe o Nome do Arquivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mmResultadoLeitura: TMemo
    Left = 8
    Top = 128
    Width = 449
    Height = 465
    TabOrder = 0
  end
  object btnLerArquivo: TButton
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ler Arquivo'
    TabOrder = 1
    OnClick = btnLerArquivoClick
  end
  object edtInformeArquivo: TEdit
    Left = 8
    Top = 41
    Width = 449
    Height = 21
    TabOrder = 2
  end
end
