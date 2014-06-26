object FormCriarCadastro: TFormCriarCadastro
  Left = 550
  Top = 269
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft- Cadastro'
  ClientHeight = 268
  ClientWidth = 231
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 209
    Height = 249
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 153
      Height = 13
      Caption = 'Insira seus dados para cadastro.'
    end
    object edtusuario: TLabeledEdit
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Usu'#225'rio *'
      MaxLength = 20
      TabOrder = 0
    end
    object edtsenha: TLabeledEdit
      Left = 32
      Top = 88
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha *'
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtdatacad: TLabeledEdit
      Left = 32
      Top = 136
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 89
      EditLabel.Height = 13
      EditLabel.Caption = 'Data do cadastro *'
      MaxLength = 50
      ReadOnly = True
      TabOrder = 5
    end
    object btncadastrar: TBitBtn
      Left = 24
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = btncadastrarClick
    end
    object btnlimpar: TBitBtn
      Left = 112
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = btnlimparClick
    end
    object btnvoltar: TBitBtn
      Left = 64
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Voltar'
      TabOrder = 4
      OnClick = btnvoltarClick
    end
  end
  object Menu: TMainMenu
    Left = 8
    Top = 8
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      OnClick = Ajuda1Click
    end
    object Sair: TMenuItem
      Caption = 'Sair'
      OnClick = SairClick
    end
  end
  object Query: TZQuery
    Connection = FormInicio.Conecta
    Params = <>
    Left = 168
    Top = 88
  end
end
