program ManipulacaoArquivoTXT;

uses
  Vcl.Forms,
  uFrmPessoa in 'uFrmPessoa.pas' {frmManipulacaoArquivos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmManipulacaoArquivos, frmManipulacaoArquivos);
  Application.Run;
end.
