object FormModeloCascataTesteUnidadeCriarAjuda: TFormModeloCascataTesteUnidadeCriarAjuda
  Left = 404
  Top = 247
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 188
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
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
  end
  object memoAjuda: TMemo
    Left = 16
    Top = 16
    Width = 345
    Height = 113
    Lines.Strings = (
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Os campos n'#227'o devem conter mais espa'#231'os do que letras;'
      'Para limpar os campos rapidamente use o bot'#227'o "Limpar";'
      'Para cadastrar o teste de unidade use o bot'#227'o "Cadastrar";'
      
        'Para editar a "Data do teste" clique sobre o campo e se abrir'#225' u' +
        'm '
      
        'calend'#225'rio onde deve ser selecionado com dois cliques a data cor' +
        'reta.')
    ReadOnly = True
    TabOrder = 1
  end
end
