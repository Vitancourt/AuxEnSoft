unit ModeloCascataTesteSistemaEditar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TformModeloCascataTesteSistemaEditar = class(TForm)
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    Query: TZQuery;
    Source: TDataSource;
    panelListadeTestes: TPanel;
    lblTesteDeSistemas: TLabel;
    gridTestedeSistema: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnSelecionar: TBitBtn;
    btnLimpar: TBitBtn;
    btnVoltar: TBitBtn;
    panelDefinicao: TPanel;
    lblDefinir: TLabel;
    lblEstado: TLabel;
    lblAvaliacao: TLabel;
    edtNomeRequisito: TLabeledEdit;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    cboxEstado: TComboBox;
    cboxAvaliacao: TComboBox;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logoff1Click(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtNomeRequisitoChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataTesteSistemaEditar: TformModeloCascataTesteSistemaEditar;

implementation

uses ModeloCascata, ModeloCascataTesteSistemaEditarAjuda;

{$R *.dfm}

procedure TformModeloCascataTesteSistemaEditar.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Seleciona o nome dos requisitos
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.Text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataTesteSistemaEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar e liberar memória
  formModeloCascataTesteSistemaEditar.release;
  formModeloCascataTesteSistemaEditar:=nil;
end;

procedure TformModeloCascataTesteSistemaEditar.Logoff1Click(
  Sender: TObject);
begin
  //Faz logoff
  FormModeloCascata.close;
  formModeloCascataTesteSistemaEditar.close;
end;

procedure TformModeloCascataTesteSistemaEditar.edtProcurarChange(
  Sender: TObject);
begin
  //Seleciona de acordo com o texto digitado
  with query do
  begin
    query.Close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where Nome like "'+edtProcurar.text+'%" and estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataTesteSistemaEditar.btnLimparClick(
  Sender: TObject);
begin
  edtProcurar.clear;
end;

procedure TformModeloCascataTesteSistemaEditar.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha
  formModeloCascataTesteSistemaEditar.close;
end;

procedure TformModeloCascataTesteSistemaEditar.btnSelecionarClick(
  Sender: TObject);
var
  nome_requisito, estado, avaliacao:string;
  codigo_requisito:integer;
begin
  //pega o nome do requisito
  nome_requisito:=(gridTestedeSistema.Columns.Items[0].Field).AsString;
  //Da um select de acordo com o requisito capturado
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome, codigo from tbrequisito where nome="'+nome_requisito+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    //Coloca os dados nos campos
    edtNomeRequisito.text:=nome_requisito;
    codigo_requisito:=Query.FieldByName('codigo').AsInteger;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbtestedesistema where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
    query.open;
    if query.IsEmpty then
    begin
    showmessage('O requisito nunca obteve um teste de sistema, sendo assim sua edição é impossível!');
    edtNomeRequisito.Clear;
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and estado="APROVADO"');
      query.open;
    end;
    abort;
    end;
    edtNome.text:=Query.FieldByName('nome').AsString;
    edtIdentificador.text:=Query.FieldByName('identificador').AsString;
    estado:=Query.FieldByName('estado').AsString;
    avaliacao:=Query.FieldByName('avaliacao').AsString;
    //Verifica variavel estado
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
    //Verifica variavel avaliacao
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
  //Seleciona o nome dos requisitos
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.Text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;

end;

procedure TformModeloCascataTesteSistemaEditar.edtNomeRequisitoChange(
  Sender: TObject);
begin
  //Se vazio
  if (edtNomeRequisito.Text='') then
  begin
    edtProcurar.Enabled:=True;
    btnSelecionar.Enabled:=True;
    gridTestedeSistema.Enabled:=True;
    btnLimpar.Enabled:=True;
    btnVoltar.Enabled:=True;
    edtNome.Enabled:=False;
    lblEstado.Enabled:=False;
    lblAvaliacao.Enabled:=False;
    cboxEstado.Enabled:=False;
    cboxAvaliacao.Enabled:=False;
    btnSalvar.Enabled:=False;
    btnExcluir.Enabled:=False;
    btnCancelar.Enabled:=False;
  end
  else
  begin
    edtProcurar.Enabled:=False;
    btnSelecionar.Enabled:=False;
    gridTestedeSistema.Enabled:=False;
    btnLimpar.Enabled:=False;
    btnVoltar.Enabled:=False;
    edtNome.Enabled:=True;
    lblEstado.Enabled:=True;
    lblAvaliacao.Enabled:=True;
    cboxEstado.Enabled:=True;
    cboxAvaliacao.Enabled:=True;
    btnSalvar.Enabled:=True;
    btnExcluir.Enabled:=True;
    btnCancelar.Enabled:=True;
  end;
end;

procedure TformModeloCascataTesteSistemaEditar.btnCancelarClick(
  Sender: TObject);
begin
  //Cancela edição
  edtNomeRequisito.clear;
  edtIdentificador.Clear;
  edtNome.Clear;
  cboxEstado.ItemIndex:=-1;
  cboxAvaliacao.ItemIndex:=-1;
end;

procedure TformModeloCascataTesteSistemaEditar.btnExcluirClick(
  Sender: TObject);
var
  codigo_requisito, resposta:integer;
begin
  //seleciona código do requisito do projeto pelo nome do edt
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojeto acesso order by codigo desc limit 1) and nome="'+edtNomeRequisito.text+'"');
    query.open;
    codigo_requisito:=Query.FieldByName('codigo').AsInteger;
  end;
  //Questiona exclusão
  resposta:=messagedlg('Você deseja excluir o teste de sistema do requisito '+edtNomeRequisito.text+'?',mtinformation,mbokcancel,0);
  //Se sim deleta
  if (resposta=1) then
  begin
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('delete from tbtestedesistema where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
      query.Open;
    end;
  end;
  //Atualiza grid
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.Text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  edtNomeRequisito.clear;
  edtIdentificador.clear;
  edtNome.clear;
  cboxEstado.itemindex:=-1;
  cboxAvaliacao.ItemIndex:=-1;
end;

procedure TformModeloCascataTesteSistemaEditar.btnSalvarClick(
  Sender: TObject);
var
  resposta,codigo_requisito:integer;
  tamanho, i, cont:integer;
  palavra, letra:string;
begin
    //Valida nome
    if (edtNome.text='') then
    begin
      showmessage('O campo nome é obrigatório!');
      abort;
    end;
    palavra:=edtNome.text;
    tamanho:=Length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i, 1);
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
      showmessage('O campo nome contém mais espaços do que letras!');
      abort;
    end;
  //Valida cbox estado
  if (cboxEstado.ItemIndex=-1) then
  begin
    showmessage('É necessário selecionar um estado!');
    abort;
  end;
  if (cboxAvaliacao.ItemIndex=-1) then
  begin
    showmessage('É necessário selecionar uma avaliação!');
    abort;
  end;
  //Questiona sobescrever o ultimo teste de requisito
  resposta:=messagedlg('Você deseja sobescrever o teste de sistema do requisito '+edtNomeRequisito.Text+'?',mtinformation,mbokcancel,0);
  if (resposta=1) then
  begin
    //Seleciona codigo requisito
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select codigo from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and nome="'+edtNomeRequisito.Text+'"');
      query.open;
      codigo_requisito:=query.fieldbyname('codigo').AsInteger;
    end;
    //Atualiza nome do teste de unidade
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('update tbtestedesistema set nome="'+edtNome.Text+'" where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
      query.ExecSQL;
    end;
    //Atualiza estado do teste de unidade
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('update tbtestedesistema set estado="'+cboxEstado.text+'" where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
      query.ExecSQL;
    end;
    //Atualiza avaliacao do teste de unidade
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('update tbtestedesistema set avaliacao="'+cboxAvaliacao.text+'" where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
      query.ExecSQL;
    end;
    //Atualiza lista de requisitos
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbrequisito where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and estado="APROVADO"');
      query.open;
    end;
    edtNomeRequisito.Clear;
    edtNome.Clear;
    edtIdentificador.Clear;
    cboxEstado.ItemIndex:=-1;
    cboxAvaliacao.ItemIndex:=-1;
  end;
end;

procedure TformModeloCascataTesteSistemaEditar.Ajuda1Click(
  Sender: TObject);
begin
  //Cria e exibe form
  Application.CreateForm(TformModeloCascataTesteSistemaEditarAjuda, formModeloCascataTesteSistemaEditarAjuda);
  formModeloCascataTesteSistemaEditarAjuda.ShowModal;
end;

end.
