object FormModeloCascataDefinicaoRequisito: TFormModeloCascataDefinicaoRequisito
  Left = 223
  Top = 260
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Defini'#231#227'o de requisitos'
  ClientHeight = 372
  ClientWidth = 1002
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
    Width = 107
    Height = 13
    Caption = 'Defini'#231#227'o de requisitos'
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 337
    Height = 361
    Caption = 'Panel1'
    TabOrder = 0
    object lblListaRequisito: TLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 13
      Caption = 'Lista de requisitos'
    end
    object lblProcurar: TLabel
      Left = 8
      Top = 288
      Width = 40
      Height = 13
      Caption = 'Procurar'
    end
    object gridRequisito: TDBGrid
      Left = 8
      Top = 24
      Width = 321
      Height = 257
      DataSource = Source
      ReadOnly = True
      TabOrder = 5
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
    object btnAtualizar: TBitBtn
      Left = 8
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 1
      OnClick = btnAtualizarClick
    end
    object btnEditar: TBitBtn
      Left = 88
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnExcluir: TBitBtn
      Left = 168
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnVoltar: TBitBtn
      Left = 248
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 4
      OnClick = btnVoltarClick
    end
  end
  object Panel2: TPanel
    Left = 360
    Top = 24
    Width = 633
    Height = 345
    TabOrder = 1
    object lblDescricao: TLabel
      Left = 8
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblProblema: TLabel
      Left = 344
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Problema'
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
    object lblSolucao: TLabel
      Left = 8
      Top = 168
      Width = 46
      Height = 13
      Caption = 'Solu'#231#227'o *'
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
      Height = 89
      MaxLength = 300
      ReadOnly = True
      TabOrder = 1
    end
    object memoProblema: TMemo
      Left = 344
      Top = 72
      Width = 273
      Height = 89
      MaxLength = 300
      ReadOnly = True
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
    object memoSolucao: TMemo
      Left = 8
      Top = 184
      Width = 425
      Height = 65
      MaxLength = 300
      TabOrder = 12
    end
    object edtDataSolucao: TLabeledEdit
      Left = 448
      Top = 184
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Data da solu'#231#227'o'
      ReadOnly = True
      TabOrder = 13
    end
    object edtDataAtual: TLabeledEdit
      Left = 448
      Top = 224
      Width = 121
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Data atual'
      ReadOnly = True
      TabOrder = 14
    end
  end
  object Menu: TMainMenu
    Left = 112
    Top = 40
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
    Left = 208
  end
  object Source: TDataSource
    DataSet = Query
    Left = 144
    Top = 40
  end
end
