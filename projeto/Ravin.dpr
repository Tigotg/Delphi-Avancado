program Ravin;

uses
  Vcl.Forms,
  UfrmCartaoPainelGestao in '..\codigo\frames\UfrmCartaoPainelGestao.pas' {frmCartaoPainelControle: TFrame},
  UfrmLogomarca in '..\codigo\frames\UfrmLogomarca.pas' {frmLogo: TFrame},
  UfrmItemMenu in '..\codigo\frames\UfrmItemMenu.pas' {frmMenuItem: TFrame},
  UdmRavin in '..\codigo\database\UdmRavin.pas' {dmRavin: TDataModule},
  UfrmSplash in '..\codigo\formularios\UfrmSplash.pas' {frmSplash},
  UfrmMesas in '..\codigo\formularios\UfrmMesas.pas' {frmMesas},
  UfrmSobre in '..\codigo\formularios\UfrmSobre.pas' {frmSobre},
  UfrmProdutos in '..\codigo\formularios\UfrmProdutos.pas' {frmProdutos},
  UfrmPainelGestao in '..\codigo\formularios\UfrmPainelGestao.pas' {frmPainelGestao},
  UfrmComandas in '..\codigo\formularios\UfrmComandas.pas' {frmComandas},
  uResourceUtils in '..\codigo\utils\uResourceUtils.pas',
  UfrmLogin in '..\codigo\formularios\UfrmLogin.pas' {frmLogin},
  UfrmAutenticar in '..\codigo\frames\UfrmAutenticar.pas' {frmAutenticar: TFrame},
  UfrmCriarConta in '..\codigo\formularios\UfrmCriarConta.pas' {frmCriarConta},
  Uusuario in '..\codigo\Modelos\Uusuario.pas',
  UusuarioDao in '..\codigo\dao\UusuarioDao.pas',
  UValidadorUsuario in '..\codigo\validadores\UValidadorUsuario.pas',
  UiniUtils in '..\codigo\utils\UiniUtils.pas',
  UfrmUsuarios in '..\codigo\formularios\UfrmUsuarios.pas' {frmListaLogin},
  uFormUtils in '..\codigo\utils\uFormUtils.pas',
  uValidaTipoPessoa in '..\codigo\validadores\uValidaTipoPessoa.pas',
  UfrmBotaoCancelar in '..\codigo\frames\UfrmBotaoCancelar.pas' {frmBotaoCancelar: TFrame},
  UfrmBotaoExcluir in '..\codigo\frames\UfrmBotaoExcluir.pas' {frmBotaoExcluir: TFrame},
  UfrmBotaoPrimario in '..\codigo\frames\UfrmBotaoPrimario.pas' {frmBotaoPrimario: TFrame},
  UfrmBotaoSecundario in '..\codigo\frames\UfrmBotaoSecundario.pas' {frmBotaoSecundario: TFrame},
  UfrmCadastroCliente in '..\codigo\formularios\UfrmCadastroCliente.pas' {frmCadastroCliente},
  UfrmListaClientes in '..\codigo\formularios\UfrmListaClientes.pas' {frmListaClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TdmRavin, dmRavin);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
