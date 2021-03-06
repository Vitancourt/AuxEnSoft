unit ModeloCascataTesteSistemaListaFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Buttons, ExtCtrls, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus, RpCon, RpConDS,
  RpDefine, RpRave;

type
  TformModeloCascataTesteSistemaListaFinal = class(TForm)
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    Query: TZQuery;
    panelListadeTestes: TPanel;
    lblTesteDeSistemas: TLabel;
    gridTestedeSistema: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnSelecionar: TBitBtn;
    btnLimpar: TBitBtn;
    btnVoltar: TBitBtn;
    Source: TDataSource;
    panelDefinicao: TPanel;
    lblDefinir: TLabel;
    lblEstado: TLabel;
    lblAvaliacao: TLabel;
    edtNomeRequisito: TLabeledEdit;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    cboxEstado: TComboBox;
    cboxAvaliacao: TComboBox;
    btnCancelar: TBitBtn;
    btnrelatoriodesc: TBitBtn;
    BitBtn2: TBitBtn;
    raveLista: TRvProject;
    conectaLista: TRvDataSetConnection;
    queryLista: TZQuery;
    queryDesc: TZQuery;
    ConectaDesc: TRvDataSetConnection;
    raveDesc: TRvProject;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logoff1Click(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtNomeRequisitoChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnrelatoriodescClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataTesteSistemaListaFinal: TformModeloCascataTesteSistemaListaFinal;

implementation

uses ModeloCascata, ModeloCascataTesteSistemaListaFinalAjuda;

{$R *.dfm}

procedure TformModeloCascataTesteSistemaListaFinal.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Carrega lista final de testes de unidade
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select req.nome as Nome from tbrequisito as req, tbtestedesistema as teste where req.codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and req.codigo=teste.codigo_requisito');
    query.open;
  end;
end;

procedure TformModeloCascataTesteSistemaListaFinal.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera mem
  formModeloCascataTesteSistemaListaFinal.Release;
  formModeloCascataTesteSistemaListaFinal:=nil;
end;

procedure TformModeloCascataTesteSistemaListaFinal.Logoff1Click(
  Sender: TObject);
begin
  //Faz logoff
  formmodelocascata.close;
  formModeloCascataTesteSistemaListaFinal.close;
end;

procedure TformModeloCascataTesteSistemaListaFinal.edtProcurarChange(
  Sender: TObject);
begin
  //seleciona de acordo com o texto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select req.nome as Nome from tbrequisito as req, tbtestedesistema as teste where req.nome like "'+edtProcurar.text+'%" and req.codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and req.codigo=teste.codigo_requisito');
  end;
end;

procedure TformModeloCascataTesteSistemaListaFinal.btnLimparClick(
  Sender: TObject);
begin
  edtProcurar.Clear;
end;

procedure TformModeloCascataTesteSistemaListaFinal.btnCancelarClick(
  Sender: TObject);
begin
  //Limpar tudo
  edtNomeRequisito.clear;
  edtIdentificador.clear;
  edtNome.Clear;
  cboxEstado.ItemIndex:=-1;
  cboxAvaliacao.ItemIndex:=-1;
end;

procedure TformModeloCascataTesteSistemaListaFinal.btnVoltarClick(
  Sender: TObject);
begin
  formModeloCascataTesteSistemaListaFinal.close;
end;

procedure TformModeloCascataTesteSistemaListaFinal.btnSelecionarClick(
  Sender: TObject);
var
  nome_requisito, estado, avaliacao:string;
  codigo_requisito:integer;

begin
  //Pega o nome do requisito
  nome_requisito:=(gridTestedeSistema.Columns.Items[0].Field).AsString;
  //Insere os dados de acordo com o nome do requisito
  edtNomeRequisito.text:=nome_requisito;
  //seleciona codigo do requisto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and nome="'+nome_requisito+'"');
    query.open;
    codigo_requisito:=query.fieldbyname('codigo').AsInteger;
  end;
  //seleciona dados do teste de unidade do requisito
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbtestedesistema where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
    query.open;
    edtIdentificador.text:=Query.FieldByName('identificador').AsString;
    edtNome.Text:=query.fieldbyname('nome').AsString;
    estado:=query.fieldbyname('estado').AsString;
    avaliacao:=query.fieldbyname('avaliacao').AsString;
    if (estado='APROVADO') then
    begin
      cboxEstado.ItemIndex:=0;
    end;
    if (estado='PENDENTE') then
    begin
      cboxEstado.ItemIndex:=1;
    end;
    if (estado='REPROVADO') then
    begin
      cboxEstado.ItemIndex:=2;
    end;
    if (avaliacao='BOM') then
    begin
      cboxAvaliacao.ItemIndex:=0;
    end;
    if (avaliacao='REGULAR') then
    begin
      cboxAvaliacao.ItemIndex:=1;
    end;
    if (avaliacao='RUIM') then
    begin
      cboxAvaliacao.ItemIndex:=2;
    end;
  end;
  //Carrega lista final de testes de unidade
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select req.nome as Nome from tbrequisito as req, tbtestedesistema as teste where req.codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and req.codigo=teste.codigo_requisito');
    query.open;
  end;
end;

procedure TformModeloCascataTesteSistemaListaFinal.edtNomeRequisitoChange(
  Sender: TObject);
begin
  if (edtNomeRequisito.text='') then
  begin
    btnrelatoriodesc.enabled:=False;
  end
  else
  begin
    btnrelatoriodesc.Enabled:=True;
  end;
end;

procedure TformModeloCascataTesteSistemaListaFinal.BitBtn2Click(
  Sender: TObject);
begin
  //Executa relat�rio
  raveLista.Execute;
  raveLista.close;
end;

procedure TformModeloCascataTesteSistemaListaFinal.btnrelatoriodescClick(
  Sender: TObject);
begin
  //Verifica se est� preenchido
  if (edtNomeRequisito.text='') then
  begin
    showmessage('Selecione um requisito!');
    abort;
  end;
    with queryDesc do
    begin
      ParamByName('nome').Value:=edtNomeRequisito.Text;
    end;
    with raveDesc do
    begin
      SetParam('nome',(edtNomeRequisito.Text));
      raveDesc.Execute;
      raveDesc.Close;
    end;
end;

procedure TformModeloCascataTesteSistemaListaFinal.Ajuda1Click(
  Sender: TObject);
begin
  //Cria e exibe form
  Application.CreateForm(TformModeloCascataTesteSistemaListaFinalAjuda, formModeloCascataTesteSistemaListaFinalAjuda);
  formModeloCascataTesteSistemaListaFinalAjuda.showmodal;
end;

end.
