object FormModeloCascataLista: TFormModeloCascataLista
  Left = 211
  Top = 88
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Lista de requisitos'
  ClientHeight = 371
  ClientWidth = 1003
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
  object lbltitulo: TLabel
    Left = 360
    Top = 8
    Width = 95
    Height = 13
    Caption = 'Edi'#231#227'o de requisitos'
  end
  object Panel: TPanel
    Left = 8
    Top = 8
    Width = 337
    Height = 361
    TabOrder = 0
    object lblProcurar: TLabel
      Left = 8
      Top = 288
      Width = 40
      Height = 13
      Caption = 'Procurar'
    end
    object lblListaRequisito: TLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 13
      Caption = 'Lista de requisitos'
    end
    object btnVoltar: TBitBtn
      Left = 248
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Voltar'
      TabOrder = 3
      OnClick = btnVoltarClick
    end
    object btnAtualizar: TBitBtn
      Left = 8
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 1
      OnClick = btnAtualizarClick
    end
    object btnExcluir: TBitBtn
      Left = 168
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object gridRequisito: TDBGrid
      Left = 8
      Top = 24
      Width = 321
      Height = 257
      DataSource = Source
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edtProcurar: TEdit
      Left = 56
      Top = 288
      Width = 257
      Height = 21
      TabOrder = 0
      OnChange = edtProcurarChange
    end
    object btnEditar: TBitBtn
      Left = 88
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 5
      OnClick = btnEditarClick
    end
  end
  object Panel1: TPanel
    Left = 360
    Top = 24
    Width = 633
    Height = 345
    TabOrder = 1
    object lblDescricao: TLabel
      Left = 8
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o *'
    end
    object lblProblema: TLabel
      Left = 344
      Top = 56
      Width = 51
      Height = 13
      Caption = 'Problema *'
    end
    object lblEstadoNovo: TLabel
      Left = 144
      Top = 256
      Width = 67
      Height = 13
      Caption = 'Estado novo *'
    end
    object lblTipo: TLabel
      Left = 280
      Top = 256
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object lblMetodo: TLabel
      Left = 464
      Top = 256
      Width = 36
      Height = 13
      Caption = 'M'#233'todo'
    end
    object edtNome: TLabeledEdit
      Left = 96
      Top = 24
      Width = 337
      Height = 21
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do requisito'
      ReadOnly = True
      TabOrder = 0
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 72
      Width = 321
      Height = 169
      MaxLength = 300
      TabOrder = 1
    end
    object memoProblema: TMemo
      Left = 344
      Top = 72
      Width = 273
      Height = 169
      MaxLength = 300
      TabOrder = 2
    end
    object cboxEstadoNovo: TComboBox
      Left = 144
      Top = 272
      Width = 129
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'REJEITADO'
        'APROVADO'
        'EM AVALIA'#199#195'O'
        'EM IMPLEMENTA'#199#195'O'
        'IMPLEMENTADO')
    end
    object btnSalvar: TBitBtn
      Left = 8
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 96
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 5
      OnClick = btnCancelarClick
    end
    object btnVoltar1: TBitBtn
      Left = 184
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Voltar'
      Enabled = False
      TabOrder = 6
      OnClick = btnVoltar1Click
    end
    object edtCod: TLabeledEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Codigo'
      ReadOnly = True
      TabOrder = 7
      OnChange = edtCodChange
    end
    object edtTipo: TEdit
      Left = 280
      Top = 272
      Width = 177
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object edtMetodo: TEdit
      Left = 464
      Top = 272
      Width = 153
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object edtDataCriacao: TLabeledEdit
      Left = 448
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Data de cria'#231#227'o'
      ReadOnly = True
      TabOrder = 10
    end
    object edtEstadoAtual: TLabeledEdit
      Left = 8
      Top = 272
      Width = 129
      Height = 21
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = 'Estado atual'
      ReadOnly = True
      TabOrder = 11
    end
  end
  object Menu: TMainMenu
    Left = 32
    Top = 32
    object Ajuda: TMenuItem
      Caption = 'Ajuda'
      OnClick = AjudaClick
    end
    object Logoff: TMenuItem
      Caption = 'Logoff'
      OnClick = LogoffClick
    end
  end
  object Query: TZQuery
    Connection = FormHome.Conecta
    Params = <>
    Left = 64
    Top = 16
  end
  object Source: TDataSource
    DataSet = Query
    Left = 104
    Top = 16
  end
end
