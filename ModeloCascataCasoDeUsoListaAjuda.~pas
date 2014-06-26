unit ModeloCascataCasoDeUsoListaAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataCasoDeUsoListaAjuda = class(TForm)
    memoajuda: TMemo;
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
  FormModeloCascataCasoDeUsoListaAjuda: TFormModeloCascataCasoDeUsoListaAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataCasoDeUsoListaAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataCasoDeUsoListaAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha e libera memória
  FormModeloCascataCasoDeUsoListaAjuda.Release;
  FormModeloCascataCasoDeUsoListaAjuda:=Nil;
end;

procedure TFormModeloCascataCasoDeUsoListaAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha form
  FormModeloCascataCasoDeUsoListaAjuda.Close;
end;

end.
