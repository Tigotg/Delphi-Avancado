unit UfrmCriarConta; //UfrmRegistrar do Professor

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmAutenticar, Vcl.StdCtrls,
  Vcl.ExtCtrls, FireDAC.Phys.MySQLWrapper, System.Math, UValidaTipoPessoa;

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
    procedure edtContaCPFChange(Sender: TObject);
    procedure edtContaCPFExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriarConta: TfrmCriarConta;

implementation

{$R *.dfm}

uses UfrmLogin, UUsuario, UUsuarioDao, UValidadorUsuario,
  uFormUtils;//, UValidaTipoPessoa;


procedure TfrmCriarConta.edtContaCPFChange(Sender: TObject);
begin
  if edtContaCPF.Text <> '' then
  if TValidaTipoPessoa.ValidaCNPJ(edtContaCPF.Text) then


  TValidaTipoPessoa.ValidaCNPJ(edtContaCPF.Text);
end;

procedure TfrmCriarConta.edtContaCPFExit(Sender: TObject);
begin
  if edtContaCPF.Text<>'' Then

	if TValidaTipoPessoa.ValidaCNPJ(edtContaCPF.Text) = False Then

	Begin

  	MessageDlg('CPF informado é incorreto!',mtError, [mbOk],0);

  	edtContaCPF.SetFocus;

	End;
//
//* Troque NOMECAMPO pela propriedade Name do campo.
end;

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

    edtContaLoginUsuario.Clear;
    edtContaLoginSenha.Clear;
    edtContaLogin.Clear;
    edtContaCPF.Clear;
    edtContaConfSenha.Clear;
    edtContaLoginUsuario.SetFocus;
  end;
end;

procedure TfrmCriarConta.lblCliquepararegistrarClick(Sender: TObject);
begin
  if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;
  TFormUtils.SetarTelaPrincipal(frmLogin);
  frmLogin.Show;

  Close;
end;

end.
