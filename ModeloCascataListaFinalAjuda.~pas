unit ModeloCascataListaFinalAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataListaFinalAjuda = class(TForm)
    MemoAjuda: TMemo;
    btnVoltar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataListaFinalAjuda: TFormModeloCascataListaFinalAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataListaFinalAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha e libera memória
  FormModeloCascataListaFinalAjuda.Release;
  FormModeloCascataListaFinalAjuda:=Nil;
end;

procedure TFormModeloCascataListaFinalAjuda.FormCreate(Sender: TObject);
begin
 //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataListaFinalAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fechar
  FormModeloCascataListaFinalAjuda.Close;
end;

end.
