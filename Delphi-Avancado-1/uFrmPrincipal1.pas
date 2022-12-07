unit uFrmPrincipal1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtNumero: TEdit;
    btnTabuada: TButton;
    procedure btnTabuadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTabuadaClick(Sender: TObject);
var
  //Declarando a variavel 'xArq' do tipo arquivo texto
  xArq: TextFile;
  i, N: Integer;
begin
  try
    //Associa a variavel do programa 'xArq' ao arquivo externo
    //'tabuada.txt na raiz do projeto

    AssignFile(xArq, 'Tabuada.txt');
    //Cria o arquivo 'tabuada.txt' na raiz do projeto

    Rewrite(xArq);

    n := StrToIntDef(edtNumero.Text, 0);

    //Grava uma linha no arquivo
    writeln(xArq, '+--Resultado--+');

    for I := 1 to 10 do
    begin
      //Grava umalinha na tabuada no arquivo
      writeln(xarq, '| ', i, ' x ', n, ' = ', (i*n), ' |');
    end;

    //Grava uma linha no arquivo
    writeln(xArq, '+-------------+');

    ShowMessage('Tabuada gravada com Sucesso');
  Finally
    //Fecha o arquivo texto
    CloseFile(xArq);
  End;
end;

end.
