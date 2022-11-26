unit UfrmUsuarios;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections, UusuarioDao, Uusuario;

type
  TfrmListaLogin = class(TForm)
    mmResultado: TMemo;
    btnResult: TButton;
  private
    { Private declarations }
  public
    function ListarUsuarios(PLista: TList<TUsuario>): TList<TUsuario>;
    { Public declarations }
  end;

var
  frmListaLogin: TfrmListaLogin;

implementation

{$R *.dfm}

function TfrmListaLogin.ListarUsuarios(PLista: TList<TUsuario>)
  : TList<TUsuario>;
var
  LUsuario: TUsuario;
  I: Integer;
begin
  for I := 0 to PLista.count - 1 do
  begin
    LUsuario := PLista.Items[I];
    mmResultado.Lines.Add(PLista.Items[I].Login);
  end;
  Result := PLista;
end;

end.
