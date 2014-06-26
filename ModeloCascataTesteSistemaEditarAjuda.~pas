unit ModeloCascataTesteSistemaEditarAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformModeloCascataTesteSistemaEditarAjuda = class(TForm)
    MemoAjuda: TMemo;
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
  formModeloCascataTesteSistemaEditarAjuda: TformModeloCascataTesteSistemaEditarAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataTesteSistemaEditarAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataTesteSistemaEditarAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fechar e liberar mem
  formModeloCascataTesteSistemaEditarAjuda.Release;
  formModeloCascataTesteSistemaEditarAjuda:=Nil;
end;

procedure TformModeloCascataTesteSistemaEditarAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  formModeloCascataTesteSistemaEditarAjuda.Close;
end;

end.
