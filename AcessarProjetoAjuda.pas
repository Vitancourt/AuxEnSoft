unit AcessarProjetoAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormAcessarProjetoAjuda = class(TForm)
    Memo: TMemo;
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
  FormAcessarProjetoAjuda: TFormAcessarProjetoAjuda;

implementation

{$R *.dfm}

procedure TFormAcessarProjetoAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar o form e liberar mem�ria
  FormAcessarProjetoAjuda.Release;
  FormAcessarProjetoAjuda:=Nil;
end;

procedure TFormAcessarProjetoAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormAcessarProjetoAjuda.btnVoltarClick(Sender: TObject);
begin
  //Fechar o formAcessarAjuda
  FormAcessarProjetoAjuda.Close;
end;

end.
