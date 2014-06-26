unit modelocascatacasodeusolistafinalAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TformModeloCascataCasoDeUsoListaFinalAjuda = class(TForm)
    memoAjuda: TMemo;
    btnVoltar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataCasoDeUsoListaFinalAjuda: TformModeloCascataCasoDeUsoListaFinalAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataCasoDeUsoListaFinalAjuda.FormCreate(
  Sender: TObject);
begin
//Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataCasoDeUsoListaFinalAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  formModeloCascataCasoDeUsoListaFinalAjuda.release;
  formModeloCascataCasoDeUsoListaFinalAjuda:=nil;
end;

procedure TformModeloCascataCasoDeUsoListaFinalAjuda.btnVoltarClick(
  Sender: TObject);
begin
  formModeloCascataCasoDeUsoListaFinalAjuda.close;
end;

end.
