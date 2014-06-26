object FormHome: TFormHome
  Left = 620
  Top = 180
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Home'
  ClientHeight = 186
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 16
    Top = 16
    Width = 313
    Height = 153
    ActivePage = PageProjeto
    TabOrder = 0
    object PageProjeto: TTabSheet
      Caption = 'Projeto'
      object btnNovoProjeto: TBitBtn
        Left = 8
        Top = 8
        Width = 129
        Height = 97
        Caption = 'Novo projeto'
        TabOrder = 0
        OnClick = btnNovoProjetoClick
      end
      object btnAcessarProjeto: TBitBtn
        Left = 160
        Top = 8
        Width = 129
        Height = 97
        Caption = 'Acessar projeto'
        TabOrder = 1
        OnClick = btnAcessarProjetoClick
      end
    end
  end
  object Menu: TMainMenu
    Left = 88
    object Ajuda: TMenuItem
      Caption = '&Ajuda'
      OnClick = AjudaClick
    end
    object Movimentao: TMenuItem
      Caption = '&Movimenta'#231#227'o'
      object Projeto: TMenuItem
        Caption = 'Projeto'
        object NovoProjeto: TMenuItem
          Caption = '&Novo projeto'
          OnClick = NovoProjetoClick
        end
        object AcessarProjeto: TMenuItem
          Caption = '&Acessar projeto'
          OnClick = AcessarProjetoClick
        end
      end
    end
    object verificacao: TMenuItem
      Caption = 'Verifica'#231#245'es'
      object Acessosaoprograma: TMenuItem
        Caption = 'Acessos ao programa'
        OnClick = AcessosaoprogramaClick
      end
    end
    object Sair: TMenuItem
      Caption = '&Sair'
      OnClick = SairClick
    end
  end
  object Query: TZQuery
    Connection = Conecta
    Params = <>
    Left = 208
  end
  object Conecta: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    Port = 0
    Database = 'database.db'
    Protocol = 'sqlite-3'
    Left = 152
  end
end
