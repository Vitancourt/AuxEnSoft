unit ModeloCascataManutencaoCriar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, Menus, ExtCtrls, Buttons;

type
  TformModeloCascataManutencaoCriar = class(TForm)
    panelLista: TPanel;
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    lblLista: TLabel;
    DBGrid1: TDBGrid;
    source: TDataSource;
    query: TZQuery;
    edtProcurar: TLabeledEdit;
    panelCriar: TPanel;
    lblCriar: TLabel;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    lblDesc: TLabel;
    memoDescricao: TMemo;
    cboxResultado: TComboBox;
    Label1: TLabel;
    btnCriar: TBitBtn;
    btnLimpar: TBitBtn;
    btnConcluido: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnConcluidoClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataManutencaoCriar: TformModeloCascataManutencaoCriar;

implementation

uses ModeloCascata, ModeloCascataManutencaoCriarAjjuda;

{$R *.dfm}

procedure TformModeloCascataManutencaoCriar.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Seleciona a lista de manuten��o
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select nome as Nome from tbManutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataManutencaoCriar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar e liberar mem�ria
  formModeloCascataManutencaoCriar.release;
  formModeloCascataManutencaoCriar:=Nil;
end;

procedure TformModeloCascataManutencaoCriar.edtProcurarChange(
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

procedure TformModeloCascataManutencaoCriar.btnLimparClick(
  Sender: TObject);
begin
  //Limpa tudo
  edtProcurar.clear;
  edtIdentificador.Clear;
  edtNome.Clear;
  memoDescricao.Lines.Clear;
  cboxResultado.ItemIndex:=-1;
end;

procedure TformModeloCascataManutencaoCriar.btnConcluidoClick(
  Sender: TObject);
begin
  //fecha
  formModeloCascataManutencaoCriar.close;
end;

procedure TformModeloCascataManutencaoCriar.btnCriarClick(Sender: TObject);
var
  codigo_projeto, tamanho,i,cont:integer;
  palavra,letra:string;
begin
  //Verifica Identificador
  if (edtIdentificador.text='') then
  begin
    showmessage('O campo identificador � obrigat�rio!');
    abort;
  end;
  palavra:=edtIdentificador.Text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra, i,1);
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
    showmessage('O campo identificador tem mais espa�os do que letras!');
    edtIdentificador.setfocus;
    abort;
  end;
  //verifica nome
  if (edtNome.text='') then
  begin
    showmessage('O campo nome � obrigat�rio!');
    abort;
  end;
  palavra:=edtnome.Text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra, i,1);
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
    showmessage('O campo nome tem mais espa�os do que letras!');
    edtNome.setfocus;
    abort;
  end;
  //verifica memoDescricao
  if (memoDescricao.Lines.text='') then
  begin
    showmessage('O campo descri��o � obrigat�rio!');
    abort;
  end;
  palavra:=memoDescricao.Lines.Text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra, i,1);
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
    showmessage('O campo descricao tem mais espa�os do que letras!');
    memoDescricao.setfocus;
    abort;
  end;
  //Se cboxResultado
  if (cboxResultado.ItemIndex=-1) then
  begin
    showmessage('O campo resultado necessita de uma op��o selecionada!');
    cboxResultado.setfocus;
    abort;
  end;
  //Verifica codigo_projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsInteger;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select identificador from tbmanutencao where identificador="'+edtIdentificador.text+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if not query.isempty then
    begin
      showmessage('O identificador j� existe!');
      edtIdentificador.setfocus;
        //Seleciona a lista de manuten��o
        with query do
        begin
          query.close;
          query.SQL.clear;
          query.sql.text:=('select nome as Nome from tbManutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
          query.open;
         end;
      abort;
    end;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome from tbmanutencao where nome="'+edtNome.text+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if not query.isempty then
    begin
      showmessage('Este nome j� existe!');
      edtNome.setfocus;
        //Seleciona a lista de manuten��o
        with query do
       begin
         query.close;
         query.SQL.clear;
         query.sql.text:=('select nome as Nome from tbManutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
         query.open;
      end;
      abort;
    end;
        //Seleciona a lista de manuten��o
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select nome as Nome from tbManutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  end;
  //Verifica se existe o nome e identificador que voc� deseja cadastrar
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.text:=('select identificador, nome from tbmanutencao where identificador="'+edtIdentificador.text+'" and nome="'+edtNome.text+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if not query.isempty then
    begin
      showmessage('Este identificador e nome de manuten��o j� foram cadastrados!');
        //Seleciona a lista de manuten��o
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select nome as Nome from tbManutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
      abort;
  //Seleciona a lista de manuten��o
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select nome as Nome from tbManutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
      abort;
    end;
    if query.IsEmpty then
    begin
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('insert into tbmanutencao (identificador, nome, descricao, resultado, codigo_projeto) values ("'+edtIdentificador.text+'","'+edtNome.Text+'","'+memoDescricao.Lines.Text+'","'+cboxResultado.Text+'","'+IntToStr(codigo_projeto)+'")');
        query.ExecSQL;
      end;
    end;
  end;
  showmessage('Manuten��o cadastrada com sucesso!');
  //Atualiza lsita
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
  //Limpa os campos
  edtIdentificador.Clear;
  edtNome.Clear;
  memoDescricao.Lines.clear;
  cboxResultado.ItemIndex:=-1;
end;

procedure TformModeloCascataManutencaoCriar.Logoff1Click(Sender: TObject);
begin
  //Faz logoff
  formModeloCascata.Close;
  formModeloCascataManutencaoCriar.Close;
end;

procedure TformModeloCascataManutencaoCriar.Ajuda1Click(Sender: TObject);
begin
  //cria form e exibe
  Application.CreateForm(tFormModeloCascataManutencaoCriarAjuda, FormModeloCascataManutencaoCriarAjuda);
  formModeloCascataManutencaoCriarAjuda.showmodal;
end;

end.
