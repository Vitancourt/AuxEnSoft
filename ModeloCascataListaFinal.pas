unit ModeloCascataListaFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, RpCon, RpConDS, RpDefine,
  RpRave, RpBase, RpSystem;

type
  TFormModeloCascataListaFinal = class(TForm)
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    Query: TZQuery;
    PanelRequisitos: TPanel;
    Source: TDataSource;
    gridRequisitos: TDBGrid;
    btnSelecionar: TBitBtn;
    btnImprimirLista: TBitBtn;
    btnVoltar: TBitBtn;
    edtProcurar: TLabeledEdit;
    rbtnTodos: TRadioButton;
    rbtnProposto: TRadioButton;
    rbtnRejeitados: TRadioButton;
    rbtnAprovados: TRadioButton;
    rbtnAvaliacao: TRadioButton;
    rbtnImplementacao: TRadioButton;
    rbtnImplementado: TRadioButton;
    PanelDados: TPanel;
    edtCod: TLabeledEdit;
    lblLista: TLabel;
    lblDados: TLabel;
    edtNome: TLabeledEdit;
    edtDataCriacao: TLabeledEdit;
    memoDescricao: TMemo;
    lblDescricao: TLabel;
    memoProblema: TMemo;
    lblProblema: TLabel;
    edtEstadoAtual: TLabeledEdit;
    edtTipo: TEdit;
    edtMetodo: TEdit;
    lblMetodo: TLabel;
    lblTipo: TLabel;
    memoSolucao: TMemo;
    lblSolucao: TLabel;
    edtDataSolucao: TLabeledEdit;
    btnImprimirUnidade: TBitBtn;
    rvProjectTodos: TRvProject;
    ConectaTodos: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    QueryTodos: TZQuery;
    QueryProposto: TZQuery;
    Conecta1: TRvDataSetConnection;
    rvProjectProposto: TRvProject;
    QueryRejeitado: TZQuery;
    Conecta2: TRvDataSetConnection;
    rvProjectRejeitado: TRvProject;
    QueryAprovado: TZQuery;
    Conecta3: TRvDataSetConnection;
    rvProjectAprovado: TRvProject;
    QueryAvaliacao: TZQuery;
    Conecta4: TRvDataSetConnection;
    rvProjectAvaliacao: TRvProject;
    QueryImplementacao: TZQuery;
    Conecta5: TRvDataSetConnection;
    rvProjectImplementacao: TRvProject;
    QueryImplementado: TZQuery;
    Conecta6: TRvDataSetConnection;
    rvProjectImplementado: TRvProject;
    QueryTbrequisito: TZQuery;
    QueryTbrequisitodefinicao: TZQuery;
    ConectatbRequisito: TRvDataSetConnection;
    ConectaTbrequisitoDefinicao: TRvDataSetConnection;
    rvProjectUnidade: TRvProject;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LogoffClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure rbtnTodosClick(Sender: TObject);
    procedure rbtnPropostoClick(Sender: TObject);
    procedure rbtnRejeitadosClick(Sender: TObject);
    procedure rbtnAprovadosClick(Sender: TObject);
    procedure rbtnAvaliacaoClick(Sender: TObject);
    procedure rbtnImplementacaoClick(Sender: TObject);
    procedure rbtnImplementadoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImprimirListaClick(Sender: TObject);
    procedure btnImprimirUnidadeClick(Sender: TObject);
    procedure edtCodChange(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataListaFinal: TFormModeloCascataListaFinal;

implementation

uses ModeloCascata, Home, ModeloCascataListaFinalAjuda;

{$R *.dfm}

procedure TFormModeloCascataListaFinal.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Atualiza query com todos requisitos do projeto
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataListaFinal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fecha o form e libera mem�ria
  FormModeloCascataListaFinal.Release;
  FormModeloCascataListaFinal:=Nil;
end;

procedure TFormModeloCascataListaFinal.LogoffClick(Sender: TObject);
begin
  //Faz logoff e volta para home
  FormModeloCascataListaFinal.Close;
  FormModeloCascata.Close;
  FormHome.Show;
end;

procedure TFormModeloCascataListaFinal.btnVoltarClick(Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataListaFinal.Close;
end;

procedure TFormModeloCascataListaFinal.edtProcurarChange(Sender: TObject);
begin
  //Atualiza o query segundo o que est� escrito e marcado no checkbox
  //Se Todos
  if (rbtnTodos.checked=True) then
  begin
    //Seleciona todos requisitos
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
  //Se Proposto
  if (rbtnProposto.checked=True) then
  begin
    //Seleciona requisitos com estado Proposto
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="PROPOSTO" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
  //Se Rejeitados
  if (rbtnRejeitados.checked=true) then
  begin
    //Seleciona requisitos com estado Rejeitados
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="REJEITADO" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
  //Se aprovados
  if (rbtnAprovados.Checked=true) then
  begin
    //Seleciona requisitos com estado Aprovado
    with query do
    begin
      query.close;
      query.sql.Clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
  //Se em avalia��o
  if (rbtnAvaliacao.checked=true) then
  begin
    //Seleciona requisitos com estado em avalia��o
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="EM AVALIA��O" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
  //Se em implementa��o
  if (rbtnImplementacao.checked=true) then
  begin
    //Seleciona requisitos com estado em implementa��o
    with query do
    begin
      query.close;
      query.SQL.Clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="EM IMPLEMENTA��O" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
  //Se implementado
  if (rbtnImplementado.checked=true) then
  begin
    //Seleicona requisitos com estado implementado
    with query do
    begin
      query.close;
      query.sql.Clear;
      query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="IMPLEMENTADO" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
end;

procedure TFormModeloCascataListaFinal.rbtnTodosClick(Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=True;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=False;
  //Limpar edtProcurar
  edtProcurar.Clear;
  //Atualiza lista com todos requisitos do projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
  end;
  //Seta cursor no edtProcurar
  edtProcurar.setFocus;
end;

procedure TFormModeloCascataListaFinal.rbtnPropostoClick(Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=False;
  rbtnProposto.checked:=True;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=False;
  //Limpa edtProcurar
  edtProcurar.clear;
  //Atualiza lista de requisitos somente com estado proposto
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.Text:=('select nome as Nome from tbrequisito where estado="PROPOSTO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  //Seta o cursor no edtProcurar
  edtProcurar.SetFocus
end;

procedure TFormModeloCascataListaFinal.rbtnRejeitadosClick(
  Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=False;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=True;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=False;
  //Limpa o edtProcurar
  edtProcurar.Clear;
  //Atualiza lista de requisitos com estado Rejeitado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbrequisito where estado="REJEITADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
  end;
  //Seta o cursor no edtprocurar
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataListaFinal.rbtnAprovadosClick(Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=False;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=True;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=False;
  //Limpa o edtProcurar
  edtProcurar.Clear;
  //Atualiza lista requisitos com estado Aprovado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  //Seta o cursos no edtProcura
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataListaFinal.rbtnAvaliacaoClick(Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=False;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=True;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=False;
  //Limpar o edtProcurar;
  edtProcurar.Clear;
  //Atualiza lista de requisito com estado Em Avalia��o
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where estado="EM AVALIA��O" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  //Seta o cursor no edtProcurar
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataListaFinal.rbtnImplementacaoClick(
  Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=False;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=True;
  rbtnImplementado.checked:=False;
  //Limpa edtProcurar
  edtProcurar.Clear;
  //Atualiza lista de requisitos com estado em implementa��o
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where estado="EM IMPLEMENTA��O" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
  end;
  //Seta o focus no edtProcurar
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataListaFinal.rbtnImplementadoClick(
  Sender: TObject);
begin
  //True nesse e false nos outros
  rbtnTodos.Checked:=False;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=True;
  //Limpar o edtprocurar
  edtProcurar.Clear;
  //Atualiza a lista de requisitos com estado Implementado
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.Text:=('select nome as Nome from tbrequisito where estado="IMPLEMENTADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
  end;
  //Seta o focus no edt procurar
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataListaFinal.btnSelecionarClick(Sender: TObject);
var
  //Vari�vel que ir� pegar o nome do requisito do gridRequisitos
  nome_requisito:String;
begin
  //Limpar os campos
  edtCod.Clear;
  edtNome.Clear;
  edtDataCriacao.Clear;
  memoDescricao.Lines.Clear;
  memoProblema.Lines.Clear;
  memoSolucao.Lines.Clear;
  edtDataSolucao.Clear;
  edtEstadoAtual.Clear;
  edtMetodo.Clear;
  edtTipo.Clear;
  //Armazena o nome do projeto do dbgrid na vari�vel
  nome_requisito:=(gridRequisitos.Columns.Items[0].Field).AsString;
  //Se nome_requisito for vazio aborta
  if (nome_requisito='') then
  begin
    showmessage('Selecione um requisito da lista por favor');
    gridRequisitos.SetFocus;
    Abort;
  end;
  //Seleciona o requisito de acordo com o nome e o codigo_projeto
  //Seleciona ta tbrequisito
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select * from tbrequisito where nome="'+nome_requisito+'" and codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1)');
    query.open;
    edtCod.Text:=Query.FieldByName('codigo').AsString;
    edtNome.Text:=Query.FieldByName('nome').AsString;
    edtDataCriacao.text:=Query.FieldByName('datacriacao').AsString;
    memoDescricao.Lines.text:=query.FieldByName('descricao').AsString;
    memoProblema.Lines.Text:=Query.FieldByName('problema').AsString;
    edtEstadoAtual.Text:=Query.FieldByName('estado').AsString;
    edtmetodo.Text:=Query.FieldByName('metodo').AsString;
    edtTipo.Text:=Query.FieldByName('tipo').AsString;
  end;
  //Seleciona da tbrequisitodefinicao
  if not(edtCod.text='') then
  begin
    with query do
    begin
      query.Close;
      query.SQL.clear;
      query.sql.text:=('select * from tbrequisitodefinicao where codigo_requisito="'+edtCod.Text+'"');
      query.Open;
      memoSolucao.Lines.Text:=Query.FieldByName('solucao').AsString;
      edtDataSolucao.Text:=Query.FieldByName('datasolucao').AsString;
    end;
  end;
  //Atualiza tabela
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  rbtnTodos.Checked:=True;
  rbtnProposto.checked:=False;
  rbtnRejeitados.Checked:=False;
  rbtnAprovados.Checked:=False;
  rbtnAvaliacao.Checked:=False;
  rbtnImplementacao.checked:=False;
  rbtnImplementado.checked:=False;
end;

procedure TFormModeloCascataListaFinal.btnImprimirListaClick(
  Sender: TObject);
begin
  //Executa impress�o de todos
  if (rbtnTodos.checked=True) then
  begin
    rvProjectTodos.Execute;
    rvProjectTodos.Close;
  end;
  //Executa impressao de proposto
  if (rbtnProposto.checked=True) then
  begin
    rvProjectProposto.Execute;
    rvProjectProposto.Close;
  end;
  //Executa impressao de Rejeitado
  if (rbtnRejeitados.Checked=True) then
  begin
    rvProjectRejeitado.Execute;
    rvProjectRejeitado.Close;
  end;
    //Executa impressao de Aprovado
  if (rbtnAprovados.Checked=True) then
  begin
    rvProjectAprovado.Execute;
    rvProjectAprovado.Close;
  end;
    //Executa impressao de em Avalia��o
  if (rbtnAvaliacao.Checked=True) then
  begin
    rvProjectAvaliacao.Execute;
    rvProjectAvaliacao.Close;
  end;
    //Executa impressao de em Implementacao
  if (rbtnImplementacao.Checked=True) then
  begin
    rvProjectImplementacao.Execute;
    rvProjectImplementado.Close;
  end;
    //Executa impressao de em Implementado
  if (rbtnImplementado.Checked=True) then
  begin
    rvProjectImplementado.Execute;
    rvProjectImplementado.Close;
  end;
end;

procedure TFormModeloCascataListaFinal.btnImprimirUnidadeClick(
  Sender: TObject);
begin
  //Se estiver vazio
  if (edtcod.text='') then
  begin
    Showmessage('Selecione um requisito da lista por favor');
    gridRequisitos.SetFocus;
    Abort;
  end
  else
  begin
    //Cria parametros para tbRequisito filtrar no rave
    with QueryTbrequisito do
    begin
      ParamByName('COD').Value:=edtCod.Text;
    end;
    //Cria parametros para tbRequisitoDefinicao filtrar no rave
    with QueryTbrequisitodefinicao do
    begin
      ParamByName('COD').Value:=edtCod.Text;
    end;
    with rvProjectUnidade do
    begin
      SetParam('COD',(edtCod.Text));
      rvProjectUnidade.Execute;
    end;
  end;
end;


procedure TFormModeloCascataListaFinal.edtCodChange(Sender: TObject);
begin
  //Libera bot�o Imprimir Unidade ou n�o
  if (edtCod.Text='') then
  begin
    btnImprimirUnidade.enabled:=False;
  end
  else
  begin
    btnImprimirUnidade.Enabled:=True;
  end;
end;


procedure TFormModeloCascataListaFinal.AjudaClick(Sender: TObject);
begin
  Application.CreateForm(tFormModeloCascataListaFinalAjuda, FormModeloCascataListaFinalAjuda);
  FormModeloCascataListaFinalAjuda.showmodal;
end;

end.
