unit ModeloCascataTesteSistemaListaFinalAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformModeloCascataTesteSistemaListaFinalAjuda = class(TForm)
    memoAjuda: TMemo;
    btnVoltar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataTesteSistemaListaFinalAjuda: TformModeloCascataTesteSistemaListaFinalAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataTesteSistemaListaFinalAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataTesteSistemaListaFinalAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera memória
  formModeloCascataTesteSistemaListaFinalAjuda.release;
  formModeloCascataTesteSistemaListaFinalAjuda:=nil;
end;

procedure TformModeloCascataTesteSistemaListaFinalAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  formModeloCascataTesteSistemaListaFinalAjuda.close;
end;

end.
