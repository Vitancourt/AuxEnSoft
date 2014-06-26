object FormAcessosAoPrograma: TFormAcessosAoPrograma
  Left = 531
  Top = 198
  BorderStyle = bsToolWindow
  Caption = 'Ferramenta AuxEnSoft - Hist'#243'rico'
  ClientHeight = 247
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCont: TLabel
    Left = 8
    Top = 192
    Width = 32
    Height = 13
    Caption = 'lblCont'
  end
  object btnVoltar: TBitBtn
    Left = 96
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 0
    OnClick = btnVoltarClick
  end
  object gridAcessos: TDBGrid
    Left = 8
    Top = 16
    Width = 241
    Height = 169
    DataSource = Source
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnImprimir: TBitBtn
    Left = 8
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object Query: TZQuery
    Connection = FormHome.Conecta
    SQL.Strings = (
      
        'select data_acesso as Data, hora_acesso as Hora from tbacesso wh' +
        'ere codigo_login=(select codigo_login from tbacesso order by cod' +
        'igo desc limit 1) order by codigo desc')
    Params = <>
    Left = 24
  end
  object Source: TDataSource
    DataSet = Query
    Left = 64
    Top = 8
  end
  object RVConecta: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Query
    Left = 128
    Top = 32
  end
  object rvProject: TRvProject
    ProjectFile = 'relatorioAcessosAoPrograma.rav'
    Left = 80
    Top = 64
  end
end
