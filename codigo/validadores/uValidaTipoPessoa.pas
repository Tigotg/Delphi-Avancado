unit UValidaTipoPessoa;

interface

uses
  System.Math, System.SysUtils;

type
  TValidaTipoPessoa = class
  private

  protected

  public
    class function ValidaCNPJ(pCNPJ: string): boolean;
    class function ValidaCPF(pCPF: string): boolean;
  end;

implementation

{ --------------------------- VALIDA CNPJ ---------------------------- }
class function TValidaTipoPessoa.ValidaCNPJ(pCNPJ: string): boolean;
var
  dig13, dig14: string;
  sm, i, r, peso: integer;
begin
  // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((pCNPJ = '00000000000000') or (pCNPJ = '11111111111111') or
    (pCNPJ = '22222222222222') or (pCNPJ = '33333333333333') or
    (pCNPJ = '44444444444444') or (pCNPJ = '55555555555555') or
    (pCNPJ = '66666666666666') or (pCNPJ = '77777777777777') or
    (pCNPJ = '88888888888888') or (pCNPJ = '99999999999999') or
    (length(pCNPJ) <> 14)) then
  begin
    ValidaCNPJ := false;
    exit;
  end;

  // "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
    { Cálculo do 1o. Digito Verificador }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      // StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(pCNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r): 1, dig13);
    // converte um número no respectivo caractere numérico

    { Cálculo do 2o. Digito Verificador }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(pCNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11 - r): 1, dig14);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = pCNPJ[13]) and (dig14 = pCNPJ[14])) then
      ValidaCNPJ := true
    else
      ValidaCNPJ := false;
  except
    ValidaCNPJ := false
  end;
end;

{ ------------------------- VALIDA CPF ----------------------------- }
class function TValidaTipoPessoa.ValidaCPF(pCPF: string): boolean;
var
  dig10, dig11: string;
  s, i, r, peso: integer;
begin
  // length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
  if ((pCPF = '00000000000') or (pCPF = '11111111111') or (pCPF = '22222222222')
    or (pCPF = '33333333333') or (pCPF = '44444444444') or
    (pCPF = '55555555555') or (pCPF = '66666666666') or (pCPF = '77777777777')
    or (pCPF = '88888888888') or (pCPF = '99999999999') or (length(pCPF) <> 11))
  then
  begin
    ValidaCPF := false;
    exit;
  end;

  // try - protege o código para eventuais erros de conversão de tipo na função StrToInt
  try
    { Cálculo do 1o. Digito Verificador }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      // StrToInt converte o i-ésimo caractere do CPF em um número
      s := s + (StrToInt(pCPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10); // converte um número no respectivo caractere numérico

    { Cálculo do 2o. Digito Verificador }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(pCPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = pCPF[10]) and (dig11 = pCPF[11])) then
      ValidaCPF := true
    else
      ValidaCPF := false;
  except
    ValidaCPF := false
  end;
end;

end.
