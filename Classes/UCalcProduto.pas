unit UCalcProduto;

interface
    type CalcProduto = class

    protected
        id            : Integer;
        totalProduto  : Real;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setId (vId : Integer);
        Procedure setTotalProduto (vTotalProduto : Real);

        Function getId           : Integer;
        Function getTotalProduto : Real;

end;

implementation

{ CalcProduto }

constructor CalcProduto.CrieObjeto;
begin
    id           := 0;
    totalProduto := 0;
end;

destructor CalcProduto.Destrua_Se;
begin

end;

function CalcProduto.getId: Integer;
begin
    Result := id;
end;

function CalcProduto.getTotalProduto: Real;
begin
    Result := totalProduto;
end;

procedure CalcProduto.setId(vId: Integer);
begin
    id := vId;
end;

procedure CalcProduto.setTotalProduto(vTotalProduto: Real);
begin
    totalProduto := vTotalProduto;
end;

end.
