object FormModeloCascataCasoDeUsoADDAjuda: TFormModeloCascataCasoDeUsoADDAjuda
  Left = 383
  Top = 109
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 169
  ClientWidth = 309
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
    Left = 16
    Top = 16
    Width = 273
    Height = 105
    Lines.Strings = (
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Para limpar os campos rapidamente '
      'use o bot'#227'o "Limpar";'
      'Para criar o caso de uso use o bot'#227'o "Criar";'
      'Para excluir o caso de uso, selecione o caso de uso e '
      'use o bot'#227'o "Excluir".')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 112
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
