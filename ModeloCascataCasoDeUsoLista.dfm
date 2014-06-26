object FormModeloCascataCasoDeUsoLista: TFormModeloCascataCasoDeUsoLista
  Left = 406
  Top = 223
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Lista/Edi'#231#227'o de casos de uso'
  ClientHeight = 409
  ClientWidth = 815
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
    Width = 329
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
      Width = 313
      Height = 289
      DataSource = Source
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edtProcurar: TLabeledEdit
      Left = 8
      Top = 344
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Procurar'
      TabOrder = 1
      OnChange = edtProcurarChange
    end
    object btnVoltar: TBitBtn
      Left = 248
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 2
      OnClick = btnVoltarClick
    end
    object btnLimpar: TBitBtn
      Left = 168
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = btnLimparClick
    end
    object btnExcluir: TBitBtn
      Left = 88
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnEditar: TBitBtn
      Left = 8
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 5
      OnClick = btnEditarClick
    end
  end
  object PanelaCadastro: TPanel
    Left = 351
    Top = 8
    Width = 450
    Height = 401
    TabOrder = 1
    object lblCriarCasoDeUso: TLabel
      Left = 8
      Top = 8
      Width = 88
      Height = 13
      Caption = 'Editar caso de uso'
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
    object edtNome: TLabeledEdit
      Left = 8
      Top = 40
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      Enabled = False
      MaxLength = 500
      TabOrder = 0
      OnChange = edtNomeChange
    end
    object edtDataCriacao: TLabeledEdit
      Left = 320
      Top = 40
      Width = 105
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Data de cria'#231#227'o'
      Enabled = False
      MaxLength = 10
      TabOrder = 1
    end
    object memoObjetivo: TMemo
      Left = 8
      Top = 136
      Width = 201
      Height = 81
      Enabled = False
      MaxLength = 200
      TabOrder = 2
    end
    object memoPreRequisitos: TMemo
      Left = 224
      Top = 136
      Width = 201
      Height = 81
      Enabled = False
      Lines.Strings = (
        'Nenhum. (Por padr'#227'o)')
      MaxLength = 200
      TabOrder = 3
    end
    object btnSalvar: TBitBtn
      Left = 8
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 240
      Width = 417
      Height = 113
      Enabled = False
      MaxLength = 300
      TabOrder = 5
    end
    object btnLimpar1: TBitBtn
      Left = 184
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 6
      OnClick = btnLimpar1Click
    end
    object btnCancelar: TBitBtn
      Left = 96
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object edtAtor: TLabeledEdit
      Left = 8
      Top = 88
      Width = 417
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Ator(es) *'
      Enabled = False
      MaxLength = 50
      ReadOnly = True
      TabOrder = 8
    end
  end
  object Source: TDataSource
    DataSet = query
    Left = 216
    Top = 8
  end
  object query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 256
    Top = 8
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
end
