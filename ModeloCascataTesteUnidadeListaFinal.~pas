unit ModeloCascataTesteUnidadeListaFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Menus, ExtCtrls, Grids, DBGrids, Buttons, RpRave, RpDefine, RpCon,
  RpConDS;

type
  TFormModeloCascataTesteUnidadeListaFinal = class(TForm)
    PanelLista: TPanel;
    lblTestes: TLabel;
    gridtabelas: TDBGrid;
    edtProcurar: TLabeledEdit;
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    Query: TZQuery;
    Source: TDataSource;
    labelCriarTesteUnidade: TPanel;
    lblTitulo: TLabel;
    lblDescricao: TLabel;
    lblTipo: TLabel;
    lblSituacao: TLabel;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    memoDescricao: TMemo;
    cboxTipo: TComboBox;
    cboxSituacao: TComboBox;
    edtDataTeste: TLabeledEdit;
    btnSelecionar: TBitBtn;
    btnVoltar: TBitBtn;
    btnLimpar: TBitBtn;
    queryLista: TZQuery;
    ConectaLista: TRvDataSetConnection;
    ProjectLista: TRvProject;
    btnImprimirLista: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logoff1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtIdentificadorChange(Sender: TObject);
    procedure btnImprimirListaClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTesteUnidadeListaFinal: TFormModeloCascataTesteUnidadeListaFinal;

implementation

uses ModeloCascata, ModeloCascataTesteUnidadeListaFinalAjuda;

{$R *.dfm}

procedure TFormModeloCascataTesteUnidadeListaFinal.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Atualiza lista de teste unidade
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera memória
  FormModeloCascataTesteUnidadeListaFinal.Release;
  FormModeloCascataTesteUnidadeListaFinal:=Nil;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.Logoff1Click(
  Sender: TObject);
begin
  //Faz Logoff
  FormModeloCascata.Close;
  FormModeloCascataTesteUnidadeListaFinal.Close;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  FormModeloCascataTesteUnidadeListaFinal.Close;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.btnLimparClick(
  Sender: TObject);
begin
  //Limpa os campos
  edtIdentificador.Clear;
  edtNome.Clear;
  memoDescricao.Lines.Clear;
  cboxTipo.ItemIndex:=-1;
  cboxSituacao.ItemIndex:=-1;
  edtDataTeste.Clear;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.edtProcurarChange(
  Sender: TObject);
begin
  //Seleciona testes de unidade de acordo com nome
  with query do
  begin
    query.close;
    query.SQL.clear;
  query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where nome like "'+edtProcurar.Text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.btnSelecionarClick(
  Sender: TObject);
var
  id,nome, tipo, situacao:string;
begin
  //seleciona pelo id
  id:=(gridtabelas.Columns.Items[0].Field).AsString;
  //Seleciona teste unidade pelo nome
  nome:=(gridtabelas.Columns.Items[1].Field).AsString;
  //Seleciona os dados do teste unidade para preencher campos
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbtesteunidade where identificador="'+id+'" and nome="'+nome+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
    edtIdentificador.text:=Query.FieldByName('identificador').AsString;
    edtNome.text:=Query.FieldByName('nome').AsString;
    memoDescricao.lines.text:=Query.FieldByName('descricao').AsString;
    tipo:=Query.FieldByName('tipo').AsString;
    situacao:=Query.FieldByName('situacao').AsString;
    edtdatateste.text:=Query.FieldByName('datateste').AsString;
  end;
  //Seta cboxTipo
  if (tipo='DATA') then
  begin
    cboxTipo.ItemIndex:=0;
  end;
  if (tipo='NÚMEROS') then
  begin
    cboxTipo.ItemIndex:=1;
  end;
  if (tipo='SENHA') then
  begin
    cboxTipo.ItemIndex:=2;
  end;
  if (tipo='DOMÍNIO') then
  begin
    cboxTipo.ItemIndex:=3;
  end;
  if (tipo='CPF/CNPJ, ETC') then
  begin
    cboxTipo.ItemIndex:=4;
  end;
  if (tipo='OUTROS') then
  begin
    cboxTipo.ItemIndex:=5;
  end;
  //Seta situação
  if (situacao='APROVADO') then
  begin
    cboxSituacao.ItemIndex:=0;
  end;
  if (situacao='PENDENTE') then
  begin
    cboxSituacao.ItemIndex:=1;
  end;
  if (situacao='REPROVADO') then
  begin
    cboxSituacao.ItemIndex:=2;
  end;
  //Atualiza lista de teste de unidade
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.edtIdentificadorChange(
  Sender: TObject);
begin
  //Se tiver vazio
  if (edtIdentificador.text='') then
  begin
    edtIdentificador.Enabled:=False;
    edtNome.enabled:=False;
    lblDescricao.Enabled:=False;
    memoDescricao.Enabled:=false;
    lblTipo.enabled:=false;
    lblSituacao.enabled:=False;
    cboxtipo.Enabled:=False;
    cboxsituacao.enabled:=false;
    edtDataTeste.Enabled:=false;
    btnLimpar.Enabled:=False;
    btnSelecionar.Enabled:=True;
    btnVoltar.Enabled:=True;
  end
  else
  begin
    edtIdentificador.Enabled:=True;
    edtNome.enabled:=True;
    lblDescricao.Enabled:=True;
    memoDescricao.Enabled:=True;
    lblTipo.enabled:=True;
    lblSituacao.enabled:=True;
    cboxtipo.Enabled:=True;
    cboxsituacao.enabled:=True;
    edtDataTeste.Enabled:=True;
    btnLimpar.Enabled:=True;
    btnSelecionar.Enabled:=False;
    btnVoltar.Enabled:=False;
  end;
end;

procedure TFormModeloCascataTesteUnidadeListaFinal.btnImprimirListaClick(
  Sender: TObject);
begin
  //Executa o projeto relatório
  ProjectLista.Execute;
  ProjectLista.Close;
end;



procedure TFormModeloCascataTesteUnidadeListaFinal.Ajuda1Click(
  Sender: TObject);
begin
 Application.CreateForm(tFormModeloCascataTesteUnidadeListaFinalAjuda, FormModeloCascataTesteUnidadeListaFinalAjuda);
 FormModeloCascataTesteUnidadeListaFinalAjuda.showmodal;
end;

end.
