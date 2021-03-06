unit ModeloCascataTabelaCriar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormModeloCascataTabelaCriar = class(TForm)
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    PanelLista: TPanel;
    lblTabelas: TLabel;
    Source: TDataSource;
    gridtabelas: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnVoltar: TBitBtn;
    query: TZQuery;
    panelCriar: TPanel;
    lblCriarTabela: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblDataCriacao: TLabel;
    edtDataCriacao: TEdit;
    lblColunas: TLabel;
    memoColunas: TMemo;
    lblDescricao: TLabel;
    memoDescricao: TMemo;
    lblDDL: TLabel;
    memoDDL: TMemo;
    btnCriar: TBitBtn;
    btnLimpar: TBitBtn;
    btnLimpar1: TBitBtn;
    btnExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LogoffClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnLimpar1Click(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTabelaCriar: TFormModeloCascataTabelaCriar;

implementation

uses ModeloCascata, Home, ModeloCascataTabelaCriarAjuda;

{$R *.dfm}

procedure TFormModeloCascataTabelaCriar.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  edtDataCriacao.Text:=DateToStr(Date);
  //Atualiza lista da tbtabela
  with query do
  begin
    query.Close;
    query.SQL.Clear;
    query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaCriar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha e libera m�m�ria
  FormModeloCascataTabelaCriar.Release;
  FormModeloCascataTabelaCriar:=nil;
end;

procedure TFormModeloCascataTabelaCriar.LogoffClick(Sender: TObject);
begin
  //Faz logoff e volta ao home
  FormModeloCascata.Close;
  FormModeloCascataTabelaCriar.Close;
end;

procedure TFormModeloCascataTabelaCriar.btnVoltarClick(Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataTabelaCriar.Close;
end;

procedure TFormModeloCascataTabelaCriar.edtProcurarChange(
  Sender: TObject);
begin
  //Atualiza tabela segundo texto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbtabela where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbtabela order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaCriar.btnLimparClick(Sender: TObject);
begin
  //Limpar os campos
  edtNome.clear;
  edtDataCriacao.text:=DateToStr(Date);
  memoColunas.Lines.clear;
  memoDescricao.lines.clear;
  memoDDL.lines.clear;
end;

procedure TFormModeloCascataTabelaCriar.btnLimpar1Click(Sender: TObject);
begin
  //Limpa o edt procurar
  edtProcurar.clear;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataTabelaCriar.btnCriarClick(Sender: TObject);
var
  palavra, letra:string;
  i,cont,tamanho,codigo_projeto:integer;
begin
  //Valida os campos contra campos vazios
  if (edtNome.text='') then
  begin
    showmessage('O campo nome � obrigat�rio!');
    edtNome.SetFocus;
    abort;
  end;
  if (edtDataCriacao.text='') then
  begin
    edtDataCriacao.text:=DateToStr(date);
  end;
  if (memoColunas.Lines.text='') then
  begin
    showmessage('O campo colunas � obrigat�rio!');
    memoColunas.SetFocus;
    abort;
  end;
  if (memoDescricao.lines.text='') then
  begin
    showmessage('O campo descri��o � obrigat�rio!');
    memoDescricao.SetFocus;
    Abort;
  end;
  if (memoDDL.lines.text='') then
  begin
    showmessage('O campo ddl � obrigat�rio!');
    memoDDL.SetFocus;
    Abort;
  end;
  //Valida os campos contra mais espa�os do que letras
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
    showmessage('O campo nome cont�m mais espa�os do que letras!');
    edtNome.SetFocus;
    Abort;
  end;
  cont:=0;
  palavra:=memoColunas.lines.text;
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
    showmessage('O campo colunas cont�m mais espa�os do que letras!');
    memoColunas.SetFocus;
    Abort;
  end;
  cont:=0;
  palavra:=memoDescricao.lines.text;
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
    showmessage('O campo descri��o cont�m mais espa�os do que letras!');
    memoDescricao.SetFocus;
    Abort;
  end;
  cont:=0;
  palavra:=memoDDL.lines.text;
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
    showmessage('O campo ddl cont�m mais espa�os do que letras!');
    memoDDL.SetFocus;
    Abort;
  end;
  //seleciona o codigo do projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsInteger;
  end;
  //Verifica se j� n�o existe na tbtabela este nome
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome from tbtabela where nome="'+edtnome.text+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    //Se existir
    if not query.IsEmpty then
    begin
      showmessage('Este nome de tabela j� existe neste projeto!');
        //Atualiza lista da tbtabela
  with query do
  begin
    query.Close;
    query.SQL.Clear;
    query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
      abort;
    end;
    //Se n�o existir
    if query.IsEmpty then
    begin
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('insert into tbtabela (nome, datacriacao, colunas, descricao, ddl, codigo_projeto) values ("'+edtNome.Text+'","'+edtDataCriacao.text+'","'+memoColunas.lines.text+'","'+memoDescricao.lines.text+'","'+memoDDL.Lines.text+'","'+IntToStr(codigo_projeto)+'")');
        query.ExecSQL;
          with query do
          begin
            query.close;
            query.sql.clear;
            query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
            query.Open;
            showmessage('Tabela criada com sucesso!');
            edtNome.Clear;
            edtDataCriacao.text:=DateToStr(Date);
            memoColunas.lines.clear;
            memoDescricao.lines.clear;
            memoDDL.Lines.clear;
          end;
      end;
    end;
  end;
end;

procedure TFormModeloCascataTabelaCriar.btnExcluirClick(Sender: TObject);
var
  nome_tabela:string;
  resposta,codigo_projeto:integer;
begin
  //Pega o nome da tabela na vari�vel
  nome_tabela:=(gridTabelas.Columns.Items[0].Field).AsString;
  //Pega o codigo do projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsInteger;
  end;
  resposta:=messagedlg('Voc� deseja realemente excluir a tabela '+nome_tabela+' e tudo relacionado?',mtinformation,mbokcancel,0);
  if (resposta=1) then
  begin
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('delete from tbtabela where nome="'+nome_tabela+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
      query.ExecSQL;
    end;
  end;
  //Atualiza gridtabelas
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaCriar.AjudaClick(Sender: TObject);
begin
  //Cria e exibe o form ajuda
  Application.CreateForm(TFormModeloCascataTabelaCriarAjuda, FormModeloCascataTabelaCriarAjuda);
  FormModeloCascataTabelaCriarAjuda.ShowModal;
end;

end.
