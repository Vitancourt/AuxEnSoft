object FormModeloCascataExtracao: TFormModeloCascataExtracao
  Left = 383
  Top = 44
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Extra'#231#227'o de requisitos'
  ClientHeight = 461
  ClientWidth = 430
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
  object PanelExtracao: TPanel
    Left = 8
    Top = 8
    Width = 409
    Height = 441
    TabOrder = 0
    object lblDescricao: TLabel
      Left = 8
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o *'
    end
    object lblEstado: TLabel
      Left = 8
      Top = 296
      Width = 40
      Height = 13
      Caption = 'Estado *'
    end
    object Tipo: TLabel
      Left = 152
      Top = 296
      Width = 28
      Height = 13
      Caption = 'Tipo *'
    end
    object lblProblema: TLabel
      Left = 8
      Top = 176
      Width = 51
      Height = 13
      Caption = 'Problema *'
    end
    object lblMetodo: TLabel
      Left = 8
      Top = 344
      Width = 43
      Height = 13
      Caption = 'M'#233'todo *'
    end
    object edtNome: TLabeledEdit
      Left = 8
      Top = 24
      Width = 393
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 92
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do requisito *'
      MaxLength = 100
      TabOrder = 0
    end
    object edtDataCriacao: TLabeledEdit
      Left = 168
      Top = 360
      Width = 97
      Height = 21
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Data de cria'#231#227'o *'
      ReadOnly = True
      TabOrder = 9
    end
    object memoDescricao: TMemo
      Left = 8
      Top = 72
      Width = 393
      Height = 89
      MaxLength = 300
      TabOrder = 1
    end
    object cboxEstado: TComboBox
      Left = 8
      Top = 312
      Width = 129
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'PROPOSTO'
        'REJEITADO')
    end
    object cboxTipo: TComboBox
      Left = 152
      Top = 312
      Width = 185
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'REQUISITO FUNCIONAL'
        'REQUISITO N'#195'O FUNCIONAL')
    end
    object memoProblema: TMemo
      Left = 8
      Top = 192
      Width = 393
      Height = 89
      MaxLength = 300
      TabOrder = 2
    end
    object cboxMetodo: TComboBox
      Left = 8
      Top = 360
      Width = 145
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'BRAINSTORMING'
        'CEN'#193'RIO'
        'ENTREVISTA'
        'OBSERVA'#199#195'O DIRETA'
        'PROTOTIPA'#199#195'O'
        'QUESTION'#193'RIO'
        'REUNI'#195'O'
        'STORYBOARD'
        'WORKSHOP')
    end
    object btnCadastrar: TBitBtn
      Left = 8
      Top = 400
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 6
      OnClick = btnCadastrarClick
    end
    object btnLimpar: TBitBtn
      Left = 96
      Top = 400
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 7
      OnClick = btnLimparClick
    end
    object btnVoltar: TBitBtn
      Left = 184
      Top = 400
      Width = 75
      Height = 25
      Caption = 'Voltar'
      TabOrder = 8
      OnClick = btnVoltarClick
    end
  end
  object Menu: TMainMenu
    Top = 65520
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
    Left = 104
  end
end
