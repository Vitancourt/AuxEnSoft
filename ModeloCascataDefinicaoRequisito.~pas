unit ModeloCascataDefinicaoRequisito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFormModeloCascataDefinicaoRequisito = class(TForm)
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    Query: TZQuery;
    Panel1: TPanel;
    lblListaRequisito: TLabel;
    Source: TDataSource;
    gridRequisito: TDBGrid;
    lblProcurar: TLabel;
    edtProcurar: TEdit;
    lbltitulo: TLabel;
    Panel2: TPanel;
    lblDescricao: TLabel;
    lblProblema: TLabel;
    lblEstadoNovo: TLabel;
    lblTipo: TLabel;
    lblMetodo: TLabel;
    edtNome: TLabeledEdit;
    memoDescricao: TMemo;
    memoProblema: TMemo;
    cboxEstadoNovo: TComboBox;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnVoltar1: TBitBtn;
    edtCod: TLabeledEdit;
    edtTipo: TEdit;
    edtMetodo: TEdit;
    edtDataCriacao: TLabeledEdit;
    edtEstadoAtual: TLabeledEdit;
    btnAtualizar: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnVoltar: TBitBtn;
    lblSolucao: TLabel;
    memoSolucao: TMemo;
    edtDataSolucao: TLabeledEdit;
    edtDataAtual: TLabeledEdit;
    procedure LogoffClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtCodChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataDefinicaoRequisito: TFormModeloCascataDefinicaoRequisito;
  //Variável que irá armazenar o nome do requisito para cellclick

  codigo_projeto,codigo_requisito,nome_requisito, datacriacao, descricao, problema,estado, tipo, metodo, solucao, datasolucao:String;

implementation

uses ModeloCascata, Home, ModeloCascataDefinicaoRequisitoAjuda;

{$R *.dfm}

procedure TFormModeloCascataDefinicaoRequisito.LogoffClick(
  Sender: TObject);
begin
  //Faz logoff e volta para o FormHome
  FormModeloCascataDefinicaoRequisito.close;
  FormModeloCascata.close;
end;

procedure TFormModeloCascataDefinicaoRequisito.FormCreate(Sender: TObject);
begin
  edtDataSolucao.text:=DateToStr(Date);
  //Pega data
  edtDataAtual.text:=DateToStr(Date);
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //seleciona codigo-projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsString;
  end;
  //Seleciona requisitos somente do projeto que está sendo usado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataDefinicaoRequisito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha o form e libera memória
  FormModeloCascataDefinicaoRequisito.Release;
  FormModeloCascataDefinicaoRequisito:=Nil;
end;

procedure TFormModeloCascataDefinicaoRequisito.edtProcurarChange(
  Sender: TObject);
begin
  //Seleciona requisitos somente do projeto que está sendo usado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataDefinicaoRequisito.btnAtualizarClick(
  Sender: TObject);
begin
  //Seleciona requisitos somente do projeto que está sendo usado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataDefinicaoRequisito.edtCodChange(
  Sender: TObject);
begin
  //Ativa os botões de edição se houver algum codigo neste campo
  if (edtcod.text='') then
  begin
    btnCancelar.enabled:=False;
    btnSalvar.Enabled:=False;
    btnVoltar1.enabled:=False;
    btnAtualizar.Enabled:=True;
    btnEditar.Enabled:=True;
    btnExcluir.Enabled:=True;
    btnVoltar.Enabled:=True;
  end
  else
  begin
    btnCancelar.Enabled:=True;
    btnSalvar.Enabled:=True;
    btnVoltar1.enabled:=True;
    btnAtualizar.Enabled:=False;
    btnEditar.Enabled:=False;
    btnExcluir.Enabled:=False;
    btnVoltar.Enabled:=False;
  end;
end;

procedure TFormModeloCascataDefinicaoRequisito.btnEditarClick(
  Sender: TObject);
begin
  //Limpa os campos
  edtCod.Clear;
  edtNome.clear;
  edtDataCriacao.clear;
  memoDescricao.Lines.clear;
  memoProblema.Lines.clear;
  memoSolucao.Lines.Clear;
  cboxEstadoNovo.ItemIndex:=-1;
  edtEstadoAtual.Clear;
  edtTipo.Clear;
  edtMetodo.Clear;
  //Pega data
  edtDataAtual.text:=DateToStr(Date);
  //Armazena o nome do projeto do dbgrid na variável
  nome_requisito:=(gridRequisito.Columns.Items[0].Field).AsString;
  //Armazena toda tabela em variáveis
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.SQL.text:=('select * from tbrequisito where nome=("'+nome_requisito+'")');
    query.open;
    codigo_requisito:=Query.FieldByName('codigo').asString;
    nome_requisito:=Query.FieldbyName('nome').asString;
    descricao:=Query.FieldByName('descricao').asString;
    problema:=Query.FieldByName('problema').asString;
    estado:=Query.FieldByname('estado').AsString;
    tipo:=Query.FieldByName('tipo').asString;
    metodo:=Query.FieldByName('metodo').asString;
    datacriacao:=Query.FieldByName('datacriacao').AsString;
  end;
  
  //Exibe as variáveis nos campos
  edtCod.text:=codigo_requisito;
  edtNome.text:=nome_requisito;
  edtDataCriacao.text:=datacriacao;
  memoDescricao.lines.Text:=descricao;
  memoProblema.lines.Text:=problema;
  edtEstadoAtual.text:=estado;
  edtTipo.text:=tipo;
  edtMetodo.text:=metodo;

  //Seleciona Solucao e Data Solucao se tiver
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbrequisitodefinicao where codigo_requisito="'+codigo_requisito+'"');
    query.Open;
    solucao:=Query.FieldByName('solucao').AsString;
    datasolucao:=Query.FieldByName('datasolucao').AsString;
  end;

  //Insere Solucao e data Solucao nos campos
  memoSolucao.Lines.Text:=solucao;
  edtDataSolucao.Text:=datasolucao;
  
  //Atualiza o gridRequisito
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.SQL.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;

  //Limpa o edtPesquisar
  edtProcurar.Clear;
end;

procedure TFormModeloCascataDefinicaoRequisito.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataDefinicaoRequisito.Close;
end;

procedure TFormModeloCascataDefinicaoRequisito.btnExcluirClick(
  Sender: TObject);
var
  resposta,codigo_requisito,codigo_projeto:integer;
begin
  //Armazena o nome do projeto do dbgrid na variável
  nome_Requisito:=(gridRequisito.Columns.Items[0].Field).AsString;
  //Se o nome do requisito for vazio
  if (nome_requisito='') then
  begin
    messagedlg('Por favor, dê dois cliques em um requisito na lista!',mtinformation,mbokcancel,0);
    abort;
  end;
  //Seleciona o codigo_projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  //Seleciona o codigo_requisito
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbrequisito where nome="'+nome_requisito+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.open;
    codigo_requisito:=Query.FieldByName('codigo').AsInteger;
  end;
  //Armazena resposta
  resposta:=messagedlg('Tem certeza que deseja excluir o requisito? com ele você excluira todos os dados relacionados a este requisito! '+nome_requisito+'?',mterror,mbokcancel,0);
  //Se resposta for sim
  if (resposta=1) then
  begin
    //Deleta requisito
    with query do
    begin
      query.close;
      query.SQL.Clear;
      query.sql.text:=('delete from tbrequisito where nome=("'+nome_requisito+'") and codigo_projeto=("'+IntToStr(codigo_projeto)+'")');
      query.open;
    end;
    //Deleta definicao
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('delete from tbrequisitodefinicao where codigo_requisito=("'+IntToStr(codigo_requisito)+'")');
      query.Open;
    end;
    //Atualiza o gridRequisito após exclusção
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
    end;
  end
  else
  begin
    showmessage('Exclusão cancelada!');
  end;
end;

procedure TFormModeloCascataDefinicaoRequisito.btnVoltar1Click(
  Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataDefinicaoRequisito.Close;
end;

procedure TFormModeloCascataDefinicaoRequisito.btnCancelarClick(
  Sender: TObject);
begin
  //Limpa os campos
  edtCod.clear;
  edtNome.Clear;
  edtDataCriacao.Clear;
  memoDescricao.Lines.Clear;
  memoProblema.Lines.Clear;
  memoSolucao.Lines.Clear;
  edtEstadoAtual.Clear;
  cboxEstadoNovo.ItemIndex:=-1;
  edtTipo.Clear;
  edtMetodo.Clear;
  edtDataSolucao.text:=DateToStr(Date);
end;

procedure TFormModeloCascataDefinicaoRequisito.btnSalvarClick(
  Sender: TObject);
var
  //Variáveis para validação do campo memoSolucao
  palavra,letra:String;
  tamanho,i,cont:integer;
  verificador:integer;
begin
  //Valida cboxEstado Atual contra vazio
  if (cboxEstadoNovo.ItemIndex=-1) then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    cboxEstadoNovo.SetFocus;
    Abort;
  end;
  //Valida campo memoSolucao contra vazio e espaços excessivos
  if (memoSolucao.Lines.Text='') then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    memoSolucao.setfocus;
    abort;
  end;
  palavra:=memoSolucao.Lines.Text;
  tamanho:=length(palavra);
  cont:=0;
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra,i,1);
    if (letra=' ') then
    begin
      cont:=cont-1;
    end
    else
    begin
      cont:=cont+2;
    end;
  end;
  if (cont<0) then
  begin
      messagedlg('Não insira muitos espaços neste campo!',mterror,mbokcancel,0);
      memoSolucao.SetFocus;
      abort;
  end;

  //Da um update na tbrequisito com o EstadoNovo do requisito
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.text:=('update tbrequisito set estado="'+cboxEstadoNovo.text+'" where codigo="'+edtCod.text+'"');
    query.Open;
  end;
  //Da um select na tbrequisitodefinicao para ver se ja tem este requisito definido
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbrequisitodefinicao where codigo_requisito="'+edtCod.text+'"');
    query.open;
    if query.isempty then
    begin
      //Se a query retornar vazia da um insert
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('insert into tbrequisitodefinicao (solucao,datasolucao,codigo_projeto, codigo_requisito) values ("'+memoSolucao.Lines.Text+'","'+edtDataAtual.text+'","'+codigo_projeto+'","'+edtCod.Text+'")');
        query.ExecSQL;
      end;
      showmessage('Requisito definido com sucesso!');
      //Limpa os campos
      edtCod.Clear;
      edtNome.Clear;
      edtDataCriacao.Clear;
      MemoDescricao.Lines.Clear;
      memoProblema.Lines.Clear;
      memoSolucao.Lines.Clear;
      edtDataSolucao.Clear;
      edtEstadoAtual.Clear;
      cboxEstadoNovo.ItemIndex:=-1;
      edtTipo.Clear;
      edtMetodo.Clear;
      end;
    end;

    //Da um select na tbrequisitodefinicao para ver se ja tem este requisito definido
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbrequisitodefinicao where codigo_requisito="'+edtCod.text+'"');
    query.open;
    if not query.isempty then
    begin
      //Se a query retornar com dados de um update nos campos
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('update tbrequisitodefinicao set solucao="'+memoSolucao.Lines.Text+'" where codigo_requisito="'+edtCod.text+'"');
        query.open;
      end;
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('update tbrequisitodefinicao set datasolucao="'+edtDataAtual.text+'" where codigo_requisito="'+edtCod.Text+'"');
        query.Open;
      end;
      //Atualiza gridRequisito
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
        //Limpa os campos
        edtCod.Clear;
        edtNome.Clear;
        edtDataCriacao.Clear;
        MemoDescricao.Lines.Clear;
        memoProblema.Lines.Clear;
        memoSolucao.Lines.Clear;
        edtDataSolucao.Clear;
        edtEstadoAtual.Clear;
        cboxEstadoNovo.ItemIndex:=-1;
        edtTipo.Clear;
        edtMetodo.Clear;
        //Exibe mensagem de sucesso
        showmessage('Requisito redefinido com sucesso!');
      end;
    end;
  end;


      //AtualizaGrid
    with query do
    begin
       query.close;
       query.sql.clear;
       query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
       query.open;
    end;
end;

procedure TFormModeloCascataDefinicaoRequisito.AjudaClick(Sender: TObject);
begin
  //Cria o form ModeloCascataDefinicaoRequisitoAjuda
  Application.CreateForm(TFormModeloCascataDefinicaoRequisitoAjuda, FormModeloCascataDefinicaoRequisitoAjuda);
  FormModeloCascataDefinicaoRequisitoAjuda.ShowModal;
end;

end.
