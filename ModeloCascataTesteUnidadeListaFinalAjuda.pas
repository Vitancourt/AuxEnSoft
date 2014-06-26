unit ModeloCascataTesteUnidadeListaFinalAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataTesteUnidadeListaFinalAjuda = class(TForm)
    btnVoltar: TBitBtn;
    memoAjuda: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTesteUnidadeListaFinalAjuda: TFormModeloCascataTesteUnidadeListaFinalAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataTesteUnidadeListaFinalAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataTesteUnidadeListaFinalAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera memória
  FormModeloCascataTesteUnidadeListaFinalAjuda.Release;
  FormModeloCascataTesteUnidadeListaFinalAjuda:=Nil;
end;

procedure TFormModeloCascataTesteUnidadeListaFinalAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  FormModeloCascataTesteUnidadeListaFinalAjuda.Close;
end;

end.
