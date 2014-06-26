object FormModeloCascataTesteUnidadeCriarAjudaa: TFormModeloCascataTesteUnidadeCriarAjudaa
  Left = 457
  Top = 224
  Width = 345
  Height = 174
  Caption = 'FormModeloCascataTesteUnidadeCriarAjudaa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memoAjuda: TMemo
    Left = 8
    Top = 8
    Width = 305
    Height = 81
    Lines.Strings = (
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Para criar seu teste de unidade preencha os dados e use o '
      'bot'#227'o "Cadastrar";'
      'Para limpar rapidamente os campos use o bot'#227'o "Limpar".')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TButton
    Left = 120
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
