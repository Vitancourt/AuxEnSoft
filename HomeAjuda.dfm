object FormHomeAjuda: TFormHomeAjuda
  Left = 455
  Top = 210
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 153
  ClientWidth = 370
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
    Left = 144
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object MemoAjuda: TMemo
    Left = 16
    Top = 16
    Width = 337
    Height = 89
    Lines.Strings = (
      'Para criar um projeto clique no bot'#227'o "Novo '
      'projeto" ou no menu Movimenta'#231#227'o>Projeto>Novo projeto;'
      
        'Para acessar o projeto clique no bot'#227'o "Acessar projeto" ou no m' +
        'enu '
      'Movimenta'#231#227'o>Projeto>Acessar projeto'
      'Verifique seus acessos no menu Verifica'#231#245'es>Hist'#243'rico de login;'
      'Para sair clique no menu sair. ')
    ReadOnly = True
    TabOrder = 1
  end
end
