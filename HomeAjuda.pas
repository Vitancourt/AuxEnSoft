unit HomeAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormHomeAjuda = class(TForm)
    btnVoltar: TButton;
    MemoAjuda: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHomeAjuda: TFormHomeAjuda;

implementation

{$R *.dfm}

procedure TFormHomeAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormHomeAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar form
  FormHomeAjuda.Release;
  FormHomeAjuda:=Nil;
end;

procedure TFormHomeAjuda.btnVoltarClick(Sender: TObject);
begin
  //Fechar o form
  FormHomeAjuda.Close;
end;

end.
