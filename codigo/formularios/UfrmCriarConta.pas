unit UfrmCriarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmAutenticar, Vcl.StdCtrls,
  Vcl.ExtCtrls, FireDAC.Phys.MySQLWrapper;

type
  TfrmCriarConta = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblCliquepararegistrar: TLabel;
    edtContaLoginUsuario: TEdit;
    edtContaLoginSenha: TEdit;
    Panel3: TPanel;
    edtContaLogin: TEdit;
    edtContaCPF: TEdit;
    edtContaConfSenha: TEdit;
    frmAutenticar1: TfrmAutenticar;
    procedure lblCliquepararegistrarClick(Sender: TObject);
    procedure frmAutenticar1spbBotaoFrameClick(Sender: TObject);
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

uses UfrmLogin, Uusuario, UusuarioDao, UValidadorUsuario;

procedure TfrmCriarConta.frmAutenticar1spbBotaoFrameClick(Sender: TObject);
var
  LUsuario: TUsuario;
  Ldao: TUsuarioDao;
begin
  try
    try
      // REGISTRAR
      // Ler os valores
      // Criar o objeto de usuário
      // Setar valores
      // Criar um DAO
      // Chamar o método para salvar o usuário
      LUsuario := TUsuario.Create;
      LUsuario.Login := edtContaLoginUsuario.Text;
      LUsuario.Senha := edtContaLoginSenha.Text;
      LUsuario.PessoaId := 1;
      LUsuario.CriadoEm := Now;
      LUsuario.CriadoPor := 'Admin';
      LUsuario.AlteradoEm := Now;
      LUsuario.AlteradoPor := 'Admin';

      TValidadorPessoa.Validar(LUsuario, edtContaConfSenha.Text);

      Ldao := TUsuarioDao.Create;
      Ldao.InserirUsuario(LUsuario);
    except
      on E: EMySQLNativeException do
      begin
        ShowMessage('Erro ao inserir o usuário no Banco')
      end;
      on E: Exception do
      begin
        ShowMessage('E.Message');
      end;
    end;
  finally
    if Assigned(Ldao) then
    begin
      FreeAndNil(Ldao);
    end;

    FreeAndNil(LUsuario);
  end;
end;

procedure TfrmCriarConta.lblCliquepararegistrarClick(Sender: TObject);
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
