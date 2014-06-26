object FormModeloCascataTabelaEditarAjuda: TFormModeloCascataTabelaEditarAjuda
  Left = 561
  Top = 212
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 173
  ClientWidth = 430
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
  object MemOAjuda: TMemo
    Left = 16
    Top = 16
    Width = 393
    Height = 105
    Lines.Strings = (
      
        'Para editar uma tabela, selecione na tabela e clique no bot'#227'o "E' +
        'ditar";'
      
        'Para excluir uma tabela, seleciona na tabela e clique no bot'#227'o "' +
        'Excluir";'
      'Para limpar os campos rapidamente clique no bot'#227'o "Limpar";'
      'Para voltar a interface anterior clique no bot'#227'o "Voltar";'
      'Os campos com * s'#227'o obrigat'#243'rios;'
      'Para cancelar a edi'#231#227'o de uma tabela clique no bot'#227'o "Cancelar";'
      'Para salvar a edi'#231#227'o clique no bot'#227'o "Salvar";')
    ReadOnly = True
    TabOrder = 0
  end
  object btnFechar: TButton
    Left = 136
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btnFecharClick
  end
end
