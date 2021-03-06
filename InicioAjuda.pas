unit InicioAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormInicioAjuda = class(TForm)
    BtnVoltar: TBitBtn;
    MemoAjuda: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInicioAjuda: TFormInicioAjuda;

implementation

uses Inicio;

{$R *.dfm}

procedure TFormInicioAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormInicioAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar form
  FormInicioAjuda.close;
  FormInicioAjuda:=Nil;
end;

procedure TFormInicioAjuda.BtnVoltarClick(Sender: TObject);
begin
  //Fechar Form
  FormInicio.show;
  FormInicioAjuda.close;
end;

end.
