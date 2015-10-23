unit UVeiculo;

interface
    uses DateUtils, SysUtils;
    type Veiculo = class

    protected
        Id  : Integer;
        Antt : String[20];
        Placa : String[8];
        Uf : String[2];
        DataCadastro    : TDateTime;
        DataAlteracao   : TDateTime;
    public

        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setId (vId : Integer);
        Procedure setAntt (vAntt : String);
        Procedure setPlaca (vPlaca : String);
        Procedure setUf (vUf : String);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);

        Function getId : integer;
        Function getAntt : String;
        Function getPlaca : String;
        Function getUf : String;
        Function getDataCadastro :TDateTime;
        Function getDataAlteracao : TDateTime;
    end;

implementation

{ Veiculo }

constructor Veiculo.CrieObjeto;
var dataAtual : TDateTime;
begin
    antt := '';
    Placa := '';
    Uf := '';
    DataCadastro := dataAtual;
    DataAlteracao:= dataAtual;
end;

destructor Veiculo.Destrua_Se;
begin

end;

function Veiculo.getAntt: String;
begin
    Result := Antt;
end;

function Veiculo.getDataAlteracao: TDateTime;
begin
    Result := DataAlteracao;
end;

function Veiculo.getDataCadastro: TDateTime;
begin
    Result := DataCadastro;
end;

function Veiculo.getId: integer;
begin
    Result := Id;
end;

function Veiculo.getPlaca: String;
begin
    Result := Placa;
end;

function Veiculo.getUf: String;
begin
    Result := Uf;
end;

procedure Veiculo.setAntt(vAntt: String);
begin
    Antt := vAntt;
end;

procedure Veiculo.setDataAlteracao(vDataAlteracao: TDateTime);
begin
    DataAlteracao := vDataAlteracao;
end;

procedure Veiculo.setDataCadastro(vDataCadastro: TDateTime);
begin
    DataCadastro := vDataCadastro;
end;

procedure Veiculo.setId(vId: Integer);
begin
    Id := vId;
end;

procedure Veiculo.setPlaca(vPlaca: String);
begin
    Placa := vPlaca;
end;

procedure Veiculo.setUf(vUf: String);
begin
    Uf := vUf;
end;

end.
