unit UNcm;

interface
    uses DateUtils, SysUtils;
    type Ncm = class

    protected
        Id              : Integer;
        Numero          : Integer;
        Porcentagem_Ipi : Real;
        DataCadastro    : TDateTime;
        DataAlteracao   : TDateTime;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setId (vId : Integer);
        Procedure setNumero (vNumero : Integer);
        Procedure setPorcentagem_Ipi (vPorcentagem_Ipi : Real);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);

        Function getId : integer;
        Function getNumero : Integer;
        Function getPorcentagem_Ipi : Real;
        Function getDataCadastro :TDateTime;
        Function getDataAlteracao : TDateTime;

    end;

implementation

{ Ncm }

constructor Ncm.CrieObjeto;
var dataAtual : TDateTime;
begin
     dataAtual       := Date;
     Id              := 0;
     Numero          := 0;
     Porcentagem_Ipi := 0.0;
     DataCadastro    := dataAtual;
     DataAlteracao   := dataAtual;
end;

destructor Ncm.Destrua_Se;
begin

end;

function Ncm.getDataAlteracao: TDateTime;
begin
  Result := DataAlteracao;
end;

function Ncm.getDataCadastro: TDateTime;
begin
  Result := DataCadastro;
end;

function Ncm.getId: integer;
begin
  Result := Id;
end;

function Ncm.getNumero: Integer;
begin
    Result := Numero;
end;

function Ncm.getPorcentagem_Ipi: Real;
begin
    Result := Porcentagem_Ipi;
end;

procedure Ncm.setDataAlteracao(vDataAlteracao: TDateTime);
begin
    DataAlteracao := vDataAlteracao;
end;

procedure Ncm.setDataCadastro(vDataCadastro: TDateTime);
begin
    DataCadastro := vDataCadastro;
end;

procedure Ncm.setId(vId: Integer);
begin
    Id := vId;
end;

procedure Ncm.setNumero(vNumero: Integer);
begin
    Numero := vNumero;
end;

procedure Ncm.setPorcentagem_Ipi(vPorcentagem_Ipi: Real);
begin
    Porcentagem_Ipi := vPorcentagem_Ipi;
end;

end.
