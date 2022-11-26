unit UusuarioDao;

// DAO = DATA ACCESS OBJECT

interface

uses
  Uusuario, FireDAC.Comp.Client, SysUtils, System.Generics.Collections;

type
  TUsuarioDao = class
  private

  protected

  public
    function BuscarUsuarioPorLoginSenha(PLogin: String; PSenha: String)
      : TUsuario;
    function BuscarTodosUsuarios: TList<TUsuario>;
    procedure InserirUsuario(PUsuario: TUsuario);
  end;

implementation

{ TUsuario }

uses UdmRavin;

function TUsuarioDao.BuscarTodosUsuarios: TList<TUsuario>;
var
  LLista: TList<TUsuario>;

  LU1, LU2, LU3: TUsuario;
  I: Integer;
  LusuarioTemp: TUsuario;
  LQuery: TFDQuery;
begin

  LU1 := TUsuario.Create();
  LU1.id := 1;
  LU1.login := 'Marcio';
  LU1.senha := '123';

  LU2 := TUsuario.Create();
  LU2.id := 2;
  LU2.login := 'Pedro';
  LU2.senha := '222';

  LU3 := TUsuario.Create();
  LU3.id := 3;
  LU3.login := 'Joana';
  LU3.senha := '456';

  LLista := TList<TUsuario>.Create();

  LLista.Add(LU1);
  LLista.Add(LU2);
  LLista.Add(LU3);

  LLista.Remove(LU1);
  LLista.Contains(LU3);
  LLista.IndexOf(LU2);
  LLista.Items[2] := LU2;

  for I := 0 to LLista.Count - 1 do
  begin
    LusuarioTemp := LLista.Items[I];
    LusuarioTemp.login := '';
  end;

  // Setar as informações da query e buscar os dados do banco
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'SELECT * FROM USUARIO';
  LQuery.Open;
  LQuery.First;

  // Mapear os dados carregado para objeto
  while not LQuery.Eof do
  begin
    LusuarioTemp := TUsuario.Create();
    LusuarioTemp.id := LQuery.FieldByName('ID').AsInteger;
    LusuarioTemp.login := LQuery.FieldByName('LOGIN').AsString;
    LusuarioTemp.senha := LQuery.FieldByName('SENHA').AsString;
    LusuarioTemp.PessoaId := LQuery.FieldByName('PESSOAID').AsInteger;
    LusuarioTemp.CriadoEm := LQuery.FieldByName('CRIADOEM').AsDateTime;
    LusuarioTemp.CriadoPor := LQuery.FieldByName('CRIADOPOR').AsString;
    LusuarioTemp.AlteradoEm := LQuery.FieldByName('ALTERADOEM').AsDateTime;
    LusuarioTemp.AlteradoPor := LQuery.FieldByName('ALTERADOPOR').AsString;

    LLista.Add(LusuarioTemp);
    LQuery.Next;
  end;
  Result := LLista;
  FreeAndNil(LQuery);
end;

function TUsuarioDao.BuscarUsuarioPorLoginSenha(PLogin, PSenha: String)
  : TUsuario;
var
  LQuery: TFDQuery;
  LUsuario: TUsuario;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text :=
    'SELECT * FROM USUARIO WHERE LOGIN = :LOGIN AND SENHA = :SENHA';
  LQuery.ParamByName('LOGIN').AsString := PLogin;
  LQuery.ParamByName('SENHA').AsString := PSenha;
  LQuery.Open;

  LUsuario := nil;

  if not LQuery.IsEmpty then
  Begin
    // Achou Algum registro
    LUsuario := TUsuario.Create();
    LUsuario.id := LQuery.FieldByName('ID').AsInteger;
    LUsuario.login := LQuery.FieldByName('LOGIN').AsString;
    LUsuario.senha := LQuery.FieldByName('SENHA').AsString;
    LUsuario.PessoaId := LQuery.FieldByName('PESSOAID').AsInteger;
    LUsuario.CriadoEm := LQuery.FieldByName('CRIADOEM').AsDateTime;
    LUsuario.CriadoPor := LQuery.FieldByName('CRIADOPOR').AsString;
    LUsuario.AlteradoEm := LQuery.FieldByName('ALTERADOEM').AsDateTime;
    LUsuario.AlteradoPor := LQuery.FieldByName('ALTERADOPOR').AsString;
  End;

  LQuery.Close;
  FreeAndNil(LQuery);
  Result := LUsuario;
end;

procedure TUsuarioDao.InserirUsuario(PUsuario: TUsuario);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  with LQuery do
  Begin
    Connection := dmRavin.cnxBancoDeDados;
    SQL.Add('INSERT INTO USUARIO (LOGIN, SENHA, PESSOAID, CRIADOEM, CRIADOPOR, ALTERADOEM, ALTERADOPOR)');
    SQL.Add('VALUES (:LOGIN, :SENHA, :PESSOAID, :CRIADOEM, :CRIADOPOR, :ALTERADOEM, :ALTERADOPOR)');

    ParamByName('LOGIN').AsString := PUsuario.login;
    ParamByName('SENHA').AsString := PUsuario.senha;
    ParamByName('PESSOAID').AsInteger := PUsuario.PessoaId;
    ParamByName('CRIADOEM').AsDateTime := PUsuario.CriadoEm;
    ParamByName('CRIADOPOR').AsString := PUsuario.CriadoPor;
    ParamByName('ALTERADOEM').AsDateTime := PUsuario.AlteradoEm;
    ParamByName('ALTERADOPOR').AsString := PUsuario.AlteradoPor;
    ExecSQL;
  end;

  FreeAndNil(LQuery);
end;

end.
