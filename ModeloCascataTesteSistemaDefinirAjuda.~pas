unit ModeloCascataTesteSistemaDefinirAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformModeloCascataTesteSistemaDefinirAjuda = class(TForm)
    btnVoltar: TBitBtn;
    MemoAjuda: TMemo;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataTesteSistemaDefinirAjuda: TformModeloCascataTesteSistemaDefinirAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataTesteSistemaDefinirAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  formModeloCascataTesteSistemaDefinirAjuda.Close;
end;

procedure TformModeloCascataTesteSistemaDefinirAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e liberar mem
  formModeloCascataTesteSistemaDefinirAjuda.release;
  formModeloCascataTesteSistemaDefinirAjuda:=nil;
end;

procedure TformModeloCascataTesteSistemaDefinirAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

end.
