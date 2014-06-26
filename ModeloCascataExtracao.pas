unit ModeloCascataExtracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Menus, StdCtrls, ExtCtrls, ComCtrls,
  Mask, Buttons, Grids, DBGrids, DBCtrls;

type
  TFormModeloCascataExtracao = class(TForm)
    Menu: TMainMenu;
    Query: TZQuery;
    Ajuda: TMenuItem;
    PanelExtracao: TPanel;
    edtNome: TLabeledEdit;
    edtDataCriacao: TLabeledEdit;
    memoDescricao: TMemo;
    lblDescricao: TLabel;
    cboxEstado: TComboBox;
    lblEstado: TLabel;
    cboxTipo: TComboBox;
    Tipo: TLabel;
    lblProblema: TLabel;
    memoProblema: TMemo;
    Logoff: TMenuItem;
    lblMetodo: TLabel;
    cboxMetodo: TComboBox;
    btnCadastrar: TBitBtn;
    btnLimpar: TBitBtn;
    btnVoltar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LogoffClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataExtracao: TFormModeloCascataExtracao;
  //Variável que irá receber o nome do requisito para possivel edição
  nomerequisito:string;

implementation

uses ModeloCascata, Home, AcessarProjeto, ModeloCascataExtracaoAjuda;

{$R *.dfm}

procedure TFormModeloCascataExtracao.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Pega data atual no edtDataCriacao
  edtDataCriacao.text:=DateToStr(Date());
    with query do
    begin
      query.close;
      query.sql.clear;
      query.SQL.text:=('select nome as Nome from tbrequisito where codigo_projeto="'+codigo_projeto+'"');
      query.open;
    end;
end;

procedure TFormModeloCascataExtracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormModeloCascataExtracao.Release;
  FormModeloCascataExtracao:=Nil;
end;



procedure TFormModeloCascataExtracao.LogoffClick(Sender: TObject);
begin
  //Fazer logoff, fechando
  //FormModeloCascataExtrecao, FormModeloCascata
  //e voltar ao home
  FormModeloCascataExtracao.Close;
  FormModeloCascata.Close;
  FormHome.Show;
end;


procedure TFormModeloCascataExtracao.btnVoltarClick(Sender: TObject);
begin
  //Fecha o form e volta para FormModeloCascata
  FormModeloCascataExtracao.Close;
  FormModeloCascata.Show;
end;

procedure TFormModeloCascataExtracao.btnLimparClick(Sender: TObject);
begin
  //Limpar campos
  edtNome.Clear;
  memoDescricao.Clear;
  memoProblema.Clear;
  cboxEstado.itemindex:=-1;
  cboxMetodo.itemindex:=-1;
  cboxTipo.itemindex:=-1;
  edtDataCriacao.text:=DateToStr(Date());
  edtNome.SetFocus;
end;

procedure TFormModeloCascataExtracao.btnCadastrarClick(Sender: TObject);
var
  //Variáveis para validar campos
  palavra,letra:string;
  tamanho,i,cont:integer;
begin
  //Validando campo edtNome contra Vazio
    if (edtNome.text='') then
    begin
      messagedlg('Favor complete o campo!',mterror,mbokcancel,0);
      edtNome.SetFocus;
      abort;
    end;
  //Validando memoDescricao contra Vazio
    if (memoDescricao.lines.text='') then
    begin
      messagedlg('Favor complete o campo!',mterror,mbokcancel,0);
      memoDescricao.SetFocus;
      abort;
    end;
      //Validando memoProblema contra Vazio
    if (memoProblema.lines.text='') then
    begin
      messagedlg('Favor complete o campo!',mterror,mbokcancel,0);
      memoProblema.SetFocus;
      abort;
    end;
  //Validando cboxEstado contra Vazio
    if (cboxEstado.itemindex=-1) then
    begin
      messagedlg('Favor selecione uma opção!',mterror,mbokcancel,0);
      cboxEstado.SetFocus;
      abort;
    end;
  //Validando cboxTipo contra Vazio
    if (cboxTipo.itemindex=-1) then
    begin
      messagedlg('Favor selecione uma opção!',mterror,mbokcancel,0);
      cboxTipo.SetFocus;
      Abort;
    end;
  //Validando cboxMetodo contra Vazio
    if (cboxMetodo.itemindex=-1) then
    begin
      messagedlg('Favor seleicone uma opção!',mterror,mbokcancel,0);
      cboxMetodo.SetFocus;
      Abort;
    end;
  //Validando o campo Nome do requisito
  palavra:=edtNome.text;
  tamanho:=length(palavra);
  cont:=0;
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
      messagedlg('Este campo contém espaços em excesso!',mterror,mbokcancel,0);
      edtNome.SetFocus;
      Abort;
    end;
  //Validando o campo memoDescricao
  palavra:=memoDescricao.Lines.text;
  tamanho:=length(palavra);
  cont:=0;
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
      messagedlg('Este campo contém espaços em excesso!',mterror,mbokcancel,0);
      memoDescricao.SetFocus;
      Abort;
    end;
  //Validando o campo memoProblema
  palavra:=memoProblema.Lines.text;
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
        messagedlg('Este campo contém espaços em excesso!',mterror,mbokcancel,0);
        memoProblema.SetFocus;
        Abort;
    end;

   //Verifica se ja existe este nome de requisito neste projeto
    with query do
    begin
      query.close;
      query.SQL.clear;
      //Tenta
      try
      query.sql.Text:=('select * from tbrequisito where nome=("'+edtnome.text+'") and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
      //Se der erro
      except
      end;
      //Se a query retornar valor
      if not query.isempty then
      begin
        showmessage('Este requisito já esta cadastrado neste projeto!');
        abort;
      end;
    end;

    //Inserindo na tabela
    with query do
    begin
      Query.Close;
      Query.Sql.Clear;
      Query.SQL.Text:=('insert into tbrequisito (nome, descricao, problema, estado, tipo, metodo, datacriacao,codigo_projeto) values ("'+edtNome.text+'","'+memoDescricao.lines.text+'","'+memoProblema.lines.text+'","'+cboxEstado.text+'","'+cboxTipo.Text+'","'+cboxMetodo.text+'","'+edtDataCriacao.text+'","'+codigo_projeto+'")');
      Query.ExecSQL;
    end;
    //Atualiza tabela de exibição dos requisitos
    with query do
    begin
      query.close;
      query.sql.Text:=('select nome as Nome from tbrequisito');
      query.open;
    end;
    //Finaliza cadastro, exibe mensagem e limpa os campos
    showmessage('O requisito foi cadastrado!');
    FormModeloCascata.Show;
    FormModeloCascataExtracao.Close;
  end;

procedure TFormModeloCascataExtracao.AjudaClick(Sender: TObject);
begin
  //Cria o formModeloCascataExtracaoAjuda
  Application.CreateForm(TFormModeloCascataExtracaoAjuda, FormModeloCascataExtracaoAjuda);
  FormModeloCascataExtracaoAjuda.ShowModal;
  end;

end.
