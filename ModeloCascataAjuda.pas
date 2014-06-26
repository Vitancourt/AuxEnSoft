unit ModeloCascataAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFormModeloCascataAjuda = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataAjuda: TFormModeloCascataAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar o FormModeloCascataAjuda
  FormModeloCascataAjuda.Release;
  FormModeloCascataAjuda:=Nil;
end;

procedure TFormModeloCascataAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

end.
