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
    procedure CriarTabelas();
    procedure InserirDados();
  public
    { Public declarations }
  end;

var
  dmRavin: TdmRavin;

implementation

uses
  uResourceUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmRavin.cnxBancoDeDadosAfterConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
begin
  LCriarBaseDados := not FileExists('C:\ProgramData\MySQL\' +
                                    'MySQL Server 8.0\Data\ravin\pessoa.ibd');
  if LCriarBaseDados then
    begin
      CriarTabelas;
      InserirDados;
    end;
end;

procedure TdmRavin.cnxBancoDeDadosBeforeConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
begin
  LCriarBaseDados := not FileExists('C:\ProgramData\MySQL\' +
                                    'MySQL Server 8.0\Data\ravin\pessoa.ibd');
  with cnxBancoDeDados do
  begin
    Params.Values['Server'] := 'localhost';
    Params.Values['User_Name'] := 'root';
    Params.Values['Password'] := 'root';
    Params.Values['DriverId'] := 'MySQL';
    Params.Values['Port'] := '3306';

    if not LCriarBaseDados then
      begin
        Params.Values['Database'] := 'ravin';
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
  //M�todo de Classe
  //TResourcesUtils.CarregarAqruivoResource('', '');

  //LSqlArquivoScripts := TStringList.Create;
  //COMO N�O DEVE SER FEITO
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
      ShowMessage('N�o foi poss�vel concluir o processo!');
    End;
  end;
end;

{
Lista de Exerc�cios de SQL:
1 Qual o produto com o maior pre�o de custo;
2 Qual o produto com o maior pre�o de venda;
3 Qual produto com o menor pre�o de custo;
4 Qual produto com o menor pre�o de venda;
5 A comanda mais recente;
6 A comanda mais velha;
7 A comanda com maior valor (baseado no valor da comanda);
8 As 3 comandas com maior valor ordenadas em ordem crescente;
9 Busque os clientes que s�o aniversariantes do m�s;
10 Mesas sem atendente;
11 Quantos atendentes;
12 Quantidade de comandas dos dois �ltimos anos;
13 O maior valor de comanda (considerando apenas o valor da comanda) dia a dia do m�s atual;
14 O valor de cada comanda (baseado nos itens) juntamente com o item mais caro da comanda;
15 O valor que cada cliente j� gastou no restaurante;
16 Listar o c�digo das mesas juntamente com o nome dos atendentes respons�veis por cada mesa (apenas as mesas que cont�m atendente);
17 Listar as comandas com seus produtos mostrando o c�digo da comanda e o nome do produto;
18 Listar as comandas mostrando o valor total de cada comanda;
19 Buscar a comanda que teve a maior valor, mostrando o c�digo da comanda, o valor da comanda e o nome do atendente respons�vel por aquela comanda;
20 Quantidade de clientes em cada dia;
21 O funcion�rio mais velho que j� fez algum atendimento
22 A comanda com maior valor (valor da Comanda) e que n�o est� paga
23 A comanda com menor valor (valor da Comanda) e que j� est� paga
24 Quantos clientes tem comandas em aberto
25 Quanto cada mesa j� arrecadou
26 Quantidade de clientes que nunca consumiram no restaurante
27 Os cliente que nunca consumiram no restaurante
28 As comandas que est�o em mesas ocupadas (juntamente com seu valor);
29 Os 10 produtos mais vendidos (ultimo m�s)}

end.
