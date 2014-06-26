object FormModeloCascataTesteUnidadeListaFinalAjuda: TFormModeloCascataTesteUnidadeListaFinalAjuda
  Left = 415
  Top = 291
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 168
  ClientWidth = 357
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
  object btnVoltar: TBitBtn
    Left = 128
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object memoAjuda: TMemo
    Left = 16
    Top = 16
    Width = 321
    Height = 105
    Lines.Strings = (
      
        'Para verificar um teste de unidade, selecione-o na lista e cliqu' +
        'e no '
      'bot'#227'o "Selecionar";'
      
        'Para imprimir uma lista com os testes de unidade clique no bot'#227'o' +
        ' '
      '"Imprimir lista";'
      
        'Para imprimir um teste de unidade descritivo, selecione-o e cliq' +
        'ue '
      'no bot'#227'o "Imprimir lista descritiva".')
    ReadOnly = True
    TabOrder = 1
  end
end
