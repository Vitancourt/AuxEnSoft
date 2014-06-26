object FormModeloCascataCasoDeUsoListaAjuda: TFormModeloCascataCasoDeUsoListaAjuda
  Left = 225
  Top = 47
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Ajuda'
  ClientHeight = 165
  ClientWidth = 342
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
  object memoajuda: TMemo
    Left = 16
    Top = 16
    Width = 305
    Height = 105
    Lines.Strings = (
      'Os campos com * n'#227'o podem estar '
      'vazios;'
      'Para limpar os campos rapidamente use o bot'#227'o "Limpar";'
      'Para voltar a interface anterior use o bot'#227'o "Voltar";'
      'Para editar um caso de uso, selecione e use o bot'#227'o "Editar";'
      'Para cancelar a edi'#231#227'o clique no bot'#227'o "Cancelar";'
      'Para salvar a edi'#231#227'o clique no bot'#231'ao "Salvar.')
    ReadOnly = True
    TabOrder = 0
  end
  object btnVoltar: TBitBtn
    Left = 112
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
end
