object formModeloCascataTesteSistemaListaFinalAjuda: TformModeloCascataTesteSistemaListaFinalAjuda
  Left = 47
  Top = 75
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 155
  ClientWidth = 389
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
    Width = 369
    Height = 97
    Lines.Strings = (
      
        'Para filtrar a lista de requisitos, use o campo de texto "Procur' +
        'ar";'
      
        'Para imprimir um relat'#243'rio listando todos os requisitos use o bo' +
        't'#227'o "Relat'#243'rio '
      'lista";'
      
        'Para imprimir um relat'#243'rio descritivo de um requisito, selecione' +
        '-o na lista, use '
      'o bot'#227'o selecionar e use o bot'#227'o "Relat'#243'rio descritivo".')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 144
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
