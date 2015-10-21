unit UCfop;

interface
    uses DateUtils, SysUtils;
    type Cfop = class

    protected
        Id              : Integer;
        Nome            : string[100];
        Numero          : Integer;
        DataCadastro    : TDateTime;
        DataAlteracao   : TDateTime;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setId (vId : Integer);
        Procedure setNome (vNome : string);
        Procedure setNumero (vNumero : Integer);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);

        Function getId : integer;
        Function getNome : String;
        Function getNumero : Integer;
        Function getDataCadastro :TDateTime;
        Function getDataAlteracao : TDateTime;
    end;

implementation

{ Cfop }

constructor Cfop.CrieObjeto;
var dataAtual : TDateTime;
begin
     dataAtual       := Date;
     Id              := 0;
     Nome            := '';
     Numero          := 0;
     DataCadastro    := dataAtual;
     DataAlteracao   := dataAtual;

end;

destructor Cfop.Destrua_Se;
begin

end;

function Cfop.getDataAlteracao: TDateTime;
begin
    Result := DataAlteracao;
end;

function Cfop.getDataCadastro: TDateTime;
begin
    Result := DataCadastro;
end;

function Cfop.getId: integer;
begin
    Result := Id;
end;

function Cfop.getNome: String;
begin
    Result := Nome;
end;

function Cfop.getNumero: Integer;
begin
    Result := Numero;
end;

procedure Cfop.setDataAlteracao(vDataAlteracao: TDateTime);
begin
    DataAlteracao := vDataAlteracao;
end;

procedure Cfop.setDataCadastro(vDataCadastro: TDateTime);
begin
    DataCadastro := vDataCadastro;
end;

procedure Cfop.setId(vId: Integer);
begin
    Id := vId;
end;

procedure Cfop.setNome(vNome: string);
begin
    Nome := vNome;
end;

procedure Cfop.setNumero(vNumero: Integer);
begin
    Numero := vNumero;
end;

end.
