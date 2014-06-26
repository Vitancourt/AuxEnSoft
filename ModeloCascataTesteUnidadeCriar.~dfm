object FormModeloCascataTesteUnidadeCriar: TFormModeloCascataTesteUnidadeCriar
  Left = 299
  Top = 87
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft -Teste de Unidade'
  ClientHeight = 366
  ClientWidth = 760
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
      Left = 160
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = btnLimpar1Click
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
    end
    object Label1: TLabel
      Left = 8
      Top = 232
      Width = 28
      Height = 13
      Caption = 'Tipo *'
    end
    object lblSituacao: TLabel
      Left = 192
      Top = 232
      Width = 49
      Height = 13
      Caption = 'Situa'#231#227'o *'
    end
    object edtIdentificador: TLabeledEdit
      Left = 8
      Top = 40
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Identificador/ID *'
      MaxLength = 10
      TabOrder = 0
    end
    object edtNome: TLabeledEdit
      Left = 104
      Top = 40
      Width = 273
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
      Top = 88
      Width = 369
      Height = 137
      MaxLength = 300
      TabOrder = 2
    end
    object cboxTipo: TComboBox
      Left = 8
      Top = 248
      Width = 169
      Height = 21
      Style = csDropDownList
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
      EditLabel.Width = 153
      EditLabel.Height = 13
      EditLabel.Caption = 'Data do teste * Clique no campo'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 5
      OnClick = edtDataTesteClick
    end
    object Calendario: TMonthCalendar
      Left = 184
      Top = 200
      Width = 162
      Height = 153
      Date = 41578.547280462960000000
      TabOrder = 6
      Visible = False
      OnDblClick = CalendarioDblClick
    end
    object btnCadastrar: TBitBtn
      Left = 8
      Top = 328
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 7
      OnClick = btnCadastrarClick
    end
    object btnLimpar: TBitBtn
      Left = 96
      Top = 328
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 8
      OnClick = btnLimparClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 160
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
  object Query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 136
    Top = 46
  end
  object Source: TDataSource
    DataSet = Query
    Left = 176
    Top = 54
  end
end
