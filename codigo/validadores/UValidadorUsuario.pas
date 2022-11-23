unit UValidadorUsuario;

interface

uses
  UUsuario, System.StrUtils, System.SysUtils;

type
  TvalidadorPessoa = class
  private

  protected

  public
    class procedure Validar(PUsuario: TUsuario; PSenhaConfirmacao: String);
  end;

implementation

{ TvalidadorPessoa }

class procedure TvalidadorPessoa.Validar(PUsuario: TUsuario;
  PSenhaConfirmacao: String);

begin
  // Nome n�o pode ser vazio
  // Nome n�o pode aceita numero
  // CPF � Vazio
  // Login n�o pode ser vazio
  // Quantidade de caracter no login
  // Somente numero no CPF
  // Senha = Confima��o de senha
  // CPF n�o pode ser vazio
  // CPF � valido
  if PUsuario.Login.IsEmpty then
  begin
    raise Exception.Create('O campo Login n�o pode ser vazio');
  end;

  if PUsuario.Senha.IsEmpty then
  begin
    raise Exception.Create('O campo Senha n�o pode ser vazio');
  end;

  if PUsuario.Senha <> PSenhaConfirmacao then
  begin
    raise Exception.Create('A Senha e a Confirma��o devem ser iguais');
  end;

end;

end.
