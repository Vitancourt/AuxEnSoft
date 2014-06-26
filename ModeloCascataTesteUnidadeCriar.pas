unit ModeloCascataTesteUnidadeCriar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormModeloCascataTesteUnidadeCriar = class(TForm)
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    PanelLista: TPanel;
    lblTestes: TLabel;
    gridtabelas: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnVoltar: TBitBtn;
    btnLimpar1: TBitBtn;
    labelCriarTesteUnidade: TPanel;
    edtIdentificador: TLabeledEdit;
    lblTitulo: TLabel;
    edtNome: TLabeledEdit;
    memoDescricao: TMemo;
    lblDescricao: TLabel;
    cboxTipo: TComboBox;
    cboxSituacao: TComboBox;
    Label1: TLabel;
    lblSituacao: TLabel;
    edtDataTeste: TLabeledEdit;
    Calendario: TMonthCalendar;
    btnCadastrar: TBitBtn;
    btnLimpar: TBitBtn;
    Query: TZQuery;
    Source: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logoff1Click(Sender: TObject);
    procedure edtDataTesteClick(Sender: TObject);
    procedure CalendarioDblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnLimpar1Click(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTesteUnidadeCriar: TFormModeloCascataTesteUnidadeCriar;

implementation

uses ModeloCascata, modelocascataTesteUnidadeCriarAjudaa;

{$R *.dfm}

procedure TFormModeloCascataTesteUnidadeCriar.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Atualizar lista dos teste
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTesteUnidadeCriar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha e libera memória
  FormModeloCascataTesteUnidadeCriar.Release;
  FormModeloCascataTesteUnidadeCriar:=Nil;
end;

procedure TFormModeloCascataTesteUnidadeCriar.Logoff1Click(
  Sender: TObject);
begin
  //Faz logoff do usuario e volta ao home
  FormModeloCascata.Close;
  FormModeloCascataTesteUnidadeCriar.Close;
end;

procedure TFormModeloCascataTesteUnidadeCriar.edtDataTesteClick(
  Sender: TObject);
begin
  //Exibe calendario
  Calendario.Visible:=True;
end;

procedure TFormModeloCascataTesteUnidadeCriar.CalendarioDblClick(
  Sender: TObject);
begin
  edtDataTeste.Text:=DateToStr(Calendario.Date);
  Calendario.Visible:=False;
end;

procedure TFormModeloCascataTesteUnidadeCriar.btnLimparClick(
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

procedure TFormModeloCascataTesteUnidadeCriar.btnVoltarClick(
  Sender: TObject);
begin
  //fecha
  FormModeloCascataTesteUnidadeCriar.Close;
end;

procedure TFormModeloCascataTesteUnidadeCriar.btnLimpar1Click(
  Sender: TObject);
begin
  //Limpa edt procurar
  edtProcurar.Clear;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataTesteUnidadeCriar.edtProcurarChange(
  Sender: TObject);
begin
 //Seleciona de acordo com o que esta escrito
 with query do
 begin
  query.close;
  query.sql.clear;
  query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where nome like "'+edtProcurar.Text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
  query.open;
 end;
end;

procedure TFormModeloCascataTesteUnidadeCriar.btnCadastrarClick(
  Sender: TObject);
var
  palavra,letra:string;
  cont,i,tamanho, codigo_projeto:integer;
begin
  //Valida campos vazios
  if (edtIdentificador.text='') then
  begin
    showmessage('O campo identificador/ID é obrigatório!');
    edtIdentificador.SetFocus;
    abort;
  end;
  if (edtNome.text='') then
  begin
    showmessage('O campo nome é obrigatório!');
    edtNome.SetFocus;
    abort;
  end;
  if (memoDescricao.lines.text='') then
  begin
    showmessage('O campo descrição é obrigatório!');
    memoDescricao.SetFocus;
    abort;
  end;
  if (cboxTipo.ItemIndex=-1) then
  begin
    showmessage('O campo tipo deve ter algum item selecionado!');
    cboxTipo.SetFocus;
    Abort;
  end;
  if (cboxSituacao.ItemIndex=-1) then
  begin
    showmessage('O campo situação deve ter algum item selecionado!');
    cboxSituacao.SetFocus;
    abort;
  end;
  if (edtDataTeste.text='') then
  begin
    showmessage('O campo data do teste deve ser preenchido!');
    edtDataTeste.SetFocus;
    Abort;
  end;
  //valida campos
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
    showmessage('O campo identificador contem mais espaços do que letras!');
    edtIdentificador.SetFocus;
    Abort;
  end;
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
    showmessage('O campo nome contem mais espaços do que letras!');
    edtNome.SetFocus;
    Abort;
  end;

  palavra:=memoDescricao.Lines.text;
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
    showmessage('O campo descrição contem mais espaços do que letras!');
    memoDescricao.SetFocus;
    Abort;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador from tbtesteunidade where identificador="'+edtIdentificador.text+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if not query.isempty then
    begin
      showmessage('Este identificador já existe!');
      edtIdentificador.setfocus;
      //Atualizar lista dos teste
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
        abort;
     end;
    end;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome from tbtesteunidade where nome="'+edtNome.text+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if not query.isempty then
    begin
      showmessage('Este Nome já existe!');
      edtNome.SetFocus;
      //Atualizar lista dos teste
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
        abort;
     end;
    end;
  end;
  //Seleciona codigo_projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  //verifica se nao existe
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.text:=('select identificador, nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) and identificador="'+edtIdentificador.text+'" and nome="'+edtNome.text+'"');
    query.open;
      //Se não retornar vazio
      if query.IsEmpty then
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('insert into tbtesteunidade (identificador, nome, descricao, tipo, situacao, datateste, codigo_projeto) values ("'+edtIdentificador.text+'","'+edtNome.text+'","'+memoDescricao.lines.text+'","'+cboxTipo.text+'","'+cboxSituacao.Text+'","'+edtDataTeste.text+'","'+IntToStr(codigo_projeto)+'")');
        query.ExecSQL;
        //limpa os campos
        edtIdentificador.clear;
        edtNome.Clear;
        memoDescricao.lines.clear;
        cboxTipo.ItemIndex:=-1;
        cboxSituacao.ItemIndex:=-1;
        edtDataTeste.clear;
        showmessage('Cadastro concluído!');
      end;
      if not query.IsEmpty then
      begin
        showmessage('Este ID e nome de teste já estão cadastrados neste projeto!');
          //Atualizar lista dos teste
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
        Abort;
      end;
  end;
  //atualiza
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador as ID, nome as Nome from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTesteUnidadeCriar.Ajuda1Click(Sender: TObject);
begin
Application.CreateForm(tFormModeloCascataTesteUnidadeCriarAjudaa, FormModeloCascataTesteUnidadeCriarAjudaa);
FormModeloCascataTesteUnidadeCriarAjudaa.showmodal;
end;

end.
