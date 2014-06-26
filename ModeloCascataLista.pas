unit ModeloCascataLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, DB, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls;

type
  TFormModeloCascataLista = class(TForm)
    Panel: TPanel;
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    btnVoltar: TBitBtn;
    btnAtualizar: TBitBtn;
    btnExcluir: TBitBtn;
    Query: TZQuery;
    gridRequisito: TDBGrid;
    Source: TDataSource;
    lblProcurar: TLabel;
    edtProcurar: TEdit;
    Panel1: TPanel;
    edtNome: TLabeledEdit;
    lblDescricao: TLabel;
    memoDescricao: TMemo;
    lblProblema: TLabel;
    memoProblema: TMemo;
    btnEditar: TBitBtn;
    cboxEstadoNovo: TComboBox;
    lblEstadoNovo: TLabel;
    lblTipo: TLabel;
    lblMetodo: TLabel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnVoltar1: TBitBtn;
    edtCod: TLabeledEdit;
    edtTipo: TEdit;
    edtMetodo: TEdit;
    edtDataCriacao: TLabeledEdit;
    lbltitulo: TLabel;
    lblListaRequisito: TLabel;
    edtEstadoAtual: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LogoffClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataLista: TFormModeloCascataLista;
  //Variável que irá armazenar o nome do requisito para cellclick

  codigo_requisito,nome_requisito, datacriacao, descricao, problema,estado, tipo, metodo, solucao, datasolucao:String;

implementation

uses Inicio, Home, ModeloCascata, ModeloCascataExtracao,
  ModeloCascataListaAjuda, ModeloCascataAjuda,
  ModeloCascataListaFinalAjuda;

{$R *.dfm}

procedure TFormModeloCascataLista.FormCreate(Sender: TObject);
begin
  nome_requisito:='';
  //Inicia o gridRequisito com os requisitos do projeto
  with query do
  begin
    query.Close;
    query.sql.Clear;
    query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataLista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormModeloCascataLista.Release;
  FormModeloCascataLista:=Nil;
end;

procedure TFormModeloCascataLista.LogoffClick(Sender: TObject);
begin
  //Fazer logoff, fechando
  //FormModeloCascataExtrecao, FormModeloCascata
  //e voltar ao home
  FormModeloCascataLista.Close;
  FormModeloCascata.Close;
  FormHome.Show;
end;

procedure TFormModeloCascataLista.btnVoltarClick(Sender: TObject);
begin
  //Fecha o form e volta para FormModeloCascata
  FormModeloCascataLista.Close;
  FormModeloCascata.Show;
end;

procedure TFormModeloCascataLista.edtProcurarChange(Sender: TObject);
begin
  //Seleciona no gridRequisito os requisitos do projeto
  with query do
  begin
    query.Close;
    query.sql.Clear;
    query.sql.text:=('select nome as Nome from tbrequisito where nome like "'+edtprocurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataLista.btnAtualizarClick(Sender: TObject);
begin
  //Atualiza o gridRequisito com os requisitos do projeto
  with query do
  begin
    query.close;
    query.SQL.Clear;
    query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  edtProcurar.SetFocus;
end;


procedure TFormModeloCascataLista.btnExcluirClick(Sender: TObject);
var
  resposta,codigo_requisito,codigo_projeto:integer;
  nome_requisito:string;
begin
  //Armazena o nome do projeto do dbgrid na variável
  nome_Requisito:=(gridRequisito.Columns.Items[0].Field).AsString;
  //Se o nome do requisito for vazio
  if (nome_requisito='') then
  begin
    messagedlg('Por favor, selecione algum requisito da lista!',mtinformation,mbokcancel,0);
    abort;
  end;
  //Pega o codigo do projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  //Pega o codigo_requisito com o nome_requisito
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.Text:=('select codigo from tbrequisito where nome="'+nome_requisito+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.Open;
    codigo_requisito:=Query.FieldByName('codigo').AsInteger;
  end;
  //Armazena resposta
  resposta:=messagedlg('Tem certeza que deseja excluir o requisito? com ele você excluira todos os dados relacionados a este requisito! '+nome_requisito+'?',mterror,mbokcancel,0);
  //Se resposta for sim
  if (resposta=1) then
  begin
    //DeleteRequisito
    with query do
    begin
      query.close;
      query.SQL.Clear;
      query.sql.text:=('delete from tbrequisito where nome=("'+nome_requisito+'")');
      query.open;
        //Atualiza o gridRequisito após exclusção
        with query do
        begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
        end;
    end;
    if not (codigo_requisito=0) then
    begin
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('delete from tbrequisitodefinicao where codigo_requisito=("'+IntToStr(codigo_requisito)+'")');
        query.open;
          //Atualiza o gridRequisito após exclusção
          with query do
          begin
            query.close;
            query.sql.clear;
            query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
            query.open;
          end;
      end;
    end;
  end
  else
  begin
    showmessage('Exclusão cancelada!');
  end;

end;

procedure TFormModeloCascataLista.AjudaClick(Sender: TObject);
begin
  //Cria o form ajuda e exibe
  Application.CreateForm(TformModeloCascataListaAjuda, formModeloCascataListaAjuda);
  formModeloCascataListaAjuda.ShowModal;
end;

procedure TFormModeloCascataLista.btnVoltar1Click(Sender: TObject);
begin
  //Fecha o form e volta para FormModeloCascata
  FormModeloCascataLista.Close;
  FormModeloCascata.Show;
end;

procedure TFormModeloCascataLista.btnCancelarClick(Sender: TObject);
begin
  //Limpar todos os campos
  edtCod.Clear;
  edtNome.clear;
  memoDescricao.clear;
  memoProblema.Clear;
  cBoxEstadoNovo.Itemindex:=-1;
  edtEstadoAtual.Clear;
  edtTipo.clear;
  edtMetodo.clear;
end;

procedure TFormModeloCascataLista.btnEditarClick(Sender: TObject);
begin
  //Limpa os campos
  edtCod.Clear;
  edtNome.clear;
  edtDataCriacao.clear;
  memoDescricao.Lines.clear;
  memoProblema.Lines.clear;
  cboxEstadoNovo.ItemIndex:=-1;
  edtEstadoAtual.Clear;
  edtTipo.Clear;
  edtMetodo.Clear;
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

  //Puxa problema

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

procedure TFormModeloCascataLista.btnSalvarClick(Sender: TObject);
var
  //Variáveis para validação dos campos
  palavra,letra:string;
  cont,i,tamanho:integer;
  //Armazenara a resposta do salvar para atualizar a data do query
  resposta:integer;
begin
  //Validação de campos vazios
  if (edtcod.text='') then
  begin
    messagedlg('Por favor selecione um requisito ao lado para edição!',mterror,mbokcancel,0);
    abort;
  end;
  if (memoDescricao.Lines.Text='') then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    memoDescricao.setfocus;
    abort;
  end;
  if (memoProblema.Lines.Text='') then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    memoProblema.setfocus;
    abort;
  end;
  if (cboxEstadoNovo.itemindex=-1)then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    cboxEstadoNovo.ItemIndex:=-1;
    cboxEstadoNovo.setfocus;
    abort;
  end;
  if (edtTipo.text='') then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    edtTipo.setfocus;
    abort;
  end;
  if (edtMetodo.text='') then
  begin
    messagedlg('Os campos com * são obrigatórios!',mterror,mbokcancel,0);
    edtMetodo.setfocus;
    abort;
  end;
  //Validação contra muitos espaços MemoDescricao
  palavra:=MemoDescricao.Lines.Text;
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
      memoDescricao.setfocus;
      abort;
    end;
  //Validação contra muitos espaços MemoProblema
  palavra:=MemoProblema.Lines.Text;
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
      memoProblema.setfocus;
      abort;
    end;


    //Atualiza o campo Descricao
    with query do
    begin
      query.close;
      query.SQL.clear;
      query.sql.text:=('update tbrequisito set descricao="'+memoDescricao.Lines.Text+'" where codigo="'+edtCod.text+'"');
      query.ExecSQL;
    end;
    //Atualiza o campo Problema
    with query do
    begin
      query.close;
      query.SQL.Clear;
      query.sql.text:=('update tbrequisito set problema="'+memoproblema.Lines.Text+'" where codigo="'+edtCod.text+'"');
      query.ExecSQL;
    end;
    //Atualiza o campo Estado
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('update tbrequisito set estado="'+cboxEstadoNovo.text+'" where codigo="'+edtCod.text+'"');
      query.open;
    end;

    //Atualiza Lista de requisitos grid Requisitos
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
    end;


    //Exibe mensagem de Definição ou edição concluida
    showmessage('Requisito '+edtNome.text+' foi editado com sucesso!');
    
    //Limpa os campos após definição ou edição
    edtCod.Clear;
    edtNome.Clear;
    memoDescricao.Lines.Clear;
    memoProblema.lines.Clear;
    cboxEstadoNovo.itemindex:=-1;
    edtEstadoAtual.clear;
    edtTipo.clear;
    edtMetodo.clear;
  end;

procedure TFormModeloCascataLista.edtCodChange(Sender: TObject);
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

end.
