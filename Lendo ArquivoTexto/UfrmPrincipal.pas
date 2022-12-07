unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mmResultadoLeitura: TMemo;
    btnLerArquivo: TButton;
    edtInformeArquivo: TEdit;
    Label1: TLabel;
    procedure btnLerArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnLerArquivoClick(Sender: TObject);
var
  xArq: TextFile;
  xLinha: String;
begin
  mmResultadoLeitura.Clear;
  try
    AssignFile(xArq, edtInformeArquivo.Text);

    {$I-}//Desativa a diretiva de Input

    //Abre o arquivo para a leitura
    Reset(xArq);

    if IOResult <> 0 then
      raise Exception.Create('Erro na abertura do Arquivo !!!');

    {$I+}//Ativa a diretiva de Input

    //Verifica se o Arquivo atingiu a marca de final de arquivo
    while (not eof(xArq)) do
    begin
      //Lê uma linha do arquivo
      Readln(xArq, xLinha);

      mmResultadoLeitura.Lines.Add(xLinha);
    end;
  finally
    CloseFile(xArq);
  end;
end;

end.
