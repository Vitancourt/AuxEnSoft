unit ModeloCascataTabelaEditar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TFormModeloCascataTabelaEditar = class(TForm)
    PanelLista: TPanel;
    lblTabelas: TLabel;
    gridtabelas: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnVoltar: TBitBtn;
    btnLimpar1: TBitBtn;
    btnExcluir: TBitBtn;
    panelCriar: TPanel;
    lblCriarTabela: TLabel;
    lblNome: TLabel;
    lblDataCriacao: TLabel;
    lblColunas: TLabel;
    lblDescricao: TLabel;
    lblDDL: TLabel;
    edtNome: TEdit;
    edtDataCriacao: TEdit;
    memoColunas: TMemo;
    memoDescricao: TMemo;
    memoDDL: TMemo;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    query: TZQuery;
    Source: TDataSource;
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    btnEditar: TBitBtn;
    procedure btnLimpar1Click(Sender: TObject);
    procedure LogoffClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTabelaEditar: TFormModeloCascataTabelaEditar;

implementation

uses ModeloCascata, ModeloCascataTabelaEditarAjuda;

{$R *.dfm}

procedure TFormModeloCascataTabelaEditar.btnLimpar1Click(Sender: TObject);
begin
  //Limpa edtprocurar
  edtProcurar.clear;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataTabelaEditar.LogoffClick(Sender: TObject);
begin
  //Faz logoff e volta ao home
  FormModeloCascata.Close;
  FormModeloCascataTabelaEditar.Close;
end;

procedure TFormModeloCascataTabelaEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar e libera memória
  FormModeloCascataTabelaEditar.Release;
  FormModeloCascataTabelaEditar:=Nil;
end;

procedure TFormModeloCascataTabelaEditar.btnCancelarClick(Sender: TObject);
begin
  //Cancela edição limpando os campos
  edtNome.Clear;
  edtDataCriacao.Clear;
  memoColunas.lines.clear;
  memoDescricao.Lines.Clear;
  memoDDL.lines.clear;
  edtProcurar.setFocus;
end;

procedure TFormModeloCascataTabelaEditar.edtNomeChange(Sender: TObject);
begin
  //Ativa ou desativa
  if (edtNome.Text='') then
  begin
    lblColunas.Enabled:=false;
    memoColunas.enabled:=False;
    lblDescricao.enabled:=false;
    memoDescricao.enabled:=false;
    lblDDL.Enabled:=false;
    memoDDL.Enabled:=false;
    btnSalvar.enabled:=False;
    btnCancelar.Enabled:=False;
    btnEditar.enabled:=True;
    btnExcluir.Enabled:=True;
    btnLimpar1.enabled:=True;
    btnVoltar.enabled:=True;
    edtProcurar.enabled:=True;
  end
  else
  begin
    lblColunas.Enabled:=True;
    memoColunas.enabled:=True;
    lblDescricao.enabled:=True;
    memoDescricao.enabled:=True;
    lblDDL.Enabled:=True;
    memoDDL.Enabled:=True;
    btnSalvar.enabled:=True;
    btnCancelar.Enabled:=True;
    btnEditar.enabled:=False;
    btnExcluir.Enabled:=False;
    btnLimpar1.enabled:=false;
    btnVoltar.enabled:=False;
    edtProcurar.enabled:=False;;
  end;
end;

procedure TFormModeloCascataTabelaEditar.btnVoltarClick(Sender: TObject);
begin
  //fecha
  FormModeloCascataTabelaEditar.Close;
end;

procedure TFormModeloCascataTabelaEditar.btnEditarClick(Sender: TObject);
var
  nome_tabela:string;
begin
  //Pega o nome da tabela na variável
  nome_tabela:=(gridTabelas.Columns.Items[0].Field).AsString;
  //Da um select com o nome da tabela
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbtabela where nome="'+nome_tabela+'" and codigo_projeto=(select codigo_projeto from tbtabela order by codigo desc limit 1)');
    query.open;
    //Insere nos campos
    edtNome.Text:=Query.FieldByName('nome').AsString;
    edtDataCriacao.text:=Query.FieldByName('datacriacao').AsString;
    memoColunas.lines.text:=Query.FieldByName('colunas').AsString;
    memoDescricao.Lines.text:=Query.FieldByName('descricao').AsString;
    memoDDL.Lines.text:=Query.FieldByName('ddl').AsString;
  end;
  //Atualiza grid
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaEditar.FormCreate(Sender: TObject);
begin
 //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Atualiza gridtabelas
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbtabela order by codigo desc limit 1)');
    query.open;
  end;
end;



procedure TFormModeloCascataTabelaEditar.btnExcluirClick(Sender: TObject);
var
  nome_tabela:string;
  resposta,codigo_projeto:integer;
begin
  //Pega o nome da tabela na variável
  nome_tabela:=(gridTabelas.Columns.Items[0].Field).AsString;
  //Pega o codigo projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  resposta:=messagedlg('Você deseja realemente excluir a tabela '+nome_tabela+' e tudo relacionado?',mtinformation,mbokcancel,0);
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

procedure TFormModeloCascataTabelaEditar.btnSalvarClick(Sender: TObject);
var
  palavra, letra:string;
  i,cont,tamanho,codigo_projeto:integer;
begin
  //seleciona o codigo do projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsInteger;
  end;
  //Valida os campos contra campos vazios
  if (edtNome.text='') then
  begin
    showmessage('O campo nome é obrigatório!');
    edtNome.SetFocus;
    abort;
  end;
  if (edtDataCriacao.text='') then
  begin
    edtDataCriacao.text:=DateToStr(date);
  end;
  if (memoColunas.Lines.text='') then
  begin
    showmessage('O campo colunas é obrigatório!');
    memoColunas.SetFocus;
    abort;
  end;
  if (memoDescricao.lines.text='') then
  begin
    showmessage('O campo descrição é obrigatório!');
    memoDescricao.SetFocus;
    Abort;
  end;
  if (memoDDL.lines.text='') then
  begin
    showmessage('O campo ddl é obrigatório!');
    memoDDL.SetFocus;
    Abort;
  end;
  //Valida os campos contra mais espaços do que letras
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
    showmessage('O campo nome contém mais espaços do que letras!');
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
    showmessage('O campo colunas contém mais espaços do que letras!');
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
    showmessage('O campo descrição contém mais espaços do que letras!');
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
    showmessage('O campo ddl contém mais espaços do que letras!');
    memoDDL.SetFocus;
    Abort;
  end;
    //Update
        with query do
        begin
          query.close;
          query.sql.clear;
          query.sql.text:=('update tbtabela set colunas="'+memoColunas.lines.text+'" where nome="'+edtnome.text+'" and codigo_projeto="'+inttostr(codigo_projeto)+'"');
          query.ExecSQL;
        end;
        with query do
        begin
          query.close;
          query.sql.clear;
          query.sql.text:=('update tbtabela set descricao="'+memoDescricao.lines.Text+'" where nome="'+edtnome.text+'" and codigo_projeto="'+inttostr(codigo_projeto)+'"');
          query.ExecSQL;
        end;
        with query do
        begin
          query.close;
          query.sql.clear;
          query.sql.text:=('update tbtabela set ddl="'+memoDDL.lines.text+'"  where nome="'+edtnome.text+'" and codigo_projeto="'+inttostr(codigo_projeto)+'"');
          query.ExecSQL;
        end;
    //Exibe mensagem de atualização
    showmessage('Editado com sucesso!');
    //Atualiza grid
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbtabela where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
    end;
    //Limpa os campos
    edtNome.Clear;
    edtDataCriacao.Clear;
    memoColunas.Lines.Clear;
    memoDescricao.Lines.Clear;
    memoDDL.Lines.Clear;
end;

procedure TFormModeloCascataTabelaEditar.edtProcurarChange(
  Sender: TObject);
begin
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbtabela where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataTabelaEditar.AjudaClick(Sender: TObject);
begin
  Application.CreateForm(tFormModeloCascataTabelaEditarAjuda, FormModeloCascataTabelaEditarAjuda);
  FormModeloCascataTabelaEditarAjuda.showmodal;
end;

end.
