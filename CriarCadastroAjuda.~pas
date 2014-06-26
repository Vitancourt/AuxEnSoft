unit CriarCadastroAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormCriarCadastroAjuda = class(TForm)
    memoajuda: TMemo;
    btnvoltar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnvoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCriarCadastroAjuda: TFormCriarCadastroAjuda;

implementation

uses CriarCadastro;

{$R *.dfm}

procedure TFormCriarCadastroAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechar form
  FormCriarCadastroAjuda.release;
  FormCriarCadastroAjuda:=nil;
end;

procedure TFormCriarCadastroAjuda.FormCreate(Sender: TObject);
begin
  //Centraliza form
  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

procedure TFormCriarCadastroAjuda.btnvoltarClick(Sender: TObject);
begin
  //Fechar o form
  FormCriarCadastro.show;
  FormCriarCadastroAjuda.close;
end;

end.
