unit ModeloCascataListaAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TformModeloCascataListaAjuda = class(TForm)
    btnVoltar: TButton;
    memo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataListaAjuda: TformModeloCascataListaAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataListaAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fecha o form
formModeloCascataListaAjuda.Release;
formModeloCascataListaAjuda:=Nil;
end;

procedure TformModeloCascataListaAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataListaAjuda.btnVoltarClick(Sender: TObject);
begin
  //Fecha o form
  formModeloCascataListaAjuda.close;
end;

end.
