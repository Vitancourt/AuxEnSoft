object formModeloCascataManutencaoCriarAjuda: TformModeloCascataManutencaoCriarAjuda
  Left = 211
  Top = 111
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 139
  ClientWidth = 399
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
    Left = 160
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object memoAjuda: TMemo
    Left = 8
    Top = 8
    Width = 377
    Height = 81
    Lines.Strings = (
      
        'Use a lista de manuten'#231#245'es para visualizar suas manuten'#231#245'es cada' +
        'stradas;'
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Para concluir a cria'#231#227'o de uma manuten'#231#227'o use o bot'#227'o "Criar";'
      'Para limpar os campos rapidamente use o bot'#227'o "Limpar".')
    ReadOnly = True
    TabOrder = 1
  end
end
