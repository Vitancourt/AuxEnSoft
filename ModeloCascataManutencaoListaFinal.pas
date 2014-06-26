unit ModeloCascataManutencaoListaFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Menus, Buttons, ExtCtrls, Grids, DBGrids, RpCon, RpConDS, RpDefine,
  RpRave;

type
  TformModeloCascataManutencaoListaFinal = class(TForm)
    panelLista: TPanel;
    lblLista: TLabel;
    gridManutencao: TDBGrid;
    edtProcurar: TLabeledEdit;
    btnConcluido: TBitBtn;
    btnSelecionar: TButton;
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    query: TZQuery;
    source: TDataSource;
    panelCriar: TPanel;
    lblCriar: TLabel;
    lblDesc: TLabel;
    lblResult: TLabel;
    edtIdentificador: TLabeledEdit;
    edtNome: TLabeledEdit;
    memoDescricao: TMemo;
    cboxResultado: TComboBox;
    btnLimpar: TBitBtn;
    btnLista: TButton;
    btnDescricao: TButton;
    querydesc: TZQuery;
    rvDesc: TRvProject;
    ConectaDesc: TRvDataSetConnection;
    querylista: TZQuery;
    rvLista: TRvProject;
    conectalista: TRvDataSetConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logoff1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtIdentificadorChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnConcluidoClick(Sender: TObject);
    procedure btnDescricaoClick(Sender: TObject);
    procedure btnListaClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataManutencaoListaFinal: TformModeloCascataManutencaoListaFinal;

implementation

uses ModeloCascata, ModeloCascataManutencaoListaFinalAjuda;

{$R *.dfm}

procedure TformModeloCascataManutencaoListaFinal.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataManutencaoListaFinal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha e libera
  formModeloCascataManutencaoListaFinal.release;
  formModeloCascataManutencaoListaFinal:=Nil;
end;

procedure TformModeloCascataManutencaoListaFinal.Logoff1Click(
  Sender: TObject);
begin
  //Faz logoff
  formmodelocascata.close;
  formmodelocascatamanutencaolistafinal.Close;
end;

procedure TformModeloCascataManutencaoListaFinal.btnSelecionarClick(
  Sender: TObject);
var
  nome_manutencao, resultado:string;
begin
  //guarda valor na variavel
  nome_manutencao:=(gridManutencao.Columns.Items[0].Field).AsString;
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbmanutencao where nome="'+nome_manutencao+'" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.Open;
    edtIdentificador.text:=Query.FieldByName('identificador').AsString;
    edtNome.Text:=Query.FieldByName('nome').AsString;
    memoDescricao.lines.text:=Query.FieldByName('descricao').AsString;
    resultado:=Query.FieldByName('resultado').AsString;
    if (resultado='BOM') then
    begin
      cboxResultado.ItemIndex:=0;
    end;
    if (resultado='REGULAR') then
    begin
      cboxResultado.ItemIndex:=1;
    end;
    if (resultado='RUIM') then
    begin
      cboxResultado.ItemIndex:=2;
    end;
  end;
  //Atualiza grid
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nome as Nome from tbmanutencao where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataManutencaoListaFinal.edtIdentificadorChange(
  Sender: TObject);
begin
  //Verifica se existe e habilita ou desabilita botoes
  if (edtIdentificador.text='') then
  begin
    btnDescricao.Enabled:=False;
    btnLimpar.Enabled:=False;
  end
  else
  begin
    btnDescricao.Enabled:=True;
    btnLimpar.Enabled:=True;
  end;
end;

procedure TformModeloCascataManutencaoListaFinal.btnLimparClick(
  Sender: TObject);
begin
  //Limpa
  edtIdentificador.clear;
  edtNome.clear;
  memoDescricao.Lines.clear;
  cboxResultado.ItemIndex:=-1;
end;

procedure TformModeloCascataManutencaoListaFinal.edtProcurarChange(
  Sender: TObject);
begin
  //Filtra
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.Text:=('select nome as Nome from tbmanutencao where nome like "'+edtProcurar.text+'%" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
  end;
end;

procedure TformModeloCascataManutencaoListaFinal.btnConcluidoClick(
  Sender: TObject);
begin
 //Fecha
 formModeloCascataManutencaoListaFinal.close;
end;

procedure TformModeloCascataManutencaoListaFinal.btnDescricaoClick(
  Sender: TObject);
begin
    with querydesc do
    begin
      querydesc.ParamByName('NOME').Value:=edtNome.Text;
    end;
    with rvDesc do
    begin
      rvDesc.SetParam('NOME',(edtNome.Text));
      rvDesc.Execute;
      rvDesc.Close;
    end;

end;

procedure TformModeloCascataManutencaoListaFinal.btnListaClick(
  Sender: TObject);
begin
  rvLista.execute;
  rvLista.close;
end;

procedure TformModeloCascataManutencaoListaFinal.Ajuda1Click(
  Sender: TObject);
begin
Application.CreateForm(tformModeloCascataManutencaoListaFinalAjuda, formModeloCascataManutencaoListaFinalAjuda);
formModeloCascataManutencaoListaFinalAjuda.showmodal;
end;

end.
