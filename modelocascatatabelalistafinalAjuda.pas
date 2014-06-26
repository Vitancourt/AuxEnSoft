unit modelocascatatabelalistafinalAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormModeloCascataTabelaListaFinalAjuda = class(TForm)
    btnVoltar: TButton;
    memoajuda: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTabelaListaFinalAjuda: TFormModeloCascataTabelaListaFinalAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataTabelaListaFinalAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
FormModeloCascataTabelaListaFinalAjuda.release;
FormModeloCascataTabelaListaFinalAjuda:=nil;
end;

procedure TFormModeloCascataTabelaListaFinalAjuda.FormCreate(
  Sender: TObject);
begin
 //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataTabelaListaFinalAjuda.btnVoltarClick(
  Sender: TObject);
begin
FormModeloCascataTabelaListaFinalAjuda.close;
end;

end.
