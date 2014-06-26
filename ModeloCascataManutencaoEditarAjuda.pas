unit ModeloCascataManutencaoEditarAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformModeloCascataManutencaoEditarAjuda = class(TForm)
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
  formModeloCascataManutencaoEditarAjuda: TformModeloCascataManutencaoEditarAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataManutencaoEditarAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataManutencaoEditarAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera memória
  formModeloCascataManutencaoEditarAjuda.release;
  formModeloCascataManutencaoEditarAjuda:=NIL;
end;

procedure TformModeloCascataManutencaoEditarAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha
  formModeloCascataManutencaoEditarAjuda.close;
end;

end.
