unit UiniUtils;

interface

uses
  System.IOUtils,

  Vcl.Forms,

  TypInfo,
  IniFiles;

type
  TSECAO = (CONFIGURACOES, INFORMACOES_GERAIS, BANCO);

type
  TPROPRIEDADE = (LOGADO, SERVER, USUER_NAME, PASSWORD, DRIVER_ID, PORT, CAMINHO_BANCO, NAME_DATABASE);// incluir os campos do login

type
  TIniUtils = class
  private

  protected

  public
    constructor Create;
    destructor Destroy; override;

    class procedure gravarPropriedade(PSecao: TSECAO; PPropriedade: TPROPRIEDADE; PValor: String);
    class function lerPropriedade(PSecao: TSECAO; PPropriedade: TPROPRIEDADE): String;

    const VALOR_VERDADEIRO : String = 'True';
    const VALOR_FALSO : String = 'False';
  end;

implementation

{ TIniUltis }

constructor TIniUtils.Create;
begin
  inherited;

end;

destructor TIniUtils.Destroy;
begin

  inherited;
end;

class procedure TIniUtils.gravarPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE; PValor: String);
var
  LCaminhoArquivoIni: String;
  LArquivoINI: TIniFile;
  LNomeSecao: String;
  LNomePropriedade: String;
begin
  LCaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LArquivoINI := TIniFile.Create(LCaminhoArquivoIni);

  LNomeSecao := GetEnumName(TypeInfo(TSECAO), Integer(PSecao));
  LNomePropriedade := GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  LArquivoINI.WriteString(LNomeSecao, LNomePropriedade, PValor);

  LArquivoINI.Free;
end;

class function TIniUtils.lerPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE): String;
var
  LCaminhoArquivoIni: String;
  LArquivoINI: TIniFile;
  LNomeSecao : String;
  LNomePropriedade : String;
begin
  LCaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LArquivoINI := TIniFile.Create(LCaminhoArquivoIni);

    LNomeSecao := GetEnumName(
    TypeInfo(TSECAO), Integer(PSecao));

  LNomePropriedade := GetEnumName(
    TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  Result := LArquivoINI.ReadString(LNomeSecao, LNomePropriedade, '');
  LArquivoINI.Free;
end;

end.