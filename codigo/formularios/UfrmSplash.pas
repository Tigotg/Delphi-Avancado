unit UfrmSplash;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,

  UfrmLogomarca, uFormUtils;

type
  TfrmSplash = class(TForm)
    pnlFundo: TPanel;
    tmrSplash: TTimer;
    frmLogo: TfrmLogo;
    procedure tmrSplashTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Inicialized: Boolean;
    procedure InicializarAplicacao;
    procedure ShowPainelGestao;
    procedure ShowLogin;
    //procedure SetarFormPrincipal(NewMainForm: TForm);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UfrmLogin, UiniUtils;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Inicialized := false;
  tmrSplash.Enabled := false;
  tmrSplash.Interval := 1000;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  tmrSplash.Enabled := not Inicialized;
end;

procedure TfrmSplash.InicializarAplicacao;
var
  LLogado: String;
begin
  LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGADO);

  if LLogado = TIniUtils.VALOR_VERDADEIRO then
  begin
    ShowPainelGestao;
  end
  else
  begin
    ShowLogin;
  end;
end;

procedure TfrmSplash.tmrSplashTimer(Sender: TObject);
begin
  tmrSplash.Enabled := false;
  if not Inicialized then
  begin
    Inicialized := true;
    InicializarAplicacao;
  end;
end;

//procedure TfrmSplash.SetarFormPrincipal(NewMainForm: TForm);
//var
//  tmpMain: ^TCustomForm;
//begin
//  tmpMain := @Application.Mainform;
//  tmpMain^ := NewMainForm;
//end;

procedure TfrmSplash.ShowLogin;
begin
  if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;

  TFormUtils.SetarTelaPrincipal(frmLogin);
  frmLogin.Show;

  Close;
end;

procedure TfrmSplash.ShowPainelGestao;
begin
  if not Assigned(frmPainelGestao) then
  begin
    Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
  end;

  TFormUtils.SetarTelaPrincipal(frmPainelGestao);
  frmPainelGestao.Show;

  Close;
end;

{-- 1º Exercicio
-- Qual o produto com o maior preço de custo
-- 1ª Forma de fazer
select (precoCusto)Maior_Preco_Custo, id, (nome)Nome_Produto from produto
where precoCusto = (select max(precoCusto) from produto);

-- 2ª Forma de fazer
select (precoCusto)Maior_Preco_Custo, id, (nome)Nome_Produto from produto
order by precocusto desc limit 1; -- 0,4;

-- 2º Exercicio
-- Qual o produto com o maior preço de venda
select (precovenda)Maior_Preco_Venda, id, (nome)Nome_Produto from produto
where precovenda = (select max(precovenda) from produto);

-- 3º Exercicio
-- Qual produto com o menor preço de custo
select (precocusto)Menor_Preco_Custo, id, (nome)Nome_Produto from produto
where precocusto = (select min(precocusto) from produto);

-- 4º Exercicio
-- Qual produto com o menor preço de venda
select (precovenda)Menor_Preco_Venda, id, (nome)Nome_Produto from produto
where precovenda = (select min(precovenda) from produto);

-- 5º Exercicio
-- A comanda mais recente
select (criadoEm)Mais_Rescente, id, (codigo)Codigo_mesa from comanda
order by criadoEm desc limit 1;

-- 6º Exercicio
-- A comanda mais velha
select (criadoEm)Mais_Antiga, id, (codigo)Codigo_mesa from comanda
order by criadoEm asc limit 1;

-- 7º Exercicio
-- A comanda com maior valor (baseado no valor da comanda)
select id, (codigo)Codigo_Comanda, (valor)Valor_Comanda from comanda
where valor = (select max(valor) from comanda);

-- 8º Exercicio
--  As 3 comandas com maior valor ordenadas em ordem crescente
select valor from comanda
where valor = (select count(valor) from comanda)
union
select valor from comanda
where valor = (select count(valor) from comanda)
union
select valor from comanda
where valor = (select count(valor) from comanda)
order by 1 asc limit 3;

-- 9º Exercicio
-- Busque os clientes que são aniversariantes do mês
select * from pessoa
where criadoEm between '2022-11-01 00:00:00' and '2022-11-30 00:00:00'
and tipoPessoa = 'C';

-- 10º Exercicio
-- Mesas sem atendente
select * from mesa
where atendenteId is null;

-- 11º Exercicio
-- Quantos atendentes
select count(tipoPessoa)Total_Atendentes from pessoa
where tipoPessoa = 'F';

-- 12º Exercicio
-- Quantidade de comandas dos dois últimos anos
select count(criadoEm)Total_Comandas from comanda
where criadoEm between '2020-11-01 00:00:00' and '2022-11-01 00:00:00';

-- 13º Exercicio
-- O maior valor de comanda (considerando apenas o valor da comanda) dia a dia do mês atual
select c.valor, c.criadoEm
from comanda c where c.criadoem like '2022-10%'
group by c.valor having max(c.valor) order by c.criadoem ;

-- 14º Exercicio
-- O valor de cada comanda (baseado nos itens) juntamente com o item mais caro da comanda

select distinct (c.valor)Valor_Comanda from comanda as c
union
select  max(cp.valorTotal)Maior_Valor  from comandaproduto as cp
-- inner join comandaproduto on
-- comandaproduto.comandaId = comanda.id
group by c.Valor_Comanda, cp.Maior_Valor having (id);









-- 15 O valor que cada cliente já gastou no restaurante;
-- 16 Listar o código das mesas juntamente com o nome dos atendentes responsáveis por cada mesa (apenas as mesas que contém atendente);
-- 17 Listar as comandas com seus produtos mostrando o código da comanda e o nome do produto;
-- 18 Listar as comandas mostrando o valor total de cada comanda;
-- 19 Buscar a comanda que teve a maior valor, mostrando o código da comanda, o valor da comanda e o nome do atendente responsável por aquela comanda;
-- 20 Quantidade de clientes em cada dia;
-- 21 O funcionário mais velho que já fez algum atendimento
-- 22 A comanda com maior valor (valor da Comanda) e que não está paga
-- 23 A comanda com menor valor (valor da Comanda) e que já está paga
-- 24 Quantos clientes tem comandas em aberto
-- 25 Quanto cada mesa já arrecadou
-- 26 Quantidade de clientes que nunca consumiram no restaurante
-- 27 Os cliente que nunca consumiram no restaurante
-- 28 As comandas que estão em mesas ocupadas (juntamente com seu valor);
-- 29 Os 10 produtos mais vendidos (ultimo mês)
-- 30 O valor da comanda com maior valor e com menor valor (baseado campo valor da tabela “comanda”);
-- 31 Os produtos que nunca saíram em nenhuma comanda;
-- 32 A quantidade de vezes que um produto saiu em cada comanda;
}

end.
