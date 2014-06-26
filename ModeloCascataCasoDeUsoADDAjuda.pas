unit ModeloCascataCasoDeUsoADDAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataCasoDeUsoADDAjuda = class(TForm)
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
  FormModeloCascataCasoDeUsoADDAjuda: TFormModeloCascataCasoDeUsoADDAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataCasoDeUsoADDAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataCasoDeUsoADDAjuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fecha o form e libera memoria
  FormModeloCascataCasoDeUsoADDAjuda.Release;
  FormModeloCascataCasoDeUsoADDAjuda:=Nil;
end;

procedure TFormModeloCascataCasoDeUsoADDAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha o Form
  FormModeloCascataCasoDeUsoADDAjuda.Close;
end;

end.
