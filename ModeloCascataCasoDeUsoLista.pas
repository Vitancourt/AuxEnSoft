unit ModeloCascataCasoDeUsoLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Buttons, ExtCtrls, Grids, DBGrids;

type
  TFormModeloCascataCasoDeUsoLista = class(TForm)
    PanelLista: TPanel;
    lblListaCasosDeUso: TLabel;
    GridCasos: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnVoltar: TBitBtn;
    btnLimpar: TBitBtn;
    btnExcluir: TBitBtn;
    Source: TDataSource;
    query: TZQuery;
    PanelaCadastro: TPanel;
    lblCriarCasoDeUso: TLabel;
    lblObjetivo: TLabel;
    lblPreRequisitos: TLabel;
    lblDescricao: TLabel;
    edtNome: TLabeledEdit;
    edtDataCriacao: TLabeledEdit;
    memoObjetivo: TMemo;
    memoPreRequisitos: TMemo;
    btnSalvar: TBitBtn;
    memoDescricao: TMemo;
    btnLimpar1: TBitBtn;
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    edtAtor: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure LogoffClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnLimpar1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataCasoDeUsoLista: TFormModeloCascataCasoDeUsoLista;

implementation

uses ModeloCascata, ModeloCascataCasoDeUsoListaAjuda;

{$R *.dfm}

procedure TFormModeloCascataCasoDeUsoLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera memória
  FormModeloCascataCasoDeUsoLista.release;
  FormModeloCascataCasoDeUsoLista:=Nil
end;

procedure TFormModeloCascataCasoDeUsoLista.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Atualiza gridCasos
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbCasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataCasoDeUsoLista.edtNomeChange(Sender: TObject);
begin
  //Desabilita campos se tiver dados
  if not (edtNome.text='') then
  begin;
  gridCasos.Enabled:=true;
  edtProcurar.Enabled:=true;
  btnEditar.Enabled:=true;
  btnExcluir.Enabled:=true;
  btnLimpar.Enabled:=true;
  btnVoltar.Enabled:=true;
  edtAtor.Enabled:=False;
  lblObjetivo.Enabled:=False;
  lblPreRequisitos.Enabled:=False;
  lblDescricao.Enabled:=False;
  //Habilita
  memoObjetivo.Enabled:=True;
  memoPreRequisitos.Enabled:=True;
  memoDescricao.Enabled:=True;
  end;
  //Habilita
  if (edtNome.text='') then
  begin
  gridCasos.Enabled:=True;
  edtProcurar.Enabled:=True;
  btnEditar.Enabled:=True;
  btnExcluir.Enabled:=True;
  btnLimpar.Enabled:=True;
  btnVoltar.Enabled:=True;
  edtAtor.Enabled:=false;
  lblObjetivo.Enabled:=false;
  memoObjetivo.Enabled:=False;
  lblPreRequisitos.Enabled:=false;
  memoPreRequisitos.Enabled:=false;
  lblDescricao.Enabled:=false;
  memoDescricao.Enabled:=false;
  btnSalvar.Enabled:=false;
  btnCancelar.enabled:=false;
  btnLimpar1.Enabled:=false;
  end
  else
  begin
  gridCasos.Enabled:=false;
  edtProcurar.Enabled:=false;
  btnEditar.Enabled:=false;
  btnExcluir.Enabled:=false;
  btnLimpar.Enabled:=false;
  btnVoltar.Enabled:=false;
  edtAtor.Enabled:=false;
  lblObjetivo.Enabled:=true;
  memoObjetivo.Enabled:=true;
  lblPreRequisitos.Enabled:=true;
  memoPreRequisitos.Enabled:=true;
  lblDescricao.Enabled:=true;
  memoDescricao.Enabled:=true;
  btnSalvar.Enabled:=true;
  btnCancelar.enabled:=true;
  btnLimpar1.Enabled:=true;
  end;
end;

procedure TFormModeloCascataCasoDeUsoLista.btnExcluirClick(
  Sender: TObject);
var
  casodeuso:String;
  resposta,codigo_projeto:integer;
begin
  //Armazena o nome do caso de uso do dbgrid na variável
  casodeuso:=(gridCasos.Columns.Items[0].Field).AsString;
  //se casodeuso vazio ou não selecionado
  if (casodeuso='') then
  begin
    showmessage('Selecione um caso de uso na lista!');
    GridCasos.SetFocus;
    Abort;
  end;
  //Seleciona codigo_projeto na variavel
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByname('codigo_projeto').asInteger;
  end;
  //Questiona se deseja fazer a exclusao
  resposta:=messagedlg('Deseja realmente excluir o caso de uso '+casodeuso+' e todos dados ligados a ele?',mtinformation,mbokcancel,0);
  //Se sim
  if (resposta=1) then
  begin
    //Deleta o caso de uso
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('delete from tbcasodeuso where nome="'+casodeuso+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
      query.ExecSql;
    end;

      //Atualiza gridCasos
        with query do
        begin
          query.close;
          query.sql.clear;
          query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto="'+IntToStr(codigo_projeto)+'" order by codigo desc limit 1');
          query.open;
        end;

        //Exibe mensagem de sucesso
        showmessage('Caso de uso '+casodeuso+' excluido!');
    end;
      with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
    end;
  end;

procedure TFormModeloCascataCasoDeUsoLista.btnVoltarClick(Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataCasoDeUsoLista.Close;
end;

procedure TFormModeloCascataCasoDeUsoLista.LogoffClick(Sender: TObject);
begin
  //Faz logoff
  FormModeloCascata.Close;
  FormModeloCascataCasoDeUsoLista.Close;
end;

procedure TFormModeloCascataCasoDeUsoLista.btnLimparClick(Sender: TObject);
begin
  //Limpa o edtprocurar
  edtProcurar.Clear;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataCasoDeUsoLista.btnLimpar1Click(
  Sender: TObject);
begin
  //Limpa os campos
  edtNome.Clear;
  edtDataCriacao.Clear;
  edtAtor.clear;
  memoObjetivo.Lines.Clear;
  memoPreRequisitos.Lines.Clear;
  memoDescricao.Lines.Clear;
end;

procedure TFormModeloCascataCasoDeUsoLista.btnEditarClick(Sender: TObject);
var
  casodeuso:string;
  codigo_projeto,codigo_casodeuso,codigo_ator:integer;
begin
  //Armazena o nome do caso de uso do dbgrid na variável
  casodeuso:=(gridCasos.Columns.Items[0].Field).AsString;
  //Se caso de uso estiver vazio ou nao selecionado
  if (casodeuso='') then
  begin
    showmessage('Selecione um caso de uso por favor!');
    GridCasos.setFocus;
    Abort;
  end;
  //Seleciona codigo_projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.SQL.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsInteger;
  end;
  //Seleciona tudo de caso de uso e adiciona nos campos
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbcasodeuso where nome="'+casodeuso+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.Open;
    codigo_casodeuso:=query.fieldbyname('codigo').AsInteger;
    edtnome.text:=query.fieldbyname('nome').AsString;
    edtAtor.Text:=query.fieldbyname('ator').AsString;
    edtDataCriacao.text:=Query.Fieldbyname('data').AsString;
    memoObjetivo.lines.text:=Query.fieldbyname('objetivo').AsString;
    memoPreRequisitos.lines.text:=query.fieldbyname('prerequisito').AsString;
    memoDescricao.lines.Text:=query.fieldbyname('descricao').AsString;
  end;
  //Atualiza gridCasos
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataCasoDeUsoLista.btnCancelarClick(
  Sender: TObject);
begin
  //Limpa os campos
  edtNome.Clear;
  edtDataCriacao.Clear;
  edtAtor.Clear;
  memoObjetivo.Lines.Clear;
  memoPreRequisitos.Lines.Clear;
  memoDescricao.Lines.Clear;
end;

procedure TFormModeloCascataCasoDeUsoLista.AjudaClick(Sender: TObject);
begin
  //Cria o form ajuda
  Application.CreateForm(TFormModeloCascataCasoDeUsoListaAjuda, FormModeloCascataCasoDeUsoListaAjuda);
  FormModeloCascataCasoDeUsoListaAjuda.ShowModal;
end;

procedure TFormModeloCascataCasoDeUsoLista.btnSalvarClick(Sender: TObject);
var
  palavra,letra:string;
  i,tamanho,cont,codigo_projeto:integer;
begin
  //Se tiver vazio exiba erro
  if (edtNome.text='') then
  begin
    showmessage('Você não tem nenhum caso de uso selecionado para edição!');
    abort;
  end;
  //Se objetivo estiver vazio
  if (memoObjetivo.lines.text='') then
  begin
    showmessage('O campo objetivo é obrigatório!');
    memoObjetivo.setfocus;
    abort;
  end;
  if (memoPreRequisitos.lines.text='') then
  begin
    showmessage('O campo pré requisitos é obrigatório!');
    memoPreRequisitos.SetFocus;
    abort;
  end;
  if (memoDescricao.lines.Text='') then
  begin
    showmessage('O campo descrição é obrigatório!');
    memoDescricao.SetFocus;
    Abort;
  end;
  //Se memoobjetivo estiver com espaços mais que letras
  cont:=0;
  palavra:=memoObjetivo.Lines.text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra,i,1);
      if (letra=' ') then cont:= cont-1
      else cont:=cont+2;
  end;
  if (cont<0) then
  begin
    showmessage('O campo objetivo tem mais espaços que letras!');
    memoObjetivo.setfocus;
    abort;
  end;
 //Se memoprerequisitos estiver com espaços mais que letras
  cont:=0;
  palavra:=memoPreRequisitos.Lines.text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra,i,1);
      if (letra=' ') then cont:= cont-1
      else cont:=cont+2;
  end;
  if (cont<0) then
  begin
    showmessage('O campo pré requisitos tem mais espaços que letras!');
    memoPreRequisitos.setfocus;
    abort;
  end;
  //Se memodescricao estiver com espaços mais que letras
  cont:=0;
  palavra:=memodescricao.Lines.text;
  tamanho:=length(palavra);
  for i:=1 to tamanho do
  begin
    letra:=copy(palavra,i,1);
      if (letra=' ') then cont:= cont-1
      else cont:=cont+2;
  end;
  if (cont<0) then
  begin
    showmessage('O campo descrição tem mais espaços que letras!');
    memoDescricao.setfocus;
    abort;
  end;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  //Atualiza os dados editados
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('update tbcasodeuso set objetivo="'+memoObjetivo.Lines.text+'", prerequisito="'+memoPreRequisitos.Lines.Text+'", descricao="'+memoDescricao.Lines.Text+'" where nome="'+edtNome.text+'" and codigo_projeto="'+IntToStr(codigo_projeto)+'"');
    query.ExecSQL;
  end;
  //atualiza dbgrid
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
    showmessage('Requisito '+edtnome.text+' atualizado!');
  end;
  //Limpa os campos
  edtNome.clear;
  edtDataCriacao.clear;
  edtAtor.clear;
  memoObjetivo.lines.clear;
  memoPreRequisitos.Lines.clear;
  memoDescricao.lines.clear;
end;

procedure TFormModeloCascataCasoDeUsoLista.edtProcurarChange(
  Sender: TObject);
begin
  //Procurar com like segundo o que esta no edtProcurar
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbCasodeUso where nome like "'+edtprocurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

end.
