object FormModeloCascataTabelaCriar: TFormModeloCascataTabelaCriar
  Left = 409
  Top = 66
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Criar tabela'
  ClientHeight = 443
  ClientWidth = 788
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
  object PanelLista: TPanel
    Left = 8
    Top = 8
    Width = 337
    Height = 425
    TabOrder = 0
    object lblTabelas: TLabel
      Left = 8
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Lista de tabelas'
    end
    object gridtabelas: TDBGrid
      Left = 8
      Top = 24
      Width = 321
      Height = 313
      DataSource = Source
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edtProcurar: TLabeledEdit
      Left = 8
      Top = 360
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Procurar'
      TabOrder = 0
      OnChange = edtProcurarChange
    end
    object btnVoltar: TBitBtn
      Left = 248
      Top = 392
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 3
      OnClick = btnVoltarClick
    end
    object btnLimpar1: TBitBtn
      Left = 160
      Top = 392
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = btnLimpar1Click
    end
    object btnExcluir: TBitBtn
      Left = 72
      Top = 392
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object panelCriar: TPanel
    Left = 360
    Top = 8
    Width = 417
    Height = 425
    TabOrder = 1
    object lblCriarTabela: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Criar tabela'
    end
    object lblNome: TLabel
      Left = 8
      Top = 32
      Width = 35
      Height = 13
      Caption = 'Nome *'
    end
    object lblDataCriacao: TLabel
      Left = 288
      Top = 32
      Width = 83
      Height = 13
      Caption = 'Data de cria'#231#227'o *'
    end
    object lblColunas: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Colunas *'
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 176
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o *'
    end
    object lblDDL: TLabel
      Left = 8
      Top = 280
      Width = 29
      Height = 13
      Caption = 'DDL *'
    end
    object edtNome: TEdit
      Left = 8
      Top = 48
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 200
      TabOrder = 0
    end
    object edtDataCriacao: TEdit
      Left = 288
      Top = 48
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object memoColunas: TMemo
      Left = 8
      Top = 88
      Width = 401
      Height = 81
      MaxLength = 300
      TabOrder = 2
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 192
      Width = 401
      Height = 81
      MaxLength = 300
      TabOrder = 3
    end
    object memoDDL: TMemo
      Left = 8
      Top = 296
      Width = 401
      Height = 81
      MaxLength = 300
      TabOrder = 4
    end
    object btnCriar: TBitBtn
      Left = 8
      Top = 392
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 5
      OnClick = btnCriarClick
    end
    object btnLimpar: TBitBtn
      Left = 96
      Top = 392
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 6
      OnClick = btnLimparClick
    end
  end
  object Menu: TMainMenu
    Left = 272
    Top = 8
    object Ajuda: TMenuItem
      Caption = 'Ajuda'
      OnClick = AjudaClick
    end
    object Logoff: TMenuItem
      Caption = 'Logoff'
      OnClick = LogoffClick
    end
  end
  object Source: TDataSource
    DataSet = query
    Left = 136
    Top = 16
  end
  object query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 168
    Top = 16
  end
end
