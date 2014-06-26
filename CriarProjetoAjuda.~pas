unit CriarProjetoAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormCriarProjetoAjuda = class(TForm)
    btnVoltar: TBitBtn;
    Memo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCriarProjetoAjuda: TFormCriarProjetoAjuda;

implementation

{$R *.dfm}

procedure TFormCriarProjetoAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar o form
  FormCriarProjetoAjuda.Release;
  FormCriarProjetoAjuda:=Nil;
end;

procedure TFormCriarProjetoAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormCriarProjetoAjuda.btnVoltarClick(Sender: TObject);
begin
  //Fechar o form
  FormCriarProjetoAjuda.close;
end;


end.
