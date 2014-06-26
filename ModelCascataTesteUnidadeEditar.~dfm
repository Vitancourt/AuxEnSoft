object FormModeloCascataTesteUnidadeEditar: TFormModeloCascataTesteUnidadeEditar
  Left = 324
  Top = 210
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Editar teste de unidade'
  ClientHeight = 374
  ClientWidth = 752
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
  object PanelLista: TPanel
    Left = 8
    Top = 6
    Width = 337
    Height = 355
    TabOrder = 0
    object lblTestes: TLabel
      Left = 8
      Top = 8
      Width = 124
      Height = 13
      Caption = 'Lista de testes de unidade'
    end
    object gridtabelas: TDBGrid
      Left = 8
      Top = 24
      Width = 321
      Height = 257
      DataSource = Source
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edtProcurar: TLabeledEdit
      Left = 8
      Top = 296
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 73
      EditLabel.Height = 13
      EditLabel.Caption = 'Procurar/Nome'
      TabOrder = 0
      OnChange = edtProcurarChange
    end
    object btnVoltar: TBitBtn
      Left = 248
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 2
      OnClick = btnVoltarClick
    end
    object btnLimpar1: TBitBtn
      Left = 168
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = btnLimpar1Click
    end
    object btnExcluir: TBitBtn
      Left = 88
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnEditar: TBitBtn
      Left = 8
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 5
      OnClick = btnEditarClick
    end
  end
  object labelCriarTesteUnidade: TPanel
    Left = 352
    Top = 0
    Width = 385
    Height = 361
    TabOrder = 1
    object lblTitulo: TLabel
      Left = 8
      Top = 8
      Width = 103
      Height = 13
      Caption = 'Criar teste de unidade'
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 72
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o *'
      Enabled = False
    end
    object lblTipo: TLabel
      Left = 8
      Top = 232
      Width = 28
      Height = 13
      Caption = 'Tipo *'
      Enabled = False
    end
    object lblSituacao: TLabel
      Left = 192
      Top = 232
      Width = 49
      Height = 13
      Caption = 'Situa'#231#227'o *'
      Enabled = False
    end
    object edtIdentificador: TLabeledEdit
      Left = 8
      Top = 40
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 74
      EditLabel.Height = 13
      EditLabel.Caption = 'Identificador/ID'
      Enabled = False
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
      OnChange = edtIdentificadorChange
    end
    object edtNome: TLabeledEdit
      Left = 104
      Top = 40
      Width = 273
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      Enabled = False
      MaxLength = 100
      ReadOnly = True
      TabOrder = 1
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 88
      Width = 369
      Height = 137
      Enabled = False
      MaxLength = 300
      TabOrder = 2
    end
    object cboxTipo: TComboBox
      Left = 8
      Top = 248
      Width = 169
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'DATA'
        'N'#218'MEROS'
        'SENHA'
        'DOM'#205'NIO'
        'CPF/CNPJ, ETC'
        'OUTROS')
    end
    object cboxSituacao: TComboBox
      Left = 192
      Top = 248
      Width = 169
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'APROVADO'
        'PENDENTE'
        'REPROVADO')
    end
    object edtDataTeste: TLabeledEdit
      Left = 8
      Top = 288
      Width = 129
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'Data do teste'
      Enabled = False
      MaxLength = 10
      ReadOnly = True
      TabOrder = 5
    end
    object btnSalvar: TBitBtn
      Left = 8
      Top = 328
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 6
      OnClick = btnSalvarClick
    end
    object btncancelar: TBitBtn
      Left = 96
      Top = 328
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 7
      OnClick = btncancelarClick
    end
  end
  object Query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 144
    Top = 62
  end
  object Source: TDataSource
    DataSet = Query
    Left = 184
    Top = 70
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 8
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      OnClick = Ajuda1Click
    end
    object Logoff1: TMenuItem
      Caption = 'Logoff'
      OnClick = Logoff1Click
    end
  end
end
