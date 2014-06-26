unit ModeloCascataManutencaoListaFinalAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TformModeloCascataManutencaoListaFinalAjuda = class(TForm)
    btnVoltar: TButton;
    memoAjuda: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formModeloCascataManutencaoListaFinalAjuda: TformModeloCascataManutencaoListaFinalAjuda;

implementation

{$R *.dfm}

procedure TformModeloCascataManutencaoListaFinalAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TformModeloCascataManutencaoListaFinalAjuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
formModeloCascataManutencaoListaFinalAjuda.release;
formModeloCascataManutencaoListaFinalAjuda:=nil;
end;

procedure TformModeloCascataManutencaoListaFinalAjuda.btnVoltarClick(
  Sender: TObject);
begin
formModeloCascataManutencaoListaFinalAjuda.close;
end;

end.
