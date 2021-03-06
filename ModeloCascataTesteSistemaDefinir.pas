unit ModeloCascataTesteSistemaDefinir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, Buttons, Grids, DBGrids;

type
  TformModeloCascataTesteSistemaDefinir = class(TForm)
    panelListadeTestes: TPanel;
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    Query: TZQuery;
    lblTesteDeSistemas: TLabel;
    Source: TDataSource;
    gridTestedeSistema: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnSelecionar: TBitBtn;
    btnLimpar: TBitBtn;
    panelDefinicao: TPanel;
    lblDefinir: TLabel;
    edtNomeRequisito: TLabeledEdit;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    cboxEstado: TComboBox;
    cboxAvaliacao: TComboBox;
    lblEstado: TLabel;
    lblAvaliacao: TLabel;
    btnSalvar: TBitBtn;
    btnLimpar1: TBitBtn;
    btnVoltar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnLimpar1Click(Sender: TObject);
    procedure edtNomeRequisitoChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataTesteSistemaDefinir: TformModeloCascataTesteSistemaDefinir;

implementation

uses ModeloCascata, ModeloCascataTesteSistemaDefinirAjuda;

{$R *.dfm}

procedure TformModeloCascataTesteSistemaDefinir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar e liberar mem�ria
  formModeloCascataTesteSistemaDefinir.Release;
  formModeloCascataTesteSistemaDefinir:=Nil;
end;

procedure TformModeloCascataTesteSistemaDefinir.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Atualiza lista geral de testes de sistema
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
  end;
end;

procedure TformModeloCascataTesteSistemaDefinir.Logoff1Click(
  Sender: TObject);
begin
  //Fazer logoff
  formModeloCascata.Close;
  formModeloCascataTesteSistemaDefinir.Close;
end;

procedure TformModeloCascataTesteSistemaDefinir.btnLimparClick(
  Sender: TObject);
begin
  //Limpar o edtprocurar
  edtProcurar.Clear;
  edtProcurar.SetFocus;
end;

procedure TformModeloCascataTesteSistemaDefinir.edtProcurarChange(
  Sender: TObject);
begin
  //Seleciona os requisitos que foram aprovados
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.text:=('select nome as Nome from tbrequisito where nome like "'+edtProcurar.text+'%" and estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataTesteSistemaDefinir.btnLimpar1Click(
  Sender: TObject);
begin
  //Limpar
  edtNomeRequisito.Clear;
  edtIdentificador.Clear;
  edtNome.Clear;
  cboxEstado.ItemIndex:=-1;
  cboxAvaliacao.ItemIndex:=-1;
end;

procedure TformModeloCascataTesteSistemaDefinir.edtNomeRequisitoChange(
  Sender: TObject);
begin
  //Se vazio ativa ou desativa
  if (edtNomeRequisito.text='') then
  begin
    edtProcurar.Enabled:=True;
    btnSelecionar.Enabled:=True;
    btnLimpar.Enabled:=True;
    edtIdentificador.Enabled:=False;
    edtNome.Enabled:=False;
    lblEstado.Enabled:=False;
    lblAvaliacao.Enabled:=False;
    cboxEstado.Enabled:=False;
    cboxAvaliacao.enabled:=False;
    btnSalvar.Enabled:=False;
    btnLimpar1.Enabled:=False;
  end
  else
  begin
    edtProcurar.Enabled:=False;
    btnSelecionar.Enabled:=False;
    btnLimpar.Enabled:=False;
    edtIdentificador.Enabled:=True;
    edtNome.Enabled:=True;
    lblEstado.Enabled:=True;
    lblAvaliacao.Enabled:=True;
    cboxEstado.Enabled:=True;
    cboxAvaliacao.enabled:=True;
    btnSalvar.Enabled:=True;
    btnLimpar1.Enabled:=True;
  end;
end;

procedure TformModeloCascataTesteSistemaDefinir.btnSelecionarClick(
  Sender: TObject);
var
  nome_requisito:string;
  codigo_requisito:integer;
begin
  //Armazena o nome do projeto do dbgrid na vari�vel
  nome_requisito:=(gridTestedeSistema.Columns.Items[0].Field).AsString;
  //verifica se j� foi definido
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.text:=('select codigo from tbrequisito where nome="'+nome_requisito+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    codigo_requisito:=Query.FieldByName('codigo').AsInteger;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbtestedesistema where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
    query.open;
    if not query.IsEmpty then
    begin
      showmessage('Este requisito j� obteve seu teste de sistema, para editar use o bot�o "Editar" na janela principal do modelo cascata!');
      //Atualiza
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
      end;
      abort;
    end;
  end;
  edtNomeRequisito.text:=nome_requisito;
  //Atualiza lista geral de testes de sistema
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
  end;
end;

procedure TformModeloCascataTesteSistemaDefinir.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  formModeloCascataTesteSistemaDefinir.Close;
end;

procedure TformModeloCascataTesteSistemaDefinir.btnSalvarClick(
  Sender: TObject);
var
  codigo_projeto,codigo_requisito,i,cont,tamanho:integer;
  palavra,letra:string;
begin
  //Contra vazios
  if (edtIdentificador.text='') then
  begin
    showmessage('O campo identificador � obrigat�rio!');
    edtIdentificador.SetFocus;
    Abort;
  end;
  if (edtNome.text='') then
  begin
    showmessage('O campo nome � obrigat�rio!');
    edtNome.SetFocus;
    Abort;
  end;
  if (cboxEstado.ItemIndex=-1) then
  begin
    showmessage('� obrigat�rio selecionar um item da lista estado!');
    cboxEstado.SetFocus;
    Abort;
  end;
  if (cboxAvaliacao.ItemIndex=-1) then
  begin
    showmessage('� obrigat�rio selecionar um item da lista avalia��o!');
    cboxAvaliacao.SetFocus;
    abort;
  end;
  //Verifica espa�os
  cont:=0;
  palavra:=edtIdentificador.text;
  tamanho:=length(palavra);
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
    showmessage('O campo identificador cont�m mais espa�os do que letras!');
    edtIdentificador.SetFocus;
    Abort;
  end;
  cont:=0;
  palavra:=edtNome.text;
  tamanho:=length(palavra);
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
    showmessage('O campo identificador cont�m mais espa�os do que letras!');
    edtNome.SetFocus;
    Abort;
  end;
  //Seleciona o codigo do projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbrequisito where nome="'+edtNomeRequisito.text+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.Open;
    codigo_requisito:=Query.FieldByName('codigo').AsInteger;
  end;
  //Verifica se existe j� uma defini��o de teste para o requisito
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbtestedesistema where codigo_requisito="'+IntToStr(codigo_requisito)+'"');
    query.open;
    if not Query.IsEmpty then
    begin
      showmessage('Este requisito j� obteve seu teste de sistema!');
      abort;
    end;
  end;
  //Faz inser��o
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('insert into tbtestedesistema (identificador, nome, estado, avaliacao, codigo_requisito, codigo_projeto) values ("'+edtIdentificador.text+'","'+edtNome.text+'","'+cboxEstado.Text+'","'+cboxAvaliacao.Text+'","'+IntToStr(codigo_requisito)+'","'+IntToStr(codigo_projeto)+'")');
    query.ExecSQL;
  end;
  //Atualiza
  with query do
  begin
    query.Close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  showmessage('Teste de sistema definido!');
  edtNomeRequisito.clear;
  edtIdentificador.clear;
  edtNome.clear;
  cboxEstado.itemindex:=-1;
  cboxAvaliacao.itemindex:=-1;
end;

procedure TformModeloCascataTesteSistemaDefinir.Ajuda1Click(
  Sender: TObject);
begin
  //Criar
  Application.CreateForm(TformModeloCascataTesteSistemaDefinirAjuda, formModeloCascataTesteSistemaDefinirAjuda);
  formModeloCascataTesteSistemaDefinirAjuda.showmodal;
end;

end.
