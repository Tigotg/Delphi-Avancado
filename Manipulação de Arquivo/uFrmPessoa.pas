unit uFrmPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmManipulacaoArquivos = class(TForm)
    edtCodigo: TEdit;
    edtDtNascimento: TEdit;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnGravarDados: TButton;
    btnLerDados: TButton;
    mmMostrarResultado: TMemo;
    procedure btnGravarDadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLerDadosClick(Sender: TObject);
  private
    FArquivo: TextFile;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManipulacaoArquivos: TfrmManipulacaoArquivos;

implementation

{$R *.dfm}

procedure TfrmManipulacaoArquivos.btnGravarDadosClick(Sender: TObject);
begin
  if (edtCodigo.Text <> '') and
     (edtDtNascimento.Text <> '') and
     (edtNome.Text <> '') then
  begin
    writeln(FArquivo, edtCodigo.Text, '|',
                      edtDtNascimento.Text, '|',
                      edtNome.Text, '|');

    edtCodigo.Clear;
    edtDtNascimento.Clear;
    edtNome.Clear;
  end;
end;

procedure TfrmManipulacaoArquivos.btnLerDadosClick(Sender: TObject);
var
  xCodigo, i, xContador: Integer;
  xDataNascimento: TDate;
  xNome, xLinha: String;
begin
  mmMostrarResultado.Clear;

  Reset(FArquivo);
  try
    xContador := 0;
    //EOF Fim do Arquivo
    //BOF Inicio do Arquivo
    while (not Eof(FArquivo)) do
    begin
      Readln(FArquivo, xLinha);

      xContador := xContador + 1;

      i := pos(',', xLinha);
      xNome := copy(xLinha, 1, i-1);
      delete(xLinha, 1, i);

      i := pos(',', xLinha);
      xDataNascimento := StrToDateDef(copy(xLinha, 1, i-1), 0);
      delete(xLinha, 1, i);

      i := pos(',', xLinha);
      xCodigo := StrToIntDef(copy(xLinha, 1, i-1), 0);


      mmMostrarResultado.Lines.Add('');
      mmMostrarResultado.Lines.Add('');
      mmMostrarResultado.Lines.Add('');
      mmMostrarResultado.Lines.Add('');
      mmMostrarResultado.Lines.Add('');
      mmMostrarResultado.Lines.Add('');
    end;
  finally
    Append(FArquivo);
  end;


end;

procedure TfrmManipulacaoArquivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseFile(FArquivo);
end;

procedure TfrmManipulacaoArquivos.FormShow(Sender: TObject);
begin
  AssignFile(FArquivo, 'Cadastro_Pessoa.txt');
    {$I-}
  Reset(FArquivo);

  if IOResult <> 0 then
    Rewrite(FArquivo)
  else
  begin
    CloseFile(FArquivo);
    Append(FArquivo);
  end;
  {$I+}
end;

end.
