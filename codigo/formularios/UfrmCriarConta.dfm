object frmCriarConta: TfrmCriarConta
  Left = 0
  Top = 0
  Caption = 'Registrar'
  ClientHeight = 490
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 490
    Align = alLeft
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 137
    Top = 0
    Width = 376
    Height = 490
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      376
      490)
    object Label1: TLabel
      Left = -1
      Top = 48
      Width = 376
      Height = 41
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Criar Conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 422
    end
    object Label2: TLabel
      Left = -1
      Top = 85
      Width = 376
      Height = 20
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Preencha os campos abaixo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = -1
      Top = 400
      Width = 376
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Possui conta?'
      ExplicitWidth = 422
    end
    object lblCliquepararegistrar: TLabel
      Left = -1
      Top = 419
      Width = 376
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Clique aqui para autenticar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblCliquepararegistrarClick
      ExplicitWidth = 422
    end
    object edtContaLoginUsuario: TEdit
      Left = 64
      Top = 133
      Width = 230
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TextHint = 'Digite Seu Nome'
    end
    object edtContaLoginSenha: TEdit
      Left = 64
      Top = 223
      Width = 230
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      TextHint = 'Digite Sua Senha'
    end
    object edtContaLogin: TEdit
      Left = 64
      Top = 193
      Width = 230
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TextHint = 'Digite seu Login'
    end
    object edtContaCPF: TEdit
      Left = 64
      Top = 163
      Width = 230
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TextHint = 'Digite Seu CPF'
      OnChange = edtContaCPFChange
      OnExit = edtContaCPFExit
    end
    object edtContaConfSenha: TEdit
      Left = 64
      Top = 253
      Width = 230
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 4
      TextHint = 'Confirme Sua Senha'
    end
    inline frmAutenticar1: TfrmAutenticar
      Left = 85
      Top = 311
      Width = 190
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Color = clTeal
      ParentBackground = False
      ParentColor = False
      TabOrder = 5
      ExplicitLeft = 85
      ExplicitTop = 311
      ExplicitWidth = 190
      inherited spbBotaoFrame: TSpeedButton
        Left = 0
        Top = 0
        Width = 190
        Height = 45
        Align = alClient
        Anchors = []
        Caption = 'Registrar'
        ParentBiDiMode = False
        OnClick = frmAutenticar1spbBotaoFrameClick
        ExplicitLeft = -184
        ExplicitTop = -3
        ExplicitWidth = 241
        ExplicitHeight = 45
      end
    end
  end
  object Panel3: TPanel
    Left = 513
    Top = 0
    Width = 137
    Height = 490
    Align = alRight
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
  end
end
