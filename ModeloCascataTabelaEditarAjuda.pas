unit ModeloCascataTabelaEditarAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataTabelaEditarAjuda = class(TForm)
    MemOAjuda: TMemo;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTabelaEditarAjuda: TFormModeloCascataTabelaEditarAjuda;

implementation

uses ModeloCascataTabelaEditar;

{$R *.dfm}


procedure TFormModeloCascataTabelaEditarAjuda.FormCreate(Sender: TObject);
begin
 //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;



procedure TFormModeloCascataTabelaEditarAjuda.btnFecharClick(
  Sender: TObject);
begin
FormModeloCascataTabelaEditarAjuda.close;
end;

procedure TFormModeloCascataTabelaEditarAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormModeloCascataTabelaEditarAjuda.release;
  FormModeloCascataTabelaEditarAjuda:=nil;
end;

end.
