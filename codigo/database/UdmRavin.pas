unit UdmRavin;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs;

type
  TdmRavin = class(TDataModule)
    cnxBancoDeDados: TFDConnection;
    drvBancoDeDados: TFDPhysMySQLDriverLink;
    wtcBancoDeDados: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
    procedure cnxBancoDeDadosBeforeConnect(Sender: TObject);
    procedure cnxBancoDeDadosAfterConnect(Sender: TObject);
  private
    { Private declarations }
    procedure CriarTabelas;
    procedure InserirDados;
  public
    { Public declarations }
  end;

var
  dmRavin: TdmRavin;

implementation

uses
  uResourceUtils, UiniUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmRavin.cnxBancoDeDadosAfterConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
  LcaminhoBAnco: String;
begin
  LcaminhoBAnco := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.CAMINHO_BANCO);
  LCriarBaseDados := not FileExists(LcaminhoBAnco);

  if LCriarBaseDados then
    begin
      CriarTabelas;
      InserirDados;
    end;
end;

procedure TdmRavin.cnxBancoDeDadosBeforeConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
  LcaminhoBAnco: String;
begin
  LcaminhoBAnco := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.CAMINHO_BANCO);
  LCriarBaseDados := not FileExists(LcaminhoBAnco);

  with cnxBancoDeDados do
  begin
    Params.Values['Server'] := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.SERVER);
    Params.Values['User_Name'] := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.USUER_NAME);
    Params.Values['Password'] := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.PASSWORD);
    Params.Values['DriverId'] := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.DRIVER_ID);
    Params.Values['Port'] := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.PORT);

    if not LCriarBaseDados then
      begin
        Params.Values['Database'] := TIniUtils.lerPropriedade(TSECAO.BANCO, TPROPRIEDADE.NAME_DATABASE);
      end;
  end;

end;

procedure TdmRavin.CriarTabelas;
var
  LSqlArquivoScripts: TStringList;
  LCaminhoArquivo: String;
  //COMPONENTE CRIADO EM TELA
  //LQuery: TFDQuery;
begin
  //Método de Classe
  //TResourcesUtils.CarregarAqruivoResource('', '');

  //LSqlArquivoScripts := TStringList.Create;
  //COMO NÃO DEVE SER FEITO
  //LCaminhoArquivo := 'C:\Users\tancleto\Documents\Delphi2Blu2022\' +
  //                   'Delphi-Avancado\database\createTable.sql';
  //LSqlArquivoScripts.LoadFromFile(LCaminhoArquivo);
  //cnxBancoDeDados.ExecSQL(LSqlArquivoScripts.Text);
  //FreeAndNil(LSqlArquivoScripts);


  //COMPONENTE CRIADO EM TELA
  //LQuery := TFDQuery.Create(Self);
  //LQuery.Connection := cnxBancoDeDados;
  //LQuery.SQL.Text := 'SELECT * FROM PESSOAS';

  try
    cnxBancoDeDados.ExecSQL(TResourcesUtils.CarregarArquivoResource
      ('createTable.sql', 'ravin'));
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TdmRavin.DataModuleCreate(Sender: TObject);
begin
  if not cnxBancoDeDados.Connected then
    begin
      cnxBancoDeDados.Connected := true;
    end;
end;

procedure TdmRavin.InserirDados;
var
  LSqlArquivoScripts: TStringList;
  LCaminhoArquivo: String;
begin
  //LSqlArquivoScripts := TStringList.Create;
  //LCaminhoArquivo := 'C:\Users\tancleto\Documents\Delphi2Blu2022\' +
  //                   'Delphi-Avancado\database\inserts.sql';
  //LSqlArquivoScripts.LoadFromFile(LCaminhoArquivo);

  //Trye e pressionar TAB cria automaticamente
  try
    cnxBancoDeDados.StartTransaction;
    cnxBancoDeDados.ExecSQL(TResourcesUtils.CarregarArquivoResource('inserts.sql', 'ravin'));
    cnxBancoDeDados.Commit;
  except
    on E: Exception do Begin
      cnxBancoDeDados.Rollback;
      ShowMessage('Não foi possível concluir o processo!');
    End;
  end;
end;

end.
