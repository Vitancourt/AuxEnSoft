object FormModeloCascataCasoDeUsoADD: TFormModeloCascataCasoDeUsoADD
  Left = 357
  Top = 137
  Width = 851
  Height = 474
  Caption = 'Ferramenta AuxEnSoft - Adicionar caso de uso'
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
    Width = 297
    Height = 401
    TabOrder = 0
    object lblListaCasosDeUso: TLabel
      Left = 8
      Top = 8
      Width = 103
      Height = 13
      Caption = 'Lista de casos de uso'
    end
    object GridCasos: TDBGrid
      Left = 8
      Top = 32
      Width = 281
      Height = 289
      DataSource = Source
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edtProcurar: TLabeledEdit
      Left = 8
      Top = 344
      Width = 281
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Procurar'
      TabOrder = 0
      OnChange = edtProcurarChange
    end
    object btnVoltar: TBitBtn
      Left = 184
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 3
      OnClick = btnVoltarClick
    end
    object btnLimpar: TBitBtn
      Left = 96
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btnLimparClick
    end
    object btnExcluir: TBitBtn
      Left = 8
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
  end
  object PanelaCadastro: TPanel
    Left = 320
    Top = 8
    Width = 449
    Height = 401
    TabOrder = 1
    object lblCriarCasoDeUso: TLabel
      Left = 8
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Criar caso de uso'
    end
    object lblObjetivo: TLabel
      Left = 8
      Top = 120
      Width = 46
      Height = 13
      Caption = 'Objetivo *'
    end
    object lblPreRequisitos: TLabel
      Left = 224
      Top = 120
      Width = 70
      Height = 13
      Caption = 'Pr'#233' requisitos *'
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 224
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o *'
    end
    object lblAtor: TLabel
      Left = 8
      Top = 72
      Width = 43
      Height = 13
      Caption = 'Ator(es) *'
    end
    object edtNome: TLabeledEdit
      Left = 8
      Top = 40
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome *'
      MaxLength = 100
      TabOrder = 0
    end
    object edtDataCriacao: TLabeledEdit
      Left = 320
      Top = 40
      Width = 105
      Height = 21
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Data de cria'#231#227'o *'
      MaxLength = 10
      TabOrder = 1
    end
    object memoObjetivo: TMemo
      Left = 8
      Top = 136
      Width = 201
      Height = 81
      MaxLength = 200
      TabOrder = 3
    end
    object memoPreRequisitos: TMemo
      Left = 224
      Top = 136
      Width = 201
      Height = 81
      Lines.Strings = (
        'Nenhum. (Por padr'#227'o)')
      MaxLength = 200
      TabOrder = 4
    end
    object btnCriarCaso: TBitBtn
      Left = 8
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 6
      OnClick = btnCriarCasoClick
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 240
      Width = 417
      Height = 121
      MaxLength = 300
      TabOrder = 5
    end
    object btnLimpar1: TBitBtn
      Left = 96
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 7
      OnClick = btnLimpar1Click
    end
    object edtAtor: TEdit
      Left = 8
      Top = 88
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
  end
  object Menu: TMainMenu
    Left = 56
    object Ajuda: TMenuItem
      Caption = 'Ajuda'
      OnClick = AjudaClick
    end
    object Logoff: TMenuItem
      Caption = 'Logoff'
      OnClick = LogoffClick
    end
  end
  object query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 256
    Top = 8
  end
  object Source: TDataSource
    DataSet = query
    Left = 216
    Top = 8
  end
end
