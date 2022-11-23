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
  // Nome não pode ser vazio
  // Nome não pode aceita numero
  // CPF é Vazio
  // Login não pode ser vazio
  // Quantidade de caracter no login
  // Somente numero no CPF
  // Senha = Confimação de senha
  // CPF não pode ser vazio
  // CPF é valido
  if PUsuario.Login.IsEmpty then
  begin
    raise Exception.Create('O campo Login não pode ser vazio');
  end;

  if PUsuario.Senha.IsEmpty then
  begin
    raise Exception.Create('O campo Senha não pode ser vazio');
  end;

  if PUsuario.Senha <> PSenhaConfirmacao then
  begin
    raise Exception.Create('A Senha e a Confirmação devem ser iguais');
  end;

end;

end.
