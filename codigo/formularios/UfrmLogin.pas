unit UfrmLogin; //UfrmAutenticar do professor

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, UfrmAutenticar, Uusuario;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblCliquepararegistrar: TLabel;
    edtLoginUsuario: TEdit;
    edtLoginSenha: TEdit;
    frmAutenticar1: TfrmAutenticar;
    procedure lblCliquepararegistrarClick(Sender: TObject);
    procedure frmAutenticar1spbBotaoFrameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  UfrmCriarConta, UfrmPainelGestao, UusuarioDao, UiniUtils, uFormUtils;

procedure TfrmLogin.frmAutenticar1spbBotaoFrameClick(Sender: TObject);
var
  LUsuarioDAO: TUsuarioDAO;
  LUsuario: TUsuario;
  LLogin: String;
  LSenha: String;
begin
  LusuarioDAO := nil;
  LUsuario := nil;

  LLogin := edtLoginUsuario.Text;
  LSenha := edtLoginSenha.Text;

  if (not LLogin.IsEmpty) and (not LSenha.IsEmpty) then
  begin
    LusuarioDAO := TUsuarioDAO.Create;
    Lusuario := LusuarioDAO.BuscarUsuarioPorLoginSenha(Llogin, LSenha);

    if Assigned(Lusuario) then
    begin
      //Conseguiu logar

      TIniUtils.gravarPropriedade(
        TSECAO.INFORMACOES_GERAIS,
        TPROPRIEDADE.LOGADO, TIniUtils.VALOR_VERDADEIRO);

      if not Assigned(frmPainelGestao) then
      begin
        Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
      end;

      TFormUtils.SetarTelaPrincipal(frmPainelGestao);
      frmPainelGestao.Show;

      Close;
    end
    else
    begin
      ShowMessage('Login e/ou senha inválido');
    end;
  end
  else
  begin
    ShowMessage('Login e senha são obrigatórios');
  end;

  FreeAndNil(LusuarioDAO);
  FreeAndNil(Lusuario);

end;

procedure TfrmLogin.lblCliquepararegistrarClick(Sender: TObject);
begin
  if not Assigned(frmCriarConta) then
  begin
    Application.CreateForm(TfrmCriarConta, frmCriarConta);
  end;

  TFormUtils.SetarTelaPrincipal(frmCriarConta);
  frmCriarConta.Show;

  Close;
end;

end.
