object formModeloCascataTesteSistemaDefinirAjuda: TformModeloCascataTesteSistemaDefinirAjuda
  Left = 211
  Top = 103
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 183
  ClientWidth = 379
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
    Left = 144
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object MemoAjuda: TMemo
    Left = 8
    Top = 8
    Width = 361
    Height = 137
    Lines.Strings = (
      
        'Para definir um teste de sistema de um requisito, selecione o no' +
        'me do '
      
        'requisito na lista e use o bot'#227'o "Selecionar" e defina os dados ' +
        'nos campos '
      'da direita;'
      'Para filtrar buscas de requisitos use o campo "Procurar";'
      
        'Para cancelar a defini'#231#227'o de um teste de sistema use o bot'#227'o "Li' +
        'mpar";'
      'Todos os campos com * s'#227'o obrigat'#243'rios;'
      
        'Para salvar a defini'#231#227'o do teste de sistema use o bot'#227'o "Salvar"' +
        '.')
    ReadOnly = True
    TabOrder = 1
  end
end
