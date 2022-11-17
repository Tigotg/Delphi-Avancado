unit uResourceUtils;

interface

uses System.SysUtils, System.IOUtils, System.Classes;

type TResourcesUtils = class(TObject)
  private

  protected

  public
    //esse tipo de clase n�o pode interagir com os atributos ou property da classe.
    //e em outra UNIT pode ser utilizado sem precisar inst�nciar
    //M�todo de Classe
    class function CarregarArquivoResource(PNomeArquivo: String; PNomeAplicacao: String): String;
end;

implementation

{ TResourcesUtils }

class function TResourcesUtils.CarregarArquivoResource(PNomeArquivo,
  PNomeAplicacao: String): String;
var
  LConteudoArquivo: TStringList;
  LCaminhoArquivo: String;
  LCaminhoPastaAplicacao: String;
  LConteudoTexto: String;
begin
  LConteudoArquivo := TStringList.Create;
  LConteudoTexto := '';
  try
    try
      LCaminhoPastaAplicacao := TPath.Combine(Tpath.GetDocumentsPath, PNomeAplicacao);
      LCaminhoArquivo := Tpath.Combine(LCaminhoPastaAplicacao, PNomeArquivo);

      LConteudoArquivo.LoadFromFile(LCaminhoArquivo);
      LConteudoTexto := LConteudoArquivo.Text;
    except
      on E: Exception do
        raise Exception.Create('Erro ao carregar os arquivos de resource.' +
                               'Arquivo: ' + PNomeArquivo);
    end;
  finally
    LConteudoArquivo.Free;
  end;

  Result := LConteudoTexto;
end;

end.
