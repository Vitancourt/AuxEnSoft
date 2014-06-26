object formModeloCascataExtracaoAjuda: TformModeloCascataExtracaoAjuda
  Left = 561
  Top = 217
  Width = 430
  Height = 259
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
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
  object MemoAjuda: TMemo
    Left = 24
    Top = 16
    Width = 369
    Height = 145
    Lines.Strings = (
      
        'Para cadastrar um requisito voc'#234' deve preencher todos os campos ' +
        'que '
      'contem'
      'um *;'
      
        'Para indicar a data de cria'#231#227'o, clique no campo para o calend'#225'ri' +
        'os er '
      'exibido;'
      'Para cadastrar clique no bot'#227'o "Cadastrar";'
      'Para limpar os campos rapidamente clique no bot'#227'o "Limpar";'
      'Para voltar clique no bot'#227'o "Voltar";')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 152
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
