object FormModeloCascataTabelaListaFinalAjuda: TFormModeloCascataTabelaListaFinalAjuda
  Left = 401
  Top = 509
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 144
  ClientWidth = 380
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
  object btnVoltar: TButton
    Left = 152
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object memoajuda: TMemo
    Left = 8
    Top = 8
    Width = 361
    Height = 81
    Lines.Strings = (
      
        'Para imprimir uma lista de suas tabelas use o bot'#227'o "Imprimir li' +
        'sta";'
      
        'Para visualizar uma tabela, selecione-a e use o bot'#227'o "Seleciona' +
        'r";'
      'Para limpar os campos rapidamente use o bot'#227'o "Limpar";'
      'Para voltar a interface anterior use o bot'#227'o "Voltar".')
    ReadOnly = True
    TabOrder = 1
  end
end
