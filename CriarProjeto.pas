unit CriarProjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Mask,
  ComCtrls;

type
  TFormCriarProjeto = class(TForm)
    Menu: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff: TMenuItem;
    Panel: TPanel;
    lblTitulo: TLabel;
    edtnome: TLabeledEdit;
    cboxModelo: TComboBox;
    lblDesenvolvimento: TLabel;
    memoDescricao: TMemo;
    lblDescricao: TLabel;
    btnCadastrar: TBitBtn;
    btnLimpar: TBitBtn;
    btnVoltar: TBitBtn;
    Query: TZQuery;
    edtcriacao: TLabeledEdit;
    lblEntrega: TLabel;
    edtEntrega: TMaskEdit;
    Calendario: TMonthCalendar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LogoffClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure cboxModeloChange(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure edtEntregaClick(Sender: TObject);
    procedure CalendarioDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCriarProjeto: TFormCriarProjeto;
  modelo:string;

implementation

uses Home, CriarProjetoAjuda;

{$R *.dfm}

procedure TFormCriarProjeto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar o form
  FormCriarProjeto.close;
  FormCriarProjeto:=Nil;
end;

procedure TFormCriarProjeto.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Edtcriacao pega data atual
  edtcriacao.text:=DatetoStr(Date);
end;


procedure TFormCriarProjeto.LogoffClick(Sender: TObject);
begin
  //Fechar o programa
  Application.Terminate;
end;

procedure TFormCriarProjeto.btnLimparClick(Sender: TObject);
begin
  //Limpar os capos
  edtnome.clear;
  cboxmodelo.itemindex:=-1;
  memodescricao.clear;
  edtEntrega.Clear;
  edtNome.SetFocus;
end;

procedure TFormCriarProjeto.btnVoltarClick(Sender: TObject);
begin
  //Fechar o form
  FormCriarProjeto.Close;
end;

procedure TFormCriarProjeto.btnCadastrarClick(Sender: TObject);
var
  //Variável que irá armazenar o código do login do usuário para usar de FK
  codigo:integer;
  //Variáveis para restrição de espaços excessivos
  palavra,letra,hora:string;
  i,cont,tamanho:integer;
begin
  //Verificar se os campos estão vazios, se estiverem, aborta o laço
  if (edtnome.text='') then
  begin
    messagedlg('O campo nome do projeto é obrigatório!',mterror,mbokcancel,0);
    edtnome.setfocus;
    abort;
  end;
  if (cboxmodelo.itemindex=0) then
  begin
    messagedlg('Selecione algum modelo de desenvolvimento, é obrigatório!',mterror,mbokcancel,0);
    cboxmodelo.setfocus;
  abort;
  end;
  if (memodescricao.Lines.text='') then
  begin
    messagedlg('O projeto necessita de uma descrição, é obrigatório!',mterror, mbokcancel, 0);
    memodescricao.setfocus;
    abort;
  end;
  if (edtentrega.text='') then
  begin
    messagedlg('Selecione uma data de entrega no calendário, é obrigatório!',mterror,mbokcancel,0);
    edtEntrega.setfocus;
    abort;
  end;
  //Verrifica se existe muitos espaços nos campos
  cont:=0;
  palavra:=edtnome.text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
    letra:=copy(palavra,i,1);
      if (letra=' ') then
      begin
      cont:=cont-2;
      end
      else
      begin
      cont:=cont+1;
      end;
    end;
    if (cont<0) then
    begin
      messagedlg('Existe muitos espaços no campo nome do projeto!',mterror,mbokcancel,0);
      edtnome.setfocus;
      abort;
    end;
  cont:=0;
  palavra:=memodescricao.lines.text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i,1);
        if (letra=' ') then
        begin
          cont:=cont-2;
        end
        else
        begin
          cont:=cont+1;
        end;
    end;
    if (cont<0) then
    begin
      messagedlg('Existe muitos espaços no campo descrição!',mterror,mbokcancel,0);
      memodescricao.setfocus;
      abort;
    end;
  //Verifica o codigo do login do usuário para armazenar FK
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbacesso where codigo= (select max(codigo) from tbacesso)');
    query.open;
    codigo:=Query.FieldByName('codigo_login').Asinteger;
  end;
  //Inicia a variável hora
  hora:=TimetoStr(Time);
  //Inserir na tabela
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.text:=('select nome from tbprojeto where nome="'+edtnome.text+'"');
    query.Open;
      if query.IsEmpty then
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('insert into tbprojeto (nome, modelo, descricao, datacriacao, horacriacao, dataentrega, codigo_login) values ("'+edtnome.text+'","'+modelo+'","'+memodescricao.lines.text+'","'+edtcriacao.text+'","'+hora+'","'+edtentrega.Text+'","'+InttoStr(codigo)+'")');
        Query.ExecSql;
        showmessage('Seu projeto foi criado com sucesso!');
        //Fecha o FormCriarProjeto após criar o projeto com sucesso
        FormCriarProjeto.Close;
      end
      else
      begin
        messagedlg('Já existe um projeto criado com este nome, escolha outro!',mterror,mbokcancel,0);
        edtnome.setfocus;
        abort;
      end;
  end;
end;

procedure TFormCriarProjeto.cboxModeloChange(Sender: TObject);
begin
  //Pega o modelo do combobox e insera em uma variável string
    if (cboxmodelo.itemindex=0) then
    begin
      modelo:='';
    end;
    if (cboxmodelo.itemindex=1) then
    begin
    modelo:='CASCATA';
    end;
    if (cboxmodelo.itemindex=2) then
    begin
    modelo:='ESPIRAL';
    end;
    if (cboxmodelo.itemindex=3) then
    begin
    modelo:='PROTOTIPAÇÃO';
    end;
    if (cboxmodelo.itemindex=4) then
    begin
    modelo:='XP';
    end;
    if (cboxmodelo.itemindex=5) then
    begin
    modelo:='SCRUM';
    end;
    if (cboxmodelo.itemindex=6) then
    begin
    modelo:='PERSONALIZADO';
    end;
end;

procedure TFormCriarProjeto.Ajuda1Click(Sender: TObject);
begin
  //Criar o FormCriarProjetoAjuda e exibir
  Application.CreateForm(TFormCriarProjetoAjuda, FormCriarProjetoAjuda);
  FormCriarProjetoAjuda.Showmodal;
end;

procedure TFormCriarProjeto.edtEntregaClick(Sender: TObject);
begin
  //Exibe o calendario
  Calendario.Visible:=True;
  Calendario.Date:=Date;
end;

procedure TFormCriarProjeto.CalendarioDblClick(Sender: TObject);
var
  //Variáveis para calcular data
  datacriacao,dataentrega:TDateTime;
begin
  //edtEntrega pega data do calendário
  edtentrega.text:=DateToStr(Calendario.Date);
  //Esconde o calendario
  Calendario.Visible:=False;
  //Verificar data
  datacriacao:=StrToDate(edtcriacao.text);
  dataentrega:=StrToDate(edtentrega.Text);
    //Exibe erro se a data de entrega estiver para um dia que já passou
    if (datacriacao>dataentrega) then
    begin
      messagedlg('Impossível inserir uma data que já passou!',mterror,mbokcancel,0);
      edtEntrega.Clear;
    end
end;

end.
