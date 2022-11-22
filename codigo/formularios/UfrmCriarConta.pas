unit UfrmCriarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmAutenticar, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmCriarConta = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlCliquepararegistrar: TLabel;
    edtContaLoginUsuario: TEdit;
    edtContaLoginSenha: TEdit;
    Panel3: TPanel;
    edtContaLogin: TEdit;
    edtContaCPF: TEdit;
    edtContaConfSenha: TEdit;
    frmAutenticar1: TfrmAutenticar;
    procedure pnlCliquepararegistrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetarFormularioLogin(PFromularioLogin: TForm);
  public
    { Public declarations }
  end;

var
  frmCriarConta: TfrmCriarConta;

implementation

{$R *.dfm}

uses UfrmLogin;

procedure TfrmCriarConta.pnlCliquepararegistrarClick(Sender: TObject);
begin
  if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;
  SetarFormularioLogin(frmLogin);
  frmLogin.Show;

  Close;
end;
procedure TfrmCriarConta.SetarFormularioLogin(PFromularioLogin: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PFromularioLogin;
end;

end.
