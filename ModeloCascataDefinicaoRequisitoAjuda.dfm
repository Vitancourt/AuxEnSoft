object FormModeloCascataDefinicaoRequisitoAjuda: TFormModeloCascataDefinicaoRequisitoAjuda
  Left = 381
  Top = 244
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 179
  ClientWidth = 457
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
  object Memo1: TMemo
    Left = 24
    Top = 16
    Width = 417
    Height = 113
    Lines.Strings = (
      
        'Para definir ou redefinir um requisito clique no requisito a esq' +
        'uerda e clique em editar;'
      'Use o bot'#227'o "Atualizar" para atualizar a lista de requisitos;'
      
        'Use o bot'#227'o "Excluir" para excluir o requisito e tudo relacionad' +
        'o;'
      'Use o bot'#227'o "Voltar" para voltar a interface anterior;'
      
        'Use o bot'#227'o "Cancelar" para cancelar a defini'#231#227'o ou redefini'#231#227'o ' +
        'do requisito;'
      
        'Use o bot'#227'o "Salvar" para salvar a defini'#231#227'o ou redefini'#231#227'o do r' +
        'equisito;'
      'Os campos com * s'#227'o obrigat'#243'rios.')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 176
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
