unit UusuarioDao;

//DAO = DATA ACCESS OBJECT

interface

uses
  Uusuario, FireDAC.Comp.Client, SysUtils;

type TUsuarioDao = class
  private

  protected

  public
  function BuscarUsuarioPorLoginSenha(PLogin: String; PSenha: String): TUsuario;

  procedure InserirUsuario(PUsuario: TUsuario);
end;

implementation

{ TUsuario }

uses UdmRavin;

function TUsuarioDao.BuscarUsuarioPorLoginSenha(PLogin, PSenha: String): TUsuario;
var
  LQuery : TFDQuery;
  LUsuario : TUsuario;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'SELECT * FROM USUARIO WHERE LOGIN = :LOGIN AND SENHA = :SENHA';
  LQuery.ParamByName('LOGIN').AsString := PLogin;
  Lquery.ParamByName('SENHA').AsString := PSenha;
  LQuery.Open;

  LUsuario := nil;

  if not LQuery.IsEmpty then
  Begin
    //Achou Algum registro
    LUsuario := TUsuario.Create();
    LUsuario.Id := Lquery.FieldByName('ID').AsInteger;
    LUsuario.Login := LQuery.FieldByName('LOGIN').AsString;
    LUsuario.Senha := Lquery.FieldByName('SENHA').AsString;
    LUsuario.PessoaId := LQuery.FieldByName('PESSOAID').AsInteger;
    LUsuario.CriadoEm := LQuery.FieldByName('CRIADOEM').AsDateTime;
    LUsuario.CriadoPor := Lquery.FieldByName('CRIADOPOR').AsString;
    LUsuario.AlteradoEm := LQuery.FieldByName('ALTERADOEM').AsDateTime;
    LUsuario.AlteradoPor := Lquery.FieldByName('ALTERADOPOR').AsString;
  End;

  LQuery.Close;
  FreeAndNil(Lquery);
  Result := LUsuario;
end;

procedure TUsuarioDao.InserirUsuario(PUsuario: TUsuario);
var
  LQuery: TFDQuery;
begin
  Lquery := TFDQuery.Create(nil);
  with LQuery do
  Begin
  Connection := dmRavin.cnxBancoDeDados;
  SQL.Add('INSERT INTO USUARIO (LOGIN, SENHA, PESSOAID, CRIADOEM, CRIADOPOR, ALTERADOEM, ALTERADOPOR)');
  SQL.Add('VALUES (:LOGIN, :SENHA, :PESSOAID, :CRIADOEM, :CRIADOPOR, :ALTERADOEM, :ALTERADOPOR)');

  ParamByName('LOGIN').AsString := PUsuario.Login;
  ParamByName('SENHA').AsString := PUsuario.Senha;
  ParamByName('PESSOAID').AsInteger := PUsuario.PessoaId;
  ParamByName('CRIADOEM').AsDateTime := PUsuario.CriadoEm;
  ParamByName('CRIADOPOR').AsString := PUsuario.CriadoPor;
  ParamByName('ALTERADOEM').AsDateTime := PUsuario.AlteradoEm;
  ParamByName('ALTERADOPOR').AsString := PUsuario.AlteradoPor;
  ExecSQL;
  end;

  FreeAndNil(Lquery);
end;

end.
