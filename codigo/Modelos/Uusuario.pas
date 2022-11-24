unit Uusuario;

interface

type TUsuario = class
  private
    FId: Integer;
    FLogin: String;
    FSenha: String;
    FPessoaId: Integer;
    FCriadoEm: TdateTime;

    FCriadoPor: String;
    FAlteradoEm: TDateTime;
    FAlteradoPor: String;

  protected

  public
  //propf + Tab = Cria a property
  property Id: Integer read FId write FId;
  property Login: String read FLogin write FLogin;
  property Senha: String read FSenha write FSenha;
  property PessoaId: Integer read FPessoaId write FPessoaId;
  property CriadoEm: TdateTime read FCriadoEm write FCriadoEm;
  property CriadoPor: String read FCriadoPor write FCriadoPor;
  property AlteradoEm: TDateTime read FAlteradoEm write FAlteradoEm;
  property AlteradoPor: String read FAlteradoPor write FAlteradoPor;
end;

implementation

end.
