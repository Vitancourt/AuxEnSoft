object formModeloCascataCasoDeUsoListaFinalAjuda: TformModeloCascataCasoDeUsoListaFinalAjuda
  Left = 450
  Top = 233
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 180
  ClientWidth = 319
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
    Width = 289
    Height = 121
    Lines.Strings = (
      'Para imprimir uma lista simples de seus casos de uso use o '
      'bot'#227'o "Imprimir";'
      'Para visualizar selecione-o e use o bot'#227'o "Visualizar";'
      'Para limpar o campo procurar rapidamente use o bot'#227'o '
      '"Limpar" do lado esquerdo da tela;'
      'Para voltar a interface anterior use o bot'#227'o "Voltar";'
      'Para imprimir uma lista descritiva de seu caso de uso '
      'selecione-o e use o bot'#227'o "Imprimir descri'#231#227'o".')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TButton
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
