unit ModeloCascataTabelaListaFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RpCon, RpConDS, RpDefine,
  RpRave;

type
  TFormModeloCascataTabelaListaFinal = class(TForm)
    PanelLista: TPanel;
    lblTabelas: TLabel;
    gridtabelas: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnVoltar: TBitBtn;
    btnLimpar1: TBitBtn;
    panelCriar: TPanel;
    lblCriarTabela: TLabel;
    lblNome: TLabel;
    lblDataCriacao: TLabel;
    lblColunas: TLabel;
    lblDescricao: TLabel;
    lblDDL: TLabel;
    edtNome: TEdit;
    edtDataCriacao: TEdit;
    memoColunas: TMemo;
    memoDescricao: TMemo;
    memoDDL: TMemo;
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    btnSelecionar: TBitBtn;
    btnImprimirLista: TBitBtn;
    Query: TZQuery;
    Source: TDataSource;
    rvProjectLista: TRvProject;
    ConectaTabelasLista: TRvDataSetConnection;
    QueryLista: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LogoffClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnLimpar1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnImprimirListaClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTabelaListaFinal: TFormModeloCascataTabelaListaFinal;

implementation

uses ModeloCascata, modelocascatatabelalistafinalAjuda;

{$R *.dfm}

procedure TFormModeloCascataTabelaListaFinal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar form e liberar memoria
  FormModeloCascataTabelaListaFinal.Release;
  FormModeloCascataTabelaListaFinal:=Nil;
end;

procedure TFormModeloCascataTabelaListaFinal.FormCreate(Sender: TObject);
begin
 //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Lista as tabelas
  with query do
  begin
    query.Close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaListaFinal.LogoffClick(Sender: TObject);
begin
  //Fazer logoff
  FormModeloCascata.Close;
  FormModeloCascataTabelaListaFinal.Close;
end;

procedure TFormModeloCascataTabelaListaFinal.btnSelecionarClick(
  Sender: TObject);
var
  nome_tabela:string;
begin
  //Pega o nome da tabela na variável
  nome_tabela:=(gridTabelas.Columns.Items[0].Field).AsString;
  //Seleciona o nome da tabela
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbtabela where nome="'+nome_tabela+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    //Insere nos campos
    edtNome.text:=Query.FieldByName('nome').AsString;
    edtDataCriacao.text:=Query.FieldByName('datacriacao').AsString;
    memoColunas.lines.text:=Query.FieldByName('colunas').AsString;
    memoDescricao.Lines.text:=Query.FieldByName('descricao').AsString;
    memoDDL.lines.text:=Query.FieldByName('ddl').AsString;
  end;
  //Atualiza grid
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaListaFinal.btnLimpar1Click(
  Sender: TObject);
begin
  //Limpa tudo
  edtNome.Clear;
  edtDataCriacao.Clear;
  memoColunas.lines.clear;
  memoDescricao.lines.clear;
  memoDDL.Lines.clear;
  edtProcurar.clear;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataTabelaListaFinal.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha form
  FormModeloCascataTabelaListaFinal.Close;
end;



procedure TFormModeloCascataTabelaListaFinal.edtProcurarChange(
  Sender: TObject);
begin
  //Atualiza grid de acordo com o digitado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbtabela where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaListaFinal.btnImprimirListaClick(
  Sender: TObject);
begin
  //Execute e fecha rvprojectlista
  rvProjectLista.Execute;
  rvProjectLista.Close;
end;



procedure TFormModeloCascataTabelaListaFinal.AjudaClick(Sender: TObject);
begin
 Application.CreateForm(tFormModeloCascataTabelaListaFinalAjuda, FormModeloCascataTabelaListaFinalAjuda);
 FormModeloCascataTabelaListaFinalAjuda.showmodal;
end;

end.
