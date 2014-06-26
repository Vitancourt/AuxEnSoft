unit ModeloCascataExtracaoAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformModeloCascataExtracaoAjuda = class(TForm)
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
  formModeloCascataExtracaoAjuda: TformModeloCascataExtracaoAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataExtracaoAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha o form e libera memória
  FormModeloCascataExtracaoAjuda.Release;
  FormModeloCascataExtracaoAjuda:=Nil;
end;

procedure TformModeloCascataExtracaoAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataExtracaoAjuda.btnVoltarClick(Sender: TObject);
begin
  //Fechar o form
  FormModeloCascataExtracaoAjuda.Close;
end;

end.
