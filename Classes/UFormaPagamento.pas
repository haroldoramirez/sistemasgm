unit UFormaPagamento;

interface
    uses UGenerico;
    type FormaPagamento = class(Generico)

    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;
    end;
implementation

{ FormaPagamento }

constructor FormaPagamento.CrieObjeto;
begin
    inherited;
end;

destructor FormaPagamento.Destrua_Se;
begin

end;

end.
