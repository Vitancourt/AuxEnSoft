object FormCriarProjeto: TFormCriarProjeto
  Left = 377
  Top = 3
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Criar projeto'
  ClientHeight = 397
  ClientWidth = 561
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
  object Panel: TPanel
    Left = 16
    Top = 16
    Width = 537
    Height = 369
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 8
      Top = 8
      Width = 121
      Height = 13
      Caption = 'Insira os dados do projeto'
    end
    object lblDesenvolvimento: TLabel
      Left = 8
      Top = 80
      Width = 140
      Height = 13
      Caption = 'Modelo de desenvolvimento *'
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 128
      Width = 105
      Height = 13
      Caption = 'Descri'#231#227'o do projeto *'
    end
    object lblEntrega: TLabel
      Left = 192
      Top = 272
      Width = 139
      Height = 13
      Caption = 'Data de entrega * Clique aqui'
    end
    object edtnome: TLabeledEdit
      Left = 8
      Top = 48
      Width = 409
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do projeto *'
      MaxLength = 80
      TabOrder = 0
    end
    object cboxModelo: TComboBox
      Left = 8
      Top = 96
      Width = 193
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 1
      OnChange = cboxModeloChange
      Items.Strings = (
        ''
        'CASCATA')
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 144
      Width = 409
      Height = 121
      MaxLength = 300
      TabOrder = 2
    end
    object btnCadastrar: TBitBtn
      Left = 16
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 3
      OnClick = btnCadastrarClick
    end
    object btnLimpar: TBitBtn
      Left = 104
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 4
      OnClick = btnLimparClick
    end
    object btnVoltar: TBitBtn
      Left = 192
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Voltar'
      TabOrder = 5
      OnClick = btnVoltarClick
    end
    object edtcriacao: TLabeledEdit
      Left = 8
      Top = 288
      Width = 121
      Height = 21
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Data de cria'#231#227'o *'
      ReadOnly = True
      TabOrder = 6
    end
    object edtEntrega: TMaskEdit
      Left = 192
      Top = 288
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 7
      OnClick = edtEntregaClick
    end
    object Calendario: TMonthCalendar
      Left = 360
      Top = 200
      Width = 162
      Height = 153
      Date = 41494.981886956020000000
      TabOrder = 8
      Visible = False
      OnDblClick = CalendarioDblClick
    end
  end
  object Menu: TMainMenu
    Left = 408
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      OnClick = Ajuda1Click
    end
    object Logoff: TMenuItem
      Caption = 'Logoff'
      OnClick = LogoffClick
    end
  end
  object Query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 200
    Top = 24
  end
end
