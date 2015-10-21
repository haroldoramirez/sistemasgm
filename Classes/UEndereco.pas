unit UEndereco;

interface
      uses UCidade;
      type Endereco = class

      protected
          Logradouro	: string[100];
          Numero		  : string[10];
          CEP	  	    : string[9];
          Bairro		  : string[50];
          Complemento : string[100];
          umaCidade   : Cidade;
      Public
          Constructor CrieObjeto;
          Destructor Destrua_Se;
          Procedure setLogradouro (vLogradouro : string);
          Procedure setNumero (vNumero : string);
          Procedure setCEP (vCEP : string);
          Procedure setBairro (vBairro : string);
          Procedure setComplemento (vComplemento : string);
          Procedure setumaCidade (vCidade : Cidade);

          Function getLogradouro      : string;
          Function getNumero  :string;
          Function getCEP : string;
          Function getBairro : string;
          Function getComplemento : string;
          Function getumaCidade : Cidade;
End;

implementation

{ Endereco }

constructor Endereco.CrieObjeto;
begin
    Logradouro     := ' ';
    Numero		     := ' ';
    CEP		         := ' ';
    Bairro		     := ' ';
    Complemento 	 := ' ';
    umaCidade      := Cidade.CrieObjeto;
end;

destructor Endereco.Destrua_Se;
begin

end;

function Endereco.getBairro: string;
begin
   Result := Bairro;
end;

function Endereco.getCEP: string;
begin
    Result := CEP;
end;

function Endereco.getComplemento: string;
begin
    Result := Complemento;
end;

function Endereco.getLogradouro: string;
begin
    Result := Logradouro;
end;

function Endereco.getNumero: string;
begin
    Result := Numero;
end;

function Endereco.getumaCidade: Cidade;
begin
     Result := umaCidade;
end;

procedure Endereco.setBairro(vBairro: string);
begin
    Bairro := vBairro;
end;

procedure Endereco.setCEP(vCEP: string);
begin
    CEP := vCEP;
end;

procedure Endereco.setComplemento(vComplemento: string);
begin
    Complemento := vComplemento;
end;

procedure Endereco.setLogradouro(vLogradouro: string);
begin
    Logradouro := vLogradouro;
end;

procedure Endereco.setNumero(vNumero: string);
begin
    Numero := vNumero;
end;

procedure Endereco.setumaCidade(vCidade: Cidade);
begin
    umaCidade := vCidade;
end;

end.
