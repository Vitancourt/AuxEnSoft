unit Inicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZDataset, ZAbstractConnection, ZConnection,
  ZAbstractDataset;

type
  TFormInicio = class(TForm)
    banner: TImage;
    Menu: TMainMenu;
    Ajuda1: TMenuItem;
    Sair1: TMenuItem;
    Panel: TPanel;
    LabelTitulo: TLabel;
    EdtUsuario: TLabeledEdit;
    EdtSenha: TLabeledEdit;
    BtnLogar: TBitBtn;
    BtnCriarCadastro: TBitBtn;
    BtnLimpar: TBitBtn;
    BtnFechar: TBitBtn;
    Query: TZQuery;
    Conecta: TZConnection;
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure BtnCriarCadastroClick(Sender: TObject);
    procedure BtnLogarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInicio: TFormInicio;

implementation

uses InicioAjuda, CriarCadastro, Home;

{$R *.dfm}

procedure TFormInicio.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormInicio.Sair1Click(Sender: TObject);
begin
  //Fechar o programa
  Application.Terminate;
end;

procedure TFormInicio.BtnFecharClick(Sender: TObject);
begin
  //Fechar o programa
  Application.Terminate;
end;

procedure TFormInicio.BtnLimparClick(Sender: TObject);
begin
  //Limpar os campos
  edtusuario.clear;
  edtsenha.clear;
  edtusuario.setfocus;
end;

procedure TFormInicio.Ajuda1Click(Sender: TObject);
begin
  //Criar e exibir form
  Application.CreateForm(TFormInicioAjuda, FormInicioAjuda);
  FormInicioAjuda.showmodal;
end;

procedure TFormInicio.BtnCriarCadastroClick(Sender: TObject);
begin
  //Criar e exibir form
  Application.Createform(TFormCriarCadastro, FormCriarCadastro);
  FormCriarCadastro.ShowModal;
end;

procedure TFormInicio.BtnLogarClick(Sender: TObject);
var
//Variáveis para inserir no tbAcesso
data,hora,codigo_login:string;
begin
  //Checar se existe no banco de dados para fazer login
  with Query do
  begin
    Query.close;
    Query.SQL.Clear;
    Query.SQL.Text:=('select * from tblogin where usuario="'+edtusuario.text+'" and senha ="'+edtsenha.text+'"');
    Query.Open;
    codigo_login:=Query.FieldByName('codigo').AsString;
      if query.isempty then
      begin
        messagedlg('Os dados não estão corretos, se você ainda não tem um usuário e uma senha clique no botão "Criar cadastro"!',mterror,mbokcancel,0);
        edtUsuario.Clear;
        edtSenha.Clear;
        edtUsuario.setFocus;
        abort;
      end
      else
      begin
        //Salvar data e hora de acesso no tbAcesso
        data:=DateToStr(Date);
        hora:=TimeToStr(Time);
        query.close;
        query.sql.clear;
        query.sql.text:=('INSERT INTO tbAcesso (data_acesso, hora_acesso, codigo_login) VALUES ("'+data+'","'+hora+'","'+codigo_login+'");');
        Query.ExecSql;

        //Criar e exibir o form
        ShowMessage('Login efetuado com sucesso!');
        Application.CreateForm(TFormHome, FormHome);
        FormInicio.Hide;
        FormHome.Showmodal;
        FormInicio.Close;
      end;
  end;
end;

procedure TFormInicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fechar form inicio
  FormInicio.Release;
  FormInicio:=Nil;
end;

end.
