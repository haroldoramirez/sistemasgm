unit UCfop;

interface
    uses DateUtils, SysUtils;
    type Cfop = class

    protected
        Id              : Integer;
        Nome            : string[100];
        Numero          : string[5];
        DataCadastro    : TDateTime;
        DataAlteracao   : TDateTime;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setId (vId : Integer);
        Procedure setNome (vNome : string);
        Procedure setNumero (vNumero : string);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);

        Function getId : integer;
        Function getNome : String;
        Function getNumero : string;
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
     Numero          := '';
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

function Cfop.getNumero: String;
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

procedure Cfop.setNumero(vNumero: string);
begin
    Numero := vNumero;
end;

end.
