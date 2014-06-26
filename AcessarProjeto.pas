unit AcessarProjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Grids, DBGrids, RpBase, RpSystem, RpCon, RpConDS, RpDefine,
  RpRave;

type
  TFormAcessarProjeto = class(TForm)
    Panel: TPanel;
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    lblTitulo: TLabel;
    Query: TZQuery;
    Source: TDataSource;
    btnAcessar: TBitBtn;
    btnExcluir: TBitBtn;
    edtProcurar: TEdit;
    lblProcurar: TLabel;
    btnVoltar: TBitBtn;
    gridProjeto: TDBGrid;
    Relatorio: TMenuItem;
    QueryRel: TZQuery;
    ProjectProjetos: TRvProject;
    Conecta: TRvDataSetConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LogoffClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure gridProjetoCellClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure RelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAcessarProjeto: TFormAcessarProjeto;
  //Vari�vel que ir� receber o codigo_login da tabela tbacesso
  codigo_login:integer;
  //Vari�vel que ir� armazenar o nome do projeto do tbprojeto
  nome_projeto:string;
  //Vari�vel que ir� armazenar o codigo do projeto do tbprojeto
  codigo_projeto:string;
  //Vari�vel que ir� armazenar o modelo de desenvolvimento
  modelo_desenvolvimento:String;

implementation

uses Home, ModeloCascata;

{$R *.dfm}

procedure TFormAcessarProjeto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar o form
  FormAcessarProjeto.Release;
  FormAcessarProjeto:=Nil;
end;

procedure TFormAcessarProjeto.FormCreate(Sender: TObject);
begin
  //Inicia a vari�vel nome_projeto vazia para carregar o nome do projeto
  nome_projeto:='';
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
    //Seleciona o codigo_login para exibir somente os projetos
    //de quem esta logado
    with query do
    begin
      query.close;
      query.sql.Clear;
      query.sql.text:=('select nome as Nome from tbprojeto where codigo_login=(select codigo_login from tbacesso order by codigo desc limit 1)');
      query.open;
    end;
end;

procedure TFormAcessarProjeto.LogoffClick(Sender: TObject);
begin
  //Fechar o programa
  Application.Terminate;
end;

procedure TFormAcessarProjeto.btnVoltarClick(Sender: TObject);
begin
  //Fechar form e voltar para o home
  FormAcessarProjeto.Close;

end;


procedure TFormAcessarProjeto.edtProcurarChange(Sender: TObject);
begin
  //Da um select no banco de acordo com o que for digitado
  with query do
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text:=('select nome as Nome from tbProjeto where nome like "'+edtProcurar.text+'%" and codigo_login=(select codigo_login from tbacesso order by codigo desc limit 1)');
    Query.Open;
  end;
end;

procedure TFormAcessarProjeto.gridProjetoCellClick(Column: TColumn);
begin
  //Armazena o nome do projeto do dbgrid na vari�vel
  nome_projeto:=(gridProjeto.Columns.Items[0].Field).AsString;
end;

procedure TFormAcessarProjeto.btnExcluirClick(Sender: TObject);
var
//Vari�vel que ir� armazenar o resultado do messagedlg
resposta:integer;
begin
  //Armazena o nome do projeto do dbgrid na vari�vel
  nome_projeto:=(gridProjeto.Columns.Items[0].Field).AsString;;
  //Excluir o projeto segundo confirma��o
  resposta:=messagedlg('Deseja realmente excluir o projeto?',mtinformation,mbokcancel,0);
  //Se a resposta for OK
  if (resposta=1) then
  begin
  with query do
    begin
      query.Close;
      Query.SQL.Clear;
      Query.SQL.Text:=('delete from tbprojeto where nome="'+nome_projeto+'"');
      Query.ExecSql;
    end;
    //de quem esta logado
    with query do
    begin
      query.close;
      query.sql.Clear;
      query.sql.text:=('select nome as Nome from tbprojeto where codigo_login=(select codigo_login from tbacesso order by codigo desc limit 1)');
      query.open;
    end;
  end
  else
  begin
    showmessage('Exclus�o cancelada!');
    abort;
  end;
end;

procedure TFormAcessarProjeto.btnAcessarClick(Sender: TObject);
var
//Vari�vels que ir�o armazenar data e hora para tbProjetoAcesso
data, hora:string;
begin
  //Armazena o nome do projeto do dbgrid na vari�vel
  nome_projeto:=(gridProjeto.Columns.Items[0].Field).AsString;
  //Se n�o houver nenhum projeto selecionado
  if (nome_projeto='') then
  begin
    messagedlg('Por favor, d� dois cliques em um projeto na lista!',mtinformation,mbokcancel,0);
    abort;
  end;
  //Seleciona o modelo de desenvolvimento
  with query do
  begin
    query.Close;
    Query.SQL.Clear;
    Query.SQL.TExt:=('select * from tbprojeto where nome="'+nome_projeto+'"');
    Query.Open;
    codigo_projeto:=Query.FieldByName('codigo').AsString;
    modelo_desenvolvimento:=Query.FieldByName('modelo').AsString;
    //Insere data e hora no tbProjetoAcesso
    data:=DatetoStr(date);
    hora:=TimetoStr(time);
    query.Close;
    Query.SQL.Clear;
    Query.SQL.Text:=('insert into tbProjetoAcesso (dataentrada, horaentrada, codigo_projeto) values ("'+data+'","'+hora+'","'+codigo_projeto+'")');
    Query.ExecSql;
  end;
  //Se o projeto for cascata
  if (modelo_desenvolvimento='CASCATA') then
  begin
    FormAcessarProjeto.Hide;
    Application.CreateForm(TFormModeloCascata, FormModeloCascata);
    FormModeloCascata.Showmodal;
    FormAcessarProjeto.Close;
  end;
end;

procedure TFormAcessarProjeto.RelatorioClick(Sender: TObject);
begin
  //cria e executa o relat�rio
  ProjectProjetos.Execute;
  ProjectProjetos.Close;
end;

end.
