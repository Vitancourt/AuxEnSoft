object formModeloCascataTesteSistemaEditar: TformModeloCascataTesteSistemaEditar
  Left = 629
  Top = 113
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Editar teste de sistema'
  ClientHeight = 454
  ClientWidth = 665
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
  object panelListadeTestes: TPanel
    Left = 8
    Top = 8
    Width = 305
    Height = 433
    TabOrder = 0
    object lblTesteDeSistemas: TLabel
      Left = 8
      Top = 8
      Width = 121
      Height = 13
      Caption = 'Lista de testes de sistema'
    end
    object gridTestedeSistema: TDBGrid
      Left = 8
      Top = 24
      Width = 289
      Height = 321
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
      Top = 368
      Width = 289
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Procurar'
      TabOrder = 1
      OnChange = edtProcurarChange
    end
    object btnSelecionar: TBitBtn
      Left = 8
      Top = 400
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = btnSelecionarClick
    end
    object btnLimpar: TBitBtn
      Left = 96
      Top = 400
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = btnLimparClick
    end
    object btnVoltar: TBitBtn
      Left = 184
      Top = 400
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 4
      OnClick = btnVoltarClick
    end
  end
  object panelDefinicao: TPanel
    Left = 320
    Top = 8
    Width = 337
    Height = 433
    TabOrder = 1
    object lblDefinir: TLabel
      Left = 8
      Top = 8
      Width = 109
      Height = 13
      Caption = 'Definir teste de sistema'
    end
    object lblEstado: TLabel
      Left = 8
      Top = 128
      Width = 37
      Height = 13
      Caption = 'Estado*'
      Enabled = False
    end
    object lblAvaliacao: TLabel
      Left = 168
      Top = 128
      Width = 51
      Height = 13
      Caption = 'Avalia'#231#227'o*'
      Enabled = False
    end
    object edtNomeRequisito: TLabeledEdit
      Left = 8
      Top = 48
      Width = 313
      Height = 21
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do requisito'
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      OnChange = edtNomeRequisitoChange
    end
    object edtIdentificador: TLabeledEdit
      Left = 8
      Top = 96
      Width = 121
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Identificador'
      Enabled = False
      MaxLength = 10
      ReadOnly = True
      TabOrder = 1
    end
    object edtNome: TLabeledEdit
      Left = 144
      Top = 96
      Width = 177
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome*'
      Enabled = False
      MaxLength = 100
      TabOrder = 2
    end
    object cboxEstado: TComboBox
      Left = 8
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'APROVADO'
        'PENDENTE'
        'REPROVADO')
    end
    object cboxAvaliacao: TComboBox
      Left = 168
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'BOM'
        'REGULAR'
        'RUIM')
    end
    object btnSalvar: TBitBtn
      Left = 8
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 5
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 184
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 6
      OnClick = btnCancelarClick
    end
    object btnExcluir: TBitBtn
      Left = 96
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Excluir'
      Enabled = False
      TabOrder = 7
      OnClick = btnExcluirClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 136
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      OnClick = Ajuda1Click
    end
    object Logoff1: TMenuItem
      Caption = 'Logoff'
      OnClick = Logoff1Click
    end
  end
  object Query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 208
  end
  object Source: TDataSource
    DataSet = Query
    Left = 240
  end
end
