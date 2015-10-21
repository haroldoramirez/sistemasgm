unit UPessoa;

interface
    uses DateUtils, SysUtils, UEndereco;
    type Pessoa = class

    protected
      Id : Integer;
      Nome_RazaoSoCial : string[100];
      RG_IE            : string[10];
      CPF_CNPJ         : string[18];
      DataNasc_Fund    : TDateTime;
      umEndereco       : Endereco;
      Email            : string[100];
      Telefone         : string[13];
      Celular          : string[13];
      Observacao       : string[255];
      DataCadastro     : TDateTime;
      DataUltAlteracao : TDateTime;

    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setId (vId : Integer);
        Procedure setNome_RazaoSoCial (vNome_RazaoSoCial : string);
        Procedure setRG_IE (vRG_IE : string);
        procedure setCPF_CNPJ (vCPF_CNPJ : string);
        procedure setumEndereco (vEndereco : Endereco);
        procedure setEmail (vEmail : string);
        procedure setDataNasc_Fund (vDataNasc_Fund : TDateTime);
        procedure setTelefone (vTelefone : string);
        procedure setCelular (vCelular : string);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataUltAlteracao (vDataUltAlteracao : TDateTime);
        Procedure setObservacao (vObservacao : string);

        Function getId : Integer;
        Function getNome_RazaoSoCial : string;
        Function getRG_IE : string;
        Function getCPF_CNPJ : string;
        Function getumEndereco : Endereco;
        Function getEmail : string;
        Function getDataNasc_Fund : TDateTime;
        Function getTelefone  : string;
        Function getCelular : string;
        Function getDataCadastro  :TDateTime;
        Function getDataUltAlteracao : TDateTime;
        Function getObservacao : string;

    end;

implementation

{ Pessoa }

constructor Pessoa.CrieObjeto;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Id                := 0;
    Nome_RazaoSoCial  := '';
    RG_IE             := '';
    CPF_CNPJ          := '';
    DataNasc_Fund     := dataAtual;
    umEndereco        := Endereco.CrieObjeto;
    Email             := '';
    Telefone          := '';
    Celular           := '';
    Observacao        := '';
    DataCadastro      := dataAtual;
    DataUltAlteracao  := dataAtual;
end;

destructor Pessoa.Destrua_Se;
begin

end;

function Pessoa.getCelular: string;
begin
   Result := Celular;
end;

function Pessoa.getCPF_CNPJ: String;
begin
    Result := CPF_CNPJ;
end;

function Pessoa.getDataCadastro: TDateTime;
begin
    Result := DataCadastro;
end;

function Pessoa.getDataNasc_Fund: TDateTime;
begin
    Result := DataNasc_Fund;
end;

function Pessoa.getDataUltAlteracao: TDateTime;
begin
    Result := DataUltAlteracao;
end;

function Pessoa.getEmail: string;
begin
    Result := Email;
end;

function Pessoa.getId: Integer;
begin
    Result := Id;
end;

function Pessoa.getNome_RazaoSoCial: string;
begin
    Result := Nome_RazaoSoCial;
end;

function Pessoa.getRG_IE: string;
begin
    Result := RG_IE;
end;

function Pessoa.getTelefone: string;
begin
    Result := Telefone;
end;

function Pessoa.getObservacao: string;
begin
    Result := Observacao;
end;

function Pessoa.getumEndereco: Endereco;
begin
    Result := umEndereco;
end;

procedure Pessoa.setCelular(vCelular: string);
begin
    Celular := vCelular;
end;

procedure Pessoa.setCPF_CNPJ(vCPF_CNPJ: String);
begin
     CPF_CNPJ := vCPF_CNPJ;
end;

procedure Pessoa.setDataCadastro(vDataCadastro: TDateTime);
begin
    DataCadastro := vDataCadastro;
end;

procedure Pessoa.setDataNasc_Fund(vDataNasc_Fund: TDateTime);
begin
    DataNasc_Fund := vDataNasc_Fund;
end;

procedure Pessoa.setDataUltAlteracao(vDataUltAlteracao: TDateTime);
begin
    DataUltAlteracao := vDataUltAlteracao;
end;

procedure Pessoa.setEmail(vEmail: string);
begin
    Email := vEmail;
end;

procedure Pessoa.setId(vId: Integer);
begin
    Id := vId;
end;

procedure Pessoa.setRG_IE(vRG_IE: string);
begin
    RG_IE := vRG_IE;
end;

procedure Pessoa.setNome_RazaoSoCial(vNome_RazaoSoCial: string);
begin
    Nome_RazaoSoCial := vNome_RazaoSoCial;
end;

procedure Pessoa.setTelefone(vTelefone: string);
begin
    Telefone := vTelefone;
end;

procedure Pessoa.setObservacao(vObservacao: string);
begin
    Observacao := vObservacao;
end;

procedure Pessoa.setumEndereco(vEndereco: Endereco);
begin
    umEndereco := vEndereco;
end;

end.
