unit UiniUtils;

interface

uses
  System.IOUtils,

  Vcl.Forms,

  TypInfo,
  IniFiles;

type
  TSECAO = (CONFIGURACOES, INFORMACOES_GERAIS, DATABASE);

type
  TPROPRIEDADE = (NOME_DATABASE, LOGADO);// incluir os campos do login

type
  TIniUtils = class
  private

  protected

  public
    constructor Create;
    destructor Destroy; override;

    class procedure gravarPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE; PValor: String);
    class function lerPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE): String;

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
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao: String;
  LNomePropriedade: String;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);

  LNomeSecao := GetEnumName(
    TypeInfo(TSECAO), Integer(PSecao));

  LNomePropriedade := GetEnumName(
    TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  LarquivoINI.WriteString(LNomeSecao, LNomePropriedade, Pvalor);
  LarquivoINI.Free;
end;

class function TIniUtils.lerPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE): String;
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao : String;
  LNomePropriedade : String;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);

    LNomeSecao := GetEnumName(
    TypeInfo(TSECAO), Integer(PSecao));

  LNomePropriedade := GetEnumName(
    TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  Result := LarquivoINI.ReadString(LNomeSecao, LNomePropriedade, '');
  LarquivoINI.Free;
end;

end.