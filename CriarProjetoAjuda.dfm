object FormCriarProjetoAjuda: TFormCriarProjetoAjuda
  Left = 534
  Top = 256
  BorderStyle = bsDialog
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 197
  ClientWidth = 352
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
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object Memo: TMemo
    Left = 16
    Top = 24
    Width = 313
    Height = 121
    Lines.Strings = (
      'Voc'#234' deve digitar um nome para o projeto (Obrigat'#243'rio), modelo '
      'de desenvolvimento (Obrigat'#243'rio), descri'#231#227'o do projeto '
      '(Obrigat'#243'rio).'
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Por padr'#227'o o AuxEnSoft pega a data de cria'#231#227'o do projeto como '
      'a data atual do sistema, se sua data estiver errada, acerte o '
      'rel'#243'gio.'
      'A data de entrega deve ser selecionada no calend'#225'rio.')
    ReadOnly = True
    TabOrder = 1
  end
end
