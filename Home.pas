unit Home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection;

type
  TFormHome = class(TForm)
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Sair: TMenuItem;
    Movimentao: TMenuItem;
    Query: TZQuery;
    Projeto: TMenuItem;
    NovoProjeto: TMenuItem;
    AcessarProjeto: TMenuItem;
    PageControl: TPageControl;
    PageProjeto: TTabSheet;
    btnNovoProjeto: TBitBtn;
    btnAcessarProjeto: TBitBtn;
    verificacao: TMenuItem;
    Acessosaoprograma: TMenuItem;
    Conecta: TZConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure btnNovoProjetoClick(Sender: TObject);
    procedure btnAcessarProjetoClick(Sender: TObject);
    procedure AcessarProjetoClick(Sender: TObject);
    procedure NovoProjetoClick(Sender: TObject);
    procedure AcessosaoprogramaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

uses HomeAjuda, Inicio, CriarProjeto, AcessarProjeto, AcessosAoProrgama;

{$R *.dfm}

procedure TFormHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Se esta janela for fechada a aplicação termina.
  FormHome.release;
  FormHome:=Nil;
end;

procedure TFormHome.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormHome.AjudaClick(Sender: TObject);
begin
  //Cria e exibe o form
  Application.CreateForm(TFormHomeAjuda,FormHomeAjuda);
  FormHomeAjuda.showmodal;
end;

procedure TFormHome.SairClick(Sender: TObject);
var
hora,data,hora1,data1,codigo:string;
begin
  //Fechar home e volta para inicio
  Application.CreateForm(TFormInicio, FormInicio);
  FormHome.Hide;
  data:=DateToStr(Date);
  hora:=TimeToStr(Time);
  //Pega codigo projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbacesso order by codigo desc limit 1');
    query.open;
    codigo:=query.fieldbyname('codigo_login').asString;
    data1:=query.fieldbyname('data_acesso').AsString;
    hora1:=query.fieldbyname('hora_acesso').AsString;
  end;
  //Salva data saida e hora saida
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('update tbacesso set data_saida="'+data+'", hora_saida="'+hora+'" where codigo_login="'+codigo+'" and data_acesso="'+data1+'" and hora_acesso="'+hora1+'"');
    query.ExecSql
  end;
  FormHome.Close;
  FormInicio.ShowModal;
end;


procedure TFormHome.btnNovoProjetoClick(Sender: TObject);
begin
  //Criar form CriarProjeto e exibir
  Application.CreateForm(TFormCriarProjeto, FormCriarProjeto);
  FormCriarProjeto.ShowModal;
end;

procedure TFormHome.btnAcessarProjetoClick(Sender: TObject);
begin
  //Criar e exibir formAcessarProjeto
  Application.CreateForm(TFormAcessarProjeto, FormAcessarProjeto);
  FormAcessarProjeto.showModal;
end;

procedure TFormHome.AcessarProjetoClick(Sender: TObject);
begin
  //Cria o formAcessarProjeto e exibe
  Application.createform(TFormAcessarProjeto, FormAcessarProjeto);
  FormAcessarProjeto.showmodal;
end;

procedure TFormHome.NovoProjetoClick(Sender: TObject);
begin
  //Criar form CriarProjeto e exibir
  Application.CreateForm(TFormCriarProjeto, FormCriarProjeto);
  FormCriarProjeto.ShowModal;
end;

procedure TFormHome.AcessosaoprogramaClick(Sender: TObject);
begin
  //Cria o FormAcessosAoPrograma e exibe
  Application.CreateForm(TFormAcessosAoPrograma, FormAcessosAoPrograma);
  FormAcessosAoPrograma.ShowModal;
end;

end.
