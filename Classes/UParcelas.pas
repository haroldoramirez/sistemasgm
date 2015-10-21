unit UParcelas;

interface
    type Parcelas = class

    protected
        numParcela : Integer;
        dias : Integer;
        porcentagem : Real;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setNumParcela (vNumParcela : Integer);
        Procedure setDias (vDias : Integer);
        Procedure setPorcentagem (vPorcentagem : Real);
        Function getNumParcela : Integer;
        Function getDias : Integer;
        Function getPorcentagem : Real;
end;
implementation

{ Parcelas }

constructor Parcelas.CrieObjeto;
begin
    numParcela  := 0;
    dias        := 0;
    porcentagem := 0;
end;

destructor Parcelas.Destrua_Se;
begin

end;

function Parcelas.getDias: Integer;
begin
     Result := dias;
end;

function Parcelas.getNumParcela: Integer;
begin
    Result := numParcela;
end;

function Parcelas.getPorcentagem: Real;
begin
    Result := porcentagem;
end;

procedure Parcelas.setDias(vDias: Integer);
begin
    Dias := vDias;
end;

procedure Parcelas.setNumParcela(vNumParcela: Integer);
begin
    NumParcela := vNumParcela
end;

procedure Parcelas.setPorcentagem(vPorcentagem: Real);
begin
    Porcentagem := vPorcentagem;
end;

end.
