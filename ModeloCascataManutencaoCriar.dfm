object formModeloCascataManutencaoCriar: TformModeloCascataManutencaoCriar
  Left = 442
  Top = 132
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Criar manuten'#231#227'o'
  ClientHeight = 379
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelLista: TPanel
    Left = 8
    Top = 8
    Width = 265
    Height = 361
    TabOrder = 1
    object lblLista: TLabel
      Left = 8
      Top = 8
      Width = 104
      Height = 13
      Caption = 'Lista de manuten'#231#245'es'
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 24
      Width = 249
      Height = 249
      DataSource = source
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edtProcurar: TLabeledEdit
      Left = 8
      Top = 296
      Width = 249
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Procurar'
      TabOrder = 0
      OnChange = edtProcurarChange
    end
    object btnConcluido: TBitBtn
      Left = 176
      Top = 328
      Width = 75
      Height = 25
      Caption = 'Concluido'
      TabOrder = 1
      OnClick = btnConcluidoClick
    end
  end
  object panelCriar: TPanel
    Left = 288
    Top = 8
    Width = 353
    Height = 361
    TabOrder = 0
    object lblCriar: TLabel
      Left = 8
      Top = 8
      Width = 83
      Height = 13
      Caption = 'Criar manuten'#231#227'o'
    end
    object lblDesc: TLabel
      Left = 8
      Top = 80
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o *'
    end
    object Label1: TLabel
      Left = 8
      Top = 208
      Width = 55
      Height = 13
      Caption = 'Resultado *'
    end
    object edtIdentificador: TLabeledEdit
      Left = 8
      Top = 48
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'Identificador *'
      MaxLength = 10
      TabOrder = 0
    end
    object edtNome: TLabeledEdit
      Left = 104
      Top = 48
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome *'
      MaxLength = 100
      TabOrder = 1
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 96
      Width = 337
      Height = 97
      MaxLength = 300
      TabOrder = 2
    end
    object cboxResultado: TComboBox
      Left = 8
      Top = 224
      Width = 145
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'BOM'
        'REGULAR'
        'RUIM')
    end
    object btnCriar: TBitBtn
      Left = 8
      Top = 256
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 4
      OnClick = btnCriarClick
    end
    object btnLimpar: TBitBtn
      Left = 96
      Top = 256
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 5
      OnClick = btnLimparClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 208
    Top = 65528
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      OnClick = Ajuda1Click
    end
    object Logoff1: TMenuItem
      Caption = 'Logoff'
      OnClick = Logoff1Click
    end
  end
  object source: TDataSource
    DataSet = query
    Left = 168
    Top = 16
  end
  object query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 200
    Top = 16
  end
end
