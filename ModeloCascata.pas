unit ModeloCascata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TFormModeloCascata = class(TForm)
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Logoff1: TMenuItem;
    PanelExtracao: TPanel;
    btnExtrair: TBitBtn;
    lblRequisitos: TLabel;
    Query: TZQuery;
    btnEditar: TBitBtn;
    btnDefinir: TBitBtn;
    btnListaFinal: TBitBtn;
    PanelCasos: TPanel;
    lblCasosDeUso: TLabel;
    btnCriar: TBitBtn;
    btnEditar1: TBitBtn;
    btnListaFinal1: TBitBtn;
    PanelTabelas: TPanel;
    lblProjetoTabelas: TLabel;
    btnCriarbanco: TBitBtn;
    btnEditarBanco: TBitBtn;
    btnlistafinaltabelas: TBitBtn;
    btnDesbloquearCasos: TBitBtn;
    btnDesbloquearBanco: TBitBtn;
    PanelErros: TPanel;
    Label1: TLabel;
    btnCriarTesteUnidade: TBitBtn;
    btnEditarUnidade: TButton;
    btnListaFinalTesteUnidade: TBitBtn;
    btnDesbloquearUnidade: TBitBtn;
    panelTesteSistema: TPanel;
    lblTestedeSistema: TLabel;
    btnDefinirTesteSistema: TButton;
    btnEditarTesteSistema: TBitBtn;
    btnListaFinalTesteSistema: TBitBtn;
    btnDesbloquearTesteSistema: TBitBtn;
    panelManutencao: TPanel;
    lblManutencao: TLabel;
    btnCriarManutencao: TButton;
    btnEditarManutencao: TButton;
    btnListaFinalManutencao: TButton;
    btnDesbloquearManutencao: TBitBtn;
    procedure Logoff1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ajuda1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExtrairClick(Sender: TObject);
    procedure btnDefinirClick(Sender: TObject);
    procedure btnListaFinalClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnEditar1Click(Sender: TObject);
    procedure btnListaFinal1Click(Sender: TObject);
    procedure btnCriarbancoClick(Sender: TObject);
    procedure btnEditarBancoClick(Sender: TObject);
    procedure btnlistafinaltabelasClick(Sender: TObject);
    procedure btnDesbloquearCasosClick(Sender: TObject);
    procedure btnDesbloquearBancoClick(Sender: TObject);
    procedure btnCriarTesteUnidadeClick(Sender: TObject);
    procedure btnEditarUnidadeClick(Sender: TObject);
    procedure btnListaFinalTesteUnidadeClick(Sender: TObject);
    procedure btnDesbloquearUnidadeClick(Sender: TObject);
    procedure btnDefinirTesteSistemaClick(Sender: TObject);
    procedure btnEditarTesteSistemaClick(Sender: TObject);
    procedure btnListaFinalTesteSistemaClick(Sender: TObject);
    procedure btnDesbloquearTesteSistemaClick(Sender: TObject);
    procedure btnCriarManutencaoClick(Sender: TObject);
    procedure btnEditarManutencaoClick(Sender: TObject);
    procedure btnListaFinalManutencaoClick(Sender: TObject);
    procedure btnDesbloquearManutencaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascata: TFormModeloCascata;

implementation

uses Home, ModeloCascataAjuda, ModeloCascataLista, ModeloCascataExtracao, ModeloCascataDefinicaoRequisito,
ModeloCascataListaFinal, ModeloCascataCasoDeUsoADD, ModeloCascataCasoDeUsoLista,
  modelocascatacasodeusolistafinal, ModeloCascataTabelaCriar,
  ModeloCascataTabelaEditar, ModeloCascataTabelaListaFinal,
  ModeloCascataTesteUnidadeCriar, ModelCascataTesteUnidadeEditar,
  ModeloCascataTesteUnidadeListaFinal, ModeloCascataTesteSistemaDefinir,
  ModeloCascataTesteSistemaEditar, ModeloCascataTesteSistemaListaFinal,
  ModeloCascataManutencaoCriar, ModeloCascataManutencaoEditar,
  ModeloCascataManutencaoListaFinal;

{$R *.dfm}

procedure TFormModeloCascata.Logoff1Click(Sender: TObject);
begin
  //Faz Logoff
  FormModeloCascata.Close;
  FormHome.Show;
end;

procedure TFormModeloCascata.FormCreate(Sender: TObject);
var
  nivel:integer;
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  //Verifica o n�vel do projeto e faz altera��es nos bot�es
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select nivel from tbcascata where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    nivel:=Query.FieldByName('nivel').AsInteger;
  end;
  //Se o n�vel for 1
  if (nivel=1) then
  begin
    btnDesbloquearCasos.Visible:=False;
    btnCriar.Enabled:=True;
    btnEditar1.Enabled:=True;
    btnListaFinal1.Enabled:=True;
  end;
  //Se for nivel 2
  if (nivel=2) then
  begin
    btnDesbloquearCasos.Visible:=False;
    btnCriar.Enabled:=True;
    btnEditar1.Enabled:=True;
    btnListaFinal1.Enabled:=True;
    btnDesbloquearBanco.Visible:=False;
    btnCriarBanco.Enabled:=True;
    btnEditarBanco.Enabled:=True;
    btnListaFinalTabelas.Enabled:=True;
  end;
  //Se n�vel for 3
  if (nivel=3) then
  begin
    btnDesbloquearCasos.Visible:=False;
    btnCriar.Enabled:=True;
    btnEditar1.Enabled:=True;
    btnListaFinal1.Enabled:=True;
    btnDesbloquearBanco.Visible:=False;
    btnCriarBanco.Enabled:=True;
    btnEditarBanco.Enabled:=True;
    btnListaFinalTabelas.Enabled:=True;
    btnDesbloquearUnidade.Visible:=False;
    btnCriarTesteUnidade.enabled:=True;
    btnEditarUnidade.Enabled:=True;
    btnListaFinalTesteUnidade.Enabled:=True;
  end;
  if (nivel=4) then
  begin
    btnDesbloquearCasos.Visible:=False;
    btnCriar.Enabled:=True;
    btnEditar1.Enabled:=True;
    btnListaFinal1.Enabled:=True;
    btnDesbloquearBanco.Visible:=False;
    btnCriarBanco.Enabled:=True;
    btnEditarBanco.Enabled:=True;
    btnListaFinalTabelas.Enabled:=True;
    btnDesbloquearUnidade.Visible:=False;
    btnCriarTesteUnidade.enabled:=True;
    btnEditarUnidade.Enabled:=True;
    btnListaFinalTesteUnidade.Enabled:=True;
    btnDesbloquearTesteSistema.visible:=False;
    btnDefinirTesteSistema.Enabled:=True;
    btnEditarTesteSistema.Enabled:=True;
    btnListaFinalTesteSistema.Enabled:=True;
  end;
  if (nivel=5) then
  begin
    btnDesbloquearCasos.Visible:=False;
    btnCriar.Enabled:=True;
    btnEditar1.Enabled:=True;
    btnListaFinal1.Enabled:=True;
    btnDesbloquearBanco.Visible:=False;
    btnCriarBanco.Enabled:=True;
    btnEditarBanco.Enabled:=True;
    btnListaFinalTabelas.Enabled:=True;
    btnDesbloquearUnidade.Visible:=False;
    btnCriarTesteUnidade.enabled:=True;
    btnEditarUnidade.Enabled:=True;
    btnListaFinalTesteUnidade.Enabled:=True;
    btnDesbloquearTesteSistema.visible:=False;
    btnDefinirTesteSistema.Enabled:=True;
    btnEditarTesteSistema.Enabled:=True;
    btnListaFinalTesteSistema.Enabled:=True;
    btnDesbloquearManutencao.visible:=false;
    btnCriarManutencao.enabled:=true;
    btnEditarManutencao.enabled:=true;
    btnListaFinalManutencao.enabled:=true;
  end;
end;

procedure TFormModeloCascata.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  data, hora,codigo:string;
begin
  data:=DateToStr(date);
  hora:=TimeToStr(Time);
  //pega ultimo codigo
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo:=query.fieldbyname('codigo').Asstring;
  end;
  //Grava hora de sa�da
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('update tbprojetoacesso set datasaida="'+data+'", horasaida="'+hora+'" where codigo='+codigo+'');
    query.ExecSQL;
  end;
  //Fecha e elimina da mem�ria
  FormModeloCascata.Release;
  FormModeloCascata:=Nil;
end;

procedure TFormModeloCascata.Ajuda1Click(Sender: TObject);
begin
    //Exibe Form Ajuda
    Application.CreateForm(TFormModeloCascataAjuda, FormModeloCascataAjuda);
    FormModeloCascataAjuda.ShowModal;
end;
procedure TFormModeloCascata.btnEditarClick(Sender: TObject);
begin
  //CriaFormModeloCascataLista
  Application.CreateForm(TFormModeloCascataLista, FormModeloCascataLista);
  FormModeloCascataLista.ShowModal;
end;

procedure TFormModeloCascata.btnExtrairClick(Sender: TObject);
begin
  //CriaFormModelOCascataExtracao
  Application.CreateForm(TFormModeloCascataExtracao, FormModeloCascataExtracao);
  FormModeloCascataExtracao.ShowModal;
end;

procedure TFormModeloCascata.btnDefinirClick(Sender: TObject);
begin
  //Cria Formmodelocascatarequisitodefinicao
  Application.CreateForm(TFormModeloCascataDefinicaoRequisito, FormModeloCascataDefinicaoRequisito);
  FormModeloCascataDefinicaoRequisito.ShowModal;
end;

procedure TFormModeloCascata.btnListaFinalClick(Sender: TObject);
begin
  //Cria formmodelocascatalistafinal
  Application.CreateForm(TFormModeloCascataListaFinal, FormModeloCascataListaFinal);
  FormModeloCascataListaFinal.ShowModal;
end;

procedure TFormModeloCascata.btnCriarClick(Sender: TObject);
begin
  //Cria formmodelocasodeusoadd
  Application.CreateForm(TFormModeloCascataCasoDeUsoADD, FormModeloCascataCasoDeUsoADD);
  FormModeloCascataCasoDeUsoAdd.ShowModal;
end;

procedure TFormModeloCascata.btnEditar1Click(Sender: TObject);
begin
  //Cria formmodelocasodeusolista
  Application.CreateForm(TFormModeloCascataCasoDeUsoLista, FormModeloCascataCasoDeUsoLista);
  FormModeloCascataCasoDeUsoLista.ShowModal;
end;

procedure TFormModeloCascata.btnListaFinal1Click(Sender: TObject);
begin
  //Cria o FormModeloCascataCasoDeUsoListaFinal
  Application.CreateForm(TFormModeloCascataCasoDeUsoListaFinal, FormModeloCascataCasoDeUsoListaFInal);
  FormModeloCascataCasoDeUsoListaFInal.ShowModal;
end;

procedure TFormModeloCascata.btnCriarbancoClick(Sender: TObject);
begin
  //Cria e exibe FormModeloCascataTabelaCriar
  Application.CreateForm(TFormModeloCascataTabelaCriar, FormModeloCascataTabelaCriar);
  FormModeloCascataTabelaCriar.showmodal;
end;

procedure TFormModeloCascata.btnEditarBancoClick(Sender: TObject);
begin
  //Cria e exibe o form
  Application.CreateForm(TFormModeloCascataTabelaEditar, FormModeloCascataTabelaEditar);
  FormModeloCascataTabelaEditar.ShowModal;
end;

procedure TFormModeloCascata.btnlistafinaltabelasClick(Sender: TObject);
begin
  //Cria e exibe
  Application.CreateForm(TFormModeloCascataTabelaListaFinal, FormModeloCascataTabelaListaFinal);
  FormModeloCascataTabelaListaFinal.showmodal;
end;

procedure TFormModeloCascata.btnDesbloquearCasosClick(Sender: TObject);
var
  resposta, codigo_projeto:integer;
begin
  resposta:=messagedlg('Voc� deseja passar para o pr�ximo passo do modelo de desenvolvimento cascata? Pense bem, voltar atras pode ser preju�zo!',mtinformation,mbokcancel,0);
  if (resposta=1) then
  begin
    //seleciona os requisitos aprovados
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select * from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
        //Se estiver vazia
        if query.IsEmpty then
        begin
          showmessage('Voc� precisa ter no m�nimo um requisito com estado de "APROVADO", para passar para a pr�xima fase!');
          abort;
        end;
        // se query estiver vazia
        if not query.IsEmpty then
        begin
          query.close;
          query.sql.clear;
          query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
          query.open;
          codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
          query.close;
        end;
        with query do
        begin
          query.sql.clear;
          query.sql.text:=('insert into tbcascata (nivel, codigo_projeto) values ("1","'+IntToStr(codigo_projeto)+'")');
          query.ExecSQL;
          btnDesbloquearCasos.Visible:=False;
          showmessage('Parab�ns voc� entrou na fase de desenvolvimento de "Projeto (caso de uso)"');
          btnCriar.Enabled:=True;
          btnEditar1.Enabled:=True;
          btnListaFinal1.Enabled:=True;
          abort;
        end;
    end;
  end
  else
  begin
    showmessage('Pense muito bem antes de passar para o pr�ximo n�vel, complemente bem o n�vel de extra��o de requisito, depois de passar ao pr�ximo n�vel, voltar atras pode causar preju�zos!');
  end;
end;

procedure TFormModeloCascata.btnDesbloquearBancoClick(Sender: TObject);
var
  resposta,valor,codigo_projeto:integer;
  check:boolean;
begin
  //Libera se o o nivel for 1 e existir no m�nimo um caso de uso
  resposta:=messagedlg('Voc� deseja passar para a pr�xima fase do desenvolvimento cascata? Pense bem, voltar atras pode causar preju�zos!',mtinformation,mbokcancel,0);
  //Se resposta for sim
  if (resposta=1) then
  begin
        //Checa o nivel em que se encontra o projeto
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select nivel from tbcascata where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
      valor:=Query.FieldByName('nivel').AsInteger;
      if (valor<1) then
      begin
        check:=false;
      end
      else
      begin
        check:=true;
      end;
    end;
    //Conta quantos casos de uso existe no projeto
    with query do
    begin
      query.close;
      query.sql.clear;
      query.sql.text:=('select codigo from tbcasodeuso where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
      if query.isEmpty then
      begin
        check:=false;
      end;
      if not query.isempty then
      begin
        check:=true;
      end;
    end;
    //Se for true libera outro n�vel
    if (check=true) then
    begin
      //seleciona codigo_projeto
      with query do
      begin
        query.close;
        query.sql.clear;
        query.SQL.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
        query.open;
        codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
      end;
      //atualiza nivel do projeto
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('update tbcascata set nivel="2" where codigo_projeto="'+IntToStr(codigo_projeto)+'"');
        query.ExecSQL;
      end;
      btnDesbloquearBanco.Visible:=False;
      btnCriarBanco.Enabled:=True;
      btnEditarBanco.Enabled:=True;
      btnListaFinalTabelas.Enabled:=True;
      showmessage('Parab�ns voc� entrou na fase de desenvolvimento de "Projeto (banco de dados)"');
    end;
    if (check=false) then
    begin
      showmessage('Para passar para o n�vel dois � necess�rio que o n�vel um esteja desbloqueado e que tamb�m exista no m�nimo um projeto de caso de uso!');
      Abort;
    end;
  end;
end;

procedure TFormModeloCascata.btnCriarTesteUnidadeClick(Sender: TObject);
begin
  //Cria e exibe form
  Application.CreateForm(TFormModeloCascataTesteUnidadeCriar, FormModeloCascataTesteUnidadeCriar);
  FormModeloCascataTesteUnidadeCriar.showmodal;
end;

procedure TFormModeloCascata.btnEditarUnidadeClick(Sender: TObject);
begin
  //Cria e exibe form modelo cascata teste unidade
  Application.CreateForm(TFormModeloCascataTesteUnidadeEditar, FormModeloCascataTesteUnidadeEditar);
  FormModeloCascataTesteUnidadeEditar.ShowModal;
end;

procedure TFormModeloCascata.btnListaFinalTesteUnidadeClick(
  Sender: TObject);
begin
  //Cria e exibe o form
  Application.CreateForm(TFormModeloCascataTesteUnidadeListaFinal, FormModeloCascataTesteUnidadeListaFinal);
  FormModeloCascataTesteUnidadeListaFinal.ShowModal;
end;

procedure TFormModeloCascata.btnDesbloquearUnidadeClick(Sender: TObject);
var
  resposta,codigo_projeto:integer;
begin
  //Verifica codigo projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  resposta:=messagedlg('Para passar para o n�vel tr�s do modelo cascata � nescess�rio que o n�vel dois esteja desbloqueado, deseja continuar?',mtinformation,mbokcancel, 0);
  if (resposta=1) then
  begin
    //Verifica se j� est� no n�vel 2
    with query do
    begin
      query.close;
      query.sql.clear;
      query.SQL.text:=('select nivel from tbcascata where nivel=2 and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
      query.open;
      if query.isempty then
      begin
        showmessage('O n�vel dois n�o est� desbloqueado. Voc� deve passar por todos os n�veis seguindo sua ordem!');
        abort;
      end;
      if not query.isempty then
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('update tbcascata set nivel=3 where codigo_projeto="'+IntToStr(codigo_projeto)+'"');
        query.ExecSQL;
        showmessage('Parab�ns, voc� est� no n�vel 3!');
        btnDesbloquearUnidade.Visible:=False;
        btnCriarTesteUnidade.Enabled:=True;
        btnEditarUnidade.Enabled:=True;
        btnListaFinalTesteUnidade.Enabled:=True;
      end;
    end;
  end;
end;

procedure TFormModeloCascata.btnDefinirTesteSistemaClick(Sender: TObject);
begin
  //Cria e exibe
  Application.CreateForm(TFormModeloCascataTesteSistemaDefinir, FormModeloCascataTesteSistemaDefinir);
  FormModeloCascataTesteSistemaDefinir.ShowModal;
end;

procedure TFormModeloCascata.btnEditarTesteSistemaClick(Sender: TObject);
begin
  //Cria e exibe o form
  Application.CreateForm(TFormModeloCascataTesteSistemaEditar, FormModeloCascataTesteSistemaEditar);
  FormModeloCascataTesteSistemaEditar.showmodal;
end;

procedure TFormModeloCascata.btnListaFinalTesteSistemaClick(
  Sender: TObject);
begin
  //Cria e exibe form
  Application.CreateForm(TFormModeloCascataTesteSistemaListaFinal , FormModeloCascataTesteSistemaListaFinal);
  FormModeloCascataTesteSistemaListaFinal.showmodal;
end;

procedure TFormModeloCascata.btnDesbloquearTesteSistemaClick(
  Sender: TObject);
var
  resposta,codigo_projeto:integer;
begin
  //Verifica codigo projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=Query.FieldByName('codigo_projeto').AsInteger;
  end;
  resposta:=messagedlg('Para passar para o n�vel quatro do modelo cascata � nescess�rio que o tenha no m�nimo um requisito aprovado, deseja continuar?',mtinformation,mbokcancel, 0);
  if (resposta=1) then
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select * from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if query.isempty then
    begin
      showmessage('� necess�rio no m�nimo um requisito com estado aprovado!');
      abort;
    end;
    if not query.isempty then
    begin
      showmessage('N�vel quatro desbloqueado!');
      query.close;
      query.sql.clear;
      query.sql.text:=('update tbcascata set nivel=4 where codigo_projeto="'+IntToStr(codigo_projeto)+'"');
      query.ExecSQL;
    end;
    btnDesbloquearTesteSistema.visible:=False;
    btnDefinirTesteSistema.Enabled:=True;
    btnEditarTesteSistema.Enabled:=True;
    btnListaFinalTesteSistema.Enabled:=True;
  end;
end;

procedure TFormModeloCascata.btnCriarManutencaoClick(Sender: TObject);
begin
  //Cria e exibe o form
  Application.CreateForm(TFormModeloCascataManutencaoCriar, FormModeloCascataManutencaoCriar);
  FormModeloCascataManutencaoCriar.ShowModal;
end;

procedure TFormModeloCascata.btnEditarManutencaoClick(Sender: TObject);
begin
  //Cria e exibe
  Application.CreateForm(TformModeloCascataManutencaoEditar, formModeloCascataManutencaoEditar);
  formModeloCascataManutencaoEditar.showmodal;
end;

procedure TFormModeloCascata.btnListaFinalManutencaoClick(Sender: TObject);
begin
  //Cria e exibe
  Application.CreateForm(TformModeloCascataManutencaoListaFinal,formModeloCascataManutencaoListaFinal);
  formModeloCascataManutencaoListaFinal.showmodal;
end;

procedure TFormModeloCascata.btnDesbloquearManutencaoClick(
  Sender: TObject);
var
  codigo_projeto:integer;
begin
  //codigo projeto
  with query do
  begin
    query.close;
    query.sql.clear;
    query.sql.text:=('select codigo_projeto from tbprojetoacesso order by codigo desc limit 1');
    query.open;
    codigo_projeto:=query.fieldbyname('codigo_projeto').Asinteger;
  end;
  //Verifica os botoes
  with query do
  begin
    query.close;
    query.SQL.clear;
    query.sql.text:=('select * from tbrequisito where estado="APROVADO" and codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1)');
    query.open;
    if query.IsEmpty then
    begin
      showmessage('Voc� deve ter no m�nimo um requisito com estado "APROVADO"');
      abort;
    end;
    if not query.isempty then
    begin
      with query do
      begin
        query.close;
        query.sql.clear;
        query.sql.text:=('update tbcascata set nivel=5 where codigo_projeto="'+IntToStr(codigo_projeto)+'"');
        query.ExecSQL;
        showmessage('Voc� desbloqueou o n�vel de manuten��o!');
        btnDesbloquearManutencao.visible:=False;
        btnCriarManutencao.enabled:=true;
        btnEditarManutencao.enabled:=true;
        btnListaFinalManutencao.enabled:=true;
      end;
    end;
  end;
end;

end.
