unit ModeloCascataDefinicaoRequisitoAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataDefinicaoRequisitoAjuda = class(TForm)
    Memo1: TMemo;
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
  FormModeloCascataDefinicaoRequisitoAjuda: TFormModeloCascataDefinicaoRequisitoAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataDefinicaoRequisitoAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha o form e libera memória
  FormModeloCascataDefinicaoRequisitoAjuda.Release;
  FormModeloCascataDefinicaoRequisitoAjuda:=Nil;
end;

procedure TFormModeloCascataDefinicaoRequisitoAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataDefinicaoRequisitoAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataDefinicaoRequisitoAjuda.close;
end;

end.
