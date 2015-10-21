unit UCondicaoPagamento;

interface
    uses UGenerico, UFormaPagamento, UParcelas;
    type CondicaoPagamento = class(Generico)

    protected
    umaFormaPagamento : FormaPagamento;
    ListaParcela: array of Parcelas;
    public
        p : Integer;
        Constructor CrieObjeto;
        Destructor Destrua_Se;
        procedure setUmaFormaPagamento (vUmaFormaPagamento : FormaPagamento);
        function getUmaFormaPagamento : FormaPagamento;

        procedure addParcela;
        procedure removeParcela;
        function getParcela: Parcelas; overload;
        function getParcela(parc:Integer):Parcelas; overload;
end;

implementation

{ CondicaoPagamento }

procedure CondicaoPagamento.addParcela;
begin
  inc(p);
  setLength(ListaParcela,p);
  ListaParcela[p-1] := Parcelas.CrieObjeto;
end;

constructor CondicaoPagamento.CrieObjeto;
begin
     inherited;
     umaFormaPagamento := FormaPagamento.CrieObjeto;
end;

destructor CondicaoPagamento.Destrua_Se;
begin

end;

function CondicaoPagamento.getParcela: Parcelas;
begin
    result := ListaParcela[p-1];
end;

function CondicaoPagamento.getParcela(parc: Integer): Parcelas;
begin
   result := ListaParcela[parc];
end;

function CondicaoPagamento.getUmaFormaPagamento: FormaPagamento;
begin
    Result := umaFormaPagamento;
end;

procedure CondicaoPagamento.removeParcela;
begin
  dec(p);
  setLength(ListaParcela,p);
//  ListaParcela[p-1] := Parcelas.CrieObjeto;
end;

procedure CondicaoPagamento.setUmaFormaPagamento(
  vUmaFormaPagamento: FormaPagamento);
begin
    umaFormaPagamento := vUmaFormaPagamento;
end;

end.
