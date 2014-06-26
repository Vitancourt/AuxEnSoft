object FormModeloCascataTesteUnidadeEditarAjuda: TFormModeloCascataTesteUnidadeEditarAjuda
  Left = 366
  Top = 243
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 199
  ClientWidth = 348
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
    Left = 16
    Top = 16
    Width = 313
    Height = 129
    Lines.Strings = (
      'Para editar ou excluir selecione um teste de unidade na lista;'
      'Para editar use o bot'#227'o "Editar";'
      'Para excluir use o bot'#227'o "Excluir";'
      'Para limpar rapidamente os campos use o bot'#227'o "Limpar";'
      'Para voltar use o bot'#227'o "Voltar;'
      'Para cancelar a edi'#231#227'o use o bot'#227'o "Cancelar";'
      'Para salvar a edi'#231#227'o use o bot'#227'o "Salvar";'
      'Os campos com * s'#227'o obrigat'#243'rios.')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 136
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
