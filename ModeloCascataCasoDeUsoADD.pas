unit ModeloCascataCasoDeUsoADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, JPEG, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids;

type
  TFormModeloCascataCasoDeUsoADD = class(TForm)
    Menu: TMainMenu;
    Ajuda: TMenuItem;
    Logoff: TMenuItem;
    query: TZQuery;
    PanelLista: TPanel;
    lblListaCasosDeUso: TLabel;
    Source: TDataSource;
    GridCasos: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnVoltar: TBitBtn;
    btnLimpar: TBitBtn;
    btnExcluir: TBitBtn;
    PanelaCadastro: TPanel;
    lblCriarCasoDeUso: TLabel;
    edtNome: TLabeledEdit;
    edtDataCriacao: TLabeledEdit;
    memoObjetivo: TMemo;
    lblObjetivo: TLabel;
    memoPreRequisitos: TMemo;
    lblPreRequisitos: TLabel;
    btnCriarCaso: TBitBtn;
    lblDescricao: TLabel;
    memoDescricao: TMemo;
    btnLimpar1: TBitBtn;
    lblAtor: TLabel;
    edtAtor: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LogoffClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnLimpar1Click(Sender: TObject);
    procedure btnCriarCasoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AjudaClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataCasoDeUsoADD: TFormModeloCascataCasoDeUsoADD;

implementation

uses ModeloCascata, Home, ModeloCascataCasoDeUsoADDAjuda;

{$R *.dfm}

procedure TFormModeloCascataCasoDeUsoADD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha o form e libera da memória
  FormModeloCascataCasoDeUsoADD.release;
  FormModeloCascataCasoDeUsoADD:=Nil;
end;

procedure TFormModeloCascataCasoDeUsoADD.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //PegaDataAtual
  edtDataCriacao.text:=DateToStr(Date);
  //Seleciona os casos de uso do projeto e exibe no grid
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TFormModeloCascataCasoDeUsoADD.LogoffClick(Sender: TObject);
begin
  //Faz logoff e volta a home
  FormModeloCascataCasoDeUsoADD.Close;
  FormModeloCascata.Close;
end;
procedure TFormModeloCascataCasoDeUsoADD.btnVoltarClick(Sender: TObject);
begin
  //Fechar o form
  FormModeloCascataCasoDeUsoADD.Close;
end;

procedure TFormModeloCascataCasoDeUsoADD.btnLimparClick(Sender: TObject);
begin
  //Limpar o edtprocurar
  edtProcurar.Clear;
  edtProcurar.SetFocus;
end;

procedure TFormModeloCascataCasoDeUsoADD.btnLimpar1Click(Sender: TObject);
begin
  //Limpa os campos do panel cadastro
  edtNome.Clear;
  edtDataCriacao.text:=DateToStr(Date);
  edtAtor.Clear;
  memoObjetivo.Lines.Clear;
  memoPreRequisitos.Lines.Clear;
  memoDescricao.Lines.Clear;
end;


procedure TFormModeloCascataCasoDeUsoADD.btnCriarCasoClick(
  Sender: TObject);
var
  codigo_projeto,codigo_casodeuso,tamanho,i,cont:integer;
  palavra,letra:string;
begin
  //Verifica se os campos estão vazios
  if (edtNome.text='') then
  begin
    showmessage('O campo de nome é obrigatório!');
    edtNome.SetFocus;
    Abort;
  end;
  if (edtAtor.text='') then
  begin
    showmessage('O campo ator é obrigatório!');
    edtAtor.setFocus;
    Abort;
  end;
  if (memoObjetivo.Lines.Text='') then
  begin
    showmessage('O campo objetivo é obrigatório!');
    memoObjetivo.setfocus;
    abort;
  end;
  if (memoPreRequisitos.Lines.Text='') then
  begin
    showmessage('O campo pré requisitos é obrigatório!');
    memoPreRequisitos.setFocus;
    Abort;
  end;
  if (memoDescricao.Lines.Text='') then
  begin
    showmessage('O campo descrição é obrigatório!');
    memoObjetivo.SetFocus;
    Abort;
  end;
  //Valida espaços nos campos
  cont:=0;
  palavra:=edtNome.Text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i,1);
        if (letra=' ')
        then
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
  palavra:=edtAtor.Text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i,1);
        if (letra=' ')
        then
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
      showmessage('O campo ator contém mais espaços do que letras!');
      edtAtor.SetFocus;
      Abort;
    end;
  cont:=0;
  palavra:=memoObjetivo.Lines.Text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i,1);
        if (letra=' ')
        then
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
  palavra:=memoPreRequisitos.Lines.text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i,1);
        if (letra=' ')
        then
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
  palavra:=memoDescricao.Lines.text;
  tamanho:=length(palavra);
    for i:=1 to tamanho do
    begin
      letra:=copy(palavra,i,1);
        if (letra=' ')
        then
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
  //Pega o codigo_projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').asinteger;
  end;

  //Verifica se já não existe este nome de caso de uso no projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome from tbcasodeuso where nome="'+edtnome.text+'" and codigo_projeto='+IntToStr(codigo_projeto)+'');
    query.open;
      if not query.IsEmpty then
      begin
        with query do
        begin
          query.Close;
          query.sql.clear;
          query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto='+IntToStr(codigo_projeto)+'');
          query.open;
        end;
        showmessage('Este nome de caso de uso já existe neste projeto!');
        edtNome.SetFocus;
        Abort;
      end;
  end;
  
  //Insere os dados no tbCasodeuso
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('insert into tbCasoDeUso (nome,data,objetivo,prerequisito,descricao,codigo_projeto, ator) values ("'+edtNome.text+'","'+edtDataCriacao.text+'","'+memoObjetivo.Lines.Text+'","'+memoPreRequisitos.Lines.Text+'","'+memoDescricao.Lines.Text+'","'+IntToStr(codigo_projeto)+'","'+edtAtor.Text+'")');
    query.open;
    showmessage('Caso de uso criado com sucesso!');
  end;
  //Pega codigo_caso de uso
  with query do
  begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select codigo from tbcasodeuso order by codigo desc limit 1');
      query.open;
  end;
  //Limpa os campos
  edtNome.Clear;
  edtDataCriacao.text:=DateToStr(Date);
  edtAtor.Clear;
  memoObjetivo.Lines.Clear;
  memoPreRequisitos.Lines.Clear;
  memoDescricao.Lines.Clear;
  //Atualiza gridCasosDeUso
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
        query.open;
      end;
end;

procedure TFormModeloCascataCasoDeUsoADD.btnExcluirClick(Sender: TObject);
var
  casodeuso:string;
  resposta,codigo_projeto:integer;
begin
  //Armazena o nome do caso de uso do dbgrid na variável
  casodeuso:=(gridCasos.Columns.Items[0].Field).AsString;
  //Se nomecasodeuso estiver vazio
  if (casodeuso='') then
  begin
    showmessage('Selecione um caso de uso da lista!');
    gridCasos.SetFocus;
    Abort;
  end;
  //Seleciona codigo_projeto
  with query do
  begin
    query.close;
    query.sql.Clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').AsInteger;
  end;
  resposta:=messagedlg('Deseja excluir '+casodeuso+' e tudo relacionado a ele?',mtinformation,mbokcancel,0);
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
    //AtualizaGridCasosDeUso
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
    end;
  end;
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nome as Nome from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
    end;
end;

procedure TFormModeloCascataCasoDeUsoADD.AjudaClick(Sender: TObject);
begin
  //AbreFormModelOCascataCASODEUSOADDAJUDA
  Application.CreateForm(TFormModeloCascataCasoDeUsoADDAjuda, FormModeloCascataCasoDeUsoADDAjuda);
  FormModeloCascataCasoDeUsoADDAjuda.ShowModal;
end;

procedure TFormModeloCascataCasoDeUsoADD.edtProcurarChange(
  Sender: TObject);
begin
 with query do
 begin
  query.close;
  query.sql.clear;
  query.sql.text:=('select nome as Nome from tbcasodeuso where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
  query.open;
 end;
end;

end.
