object formModeloCascataManutencaoEditarAjuda: TformModeloCascataManutencaoEditarAjuda
  Left = 215
  Top = 122
  Width = 396
  Height = 191
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
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
    Left = 152
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object memoAjuda: TMemo
    Left = 8
    Top = 8
    Width = 361
    Height = 97
    Lines.Strings = (
      'Para editar uma manuten'#231#227'o selecione-a na lista e use o bot'#227'o '
      '"Selecionar" e use o painel '#224' direita para editar;'
      
        'Para excluir uma manuten'#231#227'o selecione-a na lista e use o bot'#227'o "' +
        'Excluir";'
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Para salvar a edi'#231#227'o da manuten'#231#227'o use o bot'#227'o "Salvar";'
      'Para limpar os campos rapidamente use o bot'#227'o "Limpar".')
    ReadOnly = True
    TabOrder = 1
  end
end
