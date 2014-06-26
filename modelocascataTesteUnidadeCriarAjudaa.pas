unit modelocascataTesteUnidadeCriarAjudaa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormModeloCascataTesteUnidadeCriarAjudaa = class(TForm)
    memoAjuda: TMemo;
    btnVoltar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTesteUnidadeCriarAjudaa: TFormModeloCascataTesteUnidadeCriarAjudaa;

implementation

{$R *.dfm}

procedure TFormModeloCascataTesteUnidadeCriarAjudaa.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataTesteUnidadeCriarAjudaa.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
FormModeloCascataTesteUnidadeCriarAjudaa.release;
FormModeloCascataTesteUnidadeCriarAjudaa:=nil
end;

procedure TFormModeloCascataTesteUnidadeCriarAjudaa.btnVoltarClick(
  Sender: TObject);
begin
FormModeloCascataTesteUnidadeCriarAjudaa.close;
end;

end.
