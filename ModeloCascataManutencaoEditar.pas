unit ModeloCascataManutencaoEditar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TformModeloCascataManutencaoEditar = class(TForm)
    panelCriar: TPanel;
    lblCriar: TLabel;
    lblDesc: TLabel;
    lblResult: TLabel;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    memoDescricao: TMemo;
    cboxResultado: TComboBox;
    btnSalvar: TBitBtn;
    btnLimpar: TBitBtn;
    panelLista: TPanel;
    lblLista: TLabel;
    gridManutencao: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnConcluido: TBitBtn;
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    query: TZQuery;
    source: TDataSource;
    btnSelecionar: TButton;
    btnExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logoff1Click(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConcluidoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtIdentificadorChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataManutencaoEditar: TformModeloCascataManutencaoEditar;

implementation

uses ModeloCascata, ModeloCascataManutencaoEditarAjuda;

{$R *.dfm}

procedure TformModeloCascataManutencaoEditar.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Carrega a lista de manutenção
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataManutencaoEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar e liberar memória
  formModeloCascataManutencaoEditar.release;
  formModeloCascataManutencaoEditar:=nil;
end;

procedure TformModeloCascataManutencaoEditar.Logoff1Click(Sender: TObject);
begin
  //Faz logoff
  formModeloCascata.Close;
  formModeloCascataManutencaoEditar.Close;
end;

procedure TformModeloCascataManutencaoEditar.edtProcurarChange(
  Sender: TObject);
begin
  //Seleciona de acordo com o edt
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbManutencao where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataManutencaoEditar.btnSelecionarClick(
  Sender: TObject);
var
  nome_manutencao,resultado:string;
begin

   //Pega o nome da manutencao na variavel
   nome_manutencao:=(gridManutencao.Columns.Items[0].Field).AsString;
   //Se estiver vazio
   if (nome_manutencao='') then
   begin
    showmessage('Selecione uma manutenção da lista!');
    gridManutencao.setFocus;
    abort;
   end
   else
   begin
    //manda os dados para os edits
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select * from tbmanutencao where nome="'+nome_manutencao+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
      edtIdentificador.text:=Query.FieldByName('identificador').AsString;
      edtNome.text:=Query.FieldByName('nome').AsString;
      memoDescricao.Lines.text:=Query.FieldByName('descricao').AsString;
      resultado:=Query.FieldByName('resultado').AsString;
      if (resultado='BOM') then
      begin
        cboxResultado.ItemIndex:=0;
      end;
      if (resultado='REGULAR') then
      begin
        cboxResultado.ItemIndex:=1;
      end;
      if (resultado='RUIM') then
      begin
        cboxResultado.ItemIndex:=2;
      end;
    end;
   end;
   //Atualiza lista
   with query do
   begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
   end;
end;

procedure TformModeloCascataManutencaoEditar.btnExcluirClick(
  Sender: TObject);
var
  nome_manutencao:string;
  resposta, codigo_projeto:integer;
begin
  //pega o nome da manutençao
  nome_manutencao:=(gridManutencao.Columns.Items[0].Field).AsString;
  //dialogo de exclusao
  resposta:=messagedlg('Você deseja realmente excluir a manutenção "'+nome_manutencao+'"?',mtinformation,mbokcancel,0);
    //pega o codigo_projeto
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
      query.open;
      codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
    end;
  if (resposta=1) then
  begin
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('delete from tbmanutencao where nome="'+nome_manutencao+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
      query.ExecSQL;
      showmessage('A manutenção "'+nome_manutencao+'" foi excluida!');
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
      end;
    end;
  end;
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
      end;

end;

procedure TformModeloCascataManutencaoEditar.btnConcluidoClick(
  Sender: TObject);
begin
  //Fecha
  formModeloCascataManutencaoEditar.close;
end;

procedure TformModeloCascataManutencaoEditar.btnLimparClick(
  Sender: TObject);
begin
  //Limpa os campos
  edtIdentificador.clear;
  edtnome.clear;
  memoDescricao.lines.clear;
  cboxresultado.itemindex:=-1;
end;

procedure TformModeloCascataManutencaoEditar.edtIdentificadorChange(
  Sender: TObject);
begin
  //Verifica vazio e libera botoes ou bloqueia
  if (edtIdentificador.text='') then
  begin
    lblDesc.Enabled:=False;
    memoDescricao.Enabled:=False;
    lblResult.Enabled:=False;
    cboxResultado.Enabled:=False;
    btnSalvar.Enabled:=False;
    btnLimpar.Enabled:=False;
  end
  else
  begin
    lblDesc.Enabled:=True;
    memoDescricao.Enabled:=True;
    lblResult.Enabled:=True;
    cboxResultado.Enabled:=True;
    btnSalvar.Enabled:=True;
    btnLimpar.Enabled:=True;
  end;
end;

procedure TformModeloCascataManutencaoEditar.btnSalvarClick(
  Sender: TObject);
var
  codigo_projeto, tamanho, i ,cont:integer;
  letra, palavra,nome_manutencao, identificador:string;
begin
  nome_manutencao:=edtNome.text;
  identificador:=edtIdentificador.text;
  if (memoDescricao.Lines.text='') then
  begin
    showmessage('Campos com * são obrigatórios!');
    memoDescricao.setfocus;
    abort;
  end;
  //Verifica os campos
  palavra:=memoDescricao.Lines.text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra, i, 1);
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
    showmessage('O campo descrição contém mais espaços do que letras!');
    memoDescricao.SetFocus;
    abort;
  end;
  if (cboxResultado.ItemIndex=-1) then
  begin
    showmessage('É necessário no mínimo um item selecionado no campo resultado!');
    cboxResultado.SetFocus;
    abort;
  end;
  //coleta o codigo_projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  //Atualiza descricao
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('update tbmanutencao set descricao="'+memoDescricao.lines.text+'" where identificador="'+identificador+'" and nome="'+nome_manutencao+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.ExecSQL;
  end;
  //Atualiza resultado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('update tbmanutencao set resultado="'+cboxResultado.text+'" where identificador="'+identificador+'" and nome="'+nome_manutencao+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.ExecSQL;
  end;
  showmessage('A manutenção "'+nome_manutencao+'" foi editada!');
  //Limpa os campos
  edtIdentificador.clear;
  edtNome.clear;
  memoDescricao.lines.clear;
  cboxResultado.ItemIndex:=-1;
  //Atualiza os campos
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.SQL.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;

end;

procedure TformModeloCascataManutencaoEditar.Ajuda1Click(Sender: TObject);
begin
  //Cria e exibe
  Application.CreateForm(TformModeloCascataManutencaoEditarAjuda, formModeloCascataManutencaoEditarAjuda);
  formModeloCascataManutencaoEditarAjuda.showmodal;
end;

end.
