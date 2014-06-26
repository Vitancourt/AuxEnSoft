object FormModeloCascataListaFinalAjuda: TFormModeloCascataListaFinalAjuda
  Left = 588
  Top = 281
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 161
  ClientWidth = 396
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
    Left = 16
    Top = 16
    Width = 361
    Height = 97
    Lines.Strings = (
      
        'Para imprimir a lista de todos requisitos clique no bot'#227'o "Impri' +
        'mir lista";'
      'Para filtrar as tabelas digite no campo "Procurar";'
      'Selecione o estado que deseja exibir;'
      
        'Para selecionar, clique no requisito e clique no bot'#227'o "Selecion' +
        'ar";'
      'Para limpar o campo "Procurar" clique no bot'#227'o "Limpar";'
      'Para voltar a interface interior clique no bot'#227'o "Voltar;'
      'Para imprimir uma unidade clique no bot'#227'o "Imprimir unidade com '
      'descri'#231#227'o";')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 152
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
