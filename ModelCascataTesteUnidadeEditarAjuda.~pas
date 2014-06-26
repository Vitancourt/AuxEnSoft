unit ModelCascataTesteUnidadeEditarAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormModeloCascataTesteUnidadeEditarAjuda = class(TForm)
    memoAjuda: TMemo;
    btnVoltar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModeloCascataTesteUnidadeEditarAjuda: TFormModeloCascataTesteUnidadeEditarAjuda;

implementation

{$R *.dfm}

procedure TFormModeloCascataTesteUnidadeEditarAjuda.FormCreate(
  Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormModeloCascataTesteUnidadeEditarAjuda.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  //Fecha e libera memoria
  FormModeloCascataTesteUnidadeEditarAjuda.Release;
  FormModeloCascataTesteUnidadeEditarAjuda:=Nil;
end;

procedure TFormModeloCascataTesteUnidadeEditarAjuda.btnVoltarClick(
  Sender: TObject);
begin
  //Fecha o form
  FormModeloCascataTesteUnidadeEditarAjuda.Close;
end;

end.
