unit UfrmLogin;

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

uses UfrmCriarConta, UfrmPainelGestao, UusuarioDao, UiniUtils, uFormUtils;

//procedure TfrmLogin.Button1Click(Sender: TObject);
//var
//  LUsuario: TUsuario;
//  LDao: TUsuarioDao;
//begin
//  LUsuario := TUsuario.Create;
//  with LUsuario do
//  begin
//    Login := 'Teste';
//    Senha := '123';
//    PessoaId := 1;
//    CriadoEm := Now();
//    CriadoPor := 'Tiago';
//    AlteradoEm := Now();
//    AlteradoPor := 'Tiago';
//  end;
//  LDao := TUsuarioDao.Create;
//  LDao.InserirUsuario(LUsuario);
//
//  FreeAndNil(LDao);
//  FreeAndNil(LUsuario);
//end;

procedure TfrmLogin.frmAutenticar1spbBotaoFrameClick(Sender: TObject);
var
  LDao: TUsuarioDao;
  LUsuario: TUsuario;

  LLogin: String;
  LSenha: String;

begin
  LDao := TUsuarioDao.Create;

  LLogin := edtLoginUsuario.Text;
  LSenha := edtLoginSenha.Text;

  LUsuario := LDao.BuscarUsuarioPorLoginSenha(LLogin, LSenha);

  if assigned(LUsuario) then
  begin
    //Conseguiu Logar

    TIniUtils.gravarPropriedade(TSecao.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
                                TIniUtils.VALOR_VERDADEIRO);

    if not assigned(frmPainelGestao) then
    begin
      Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
    end;
    TFormUtils.SetarTelaPrincipal(frmPainelGestao);
    frmPainelGestao.Show;

    Close;
  end
  else
  begin
    ShowMessage('Login e/ou Senha Inválidos');
  end;
  FreeAndNil(LDao);
  FreeAndNil(LUsuario);
end;

procedure TfrmLogin.lblCliquepararegistrarClick(Sender: TObject);
begin
  if not assigned(frmCriarConta) then
  begin
    Application.CreateForm(TfrmCriarConta, frmCriarConta);
  end;
  TFormUtils.SetarTelaPrincipal(frmCriarConta);
  frmCriarConta.Show;

  Close;
end;

end.
