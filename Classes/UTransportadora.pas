unit UTransportadora;

interface
    uses UPessoa, UCondicaoPagamento;
    type Transportadora = class(Pessoa)
    protected
      umaCondicaoPgto : CondicaoPagamento;
    public
      verificaNome    : Boolean;
      verificaTel     : Boolean;
      constructor CrieObjeto;
      destructor destrua_se;

      Procedure setUmaCondicaoPgto (vCondicaoPgto : CondicaoPagamento);
      Function getUmaCondicaoPgto : CondicaoPagamento;
  end;
implementation

{ Transportadora }

constructor Transportadora.CrieObjeto;
begin
    inherited;
    umaCondicaoPgto := CondicaoPagamento.CrieObjeto;
end;

destructor Transportadora.destrua_se;
begin
   inherited;
end;

function Transportadora.getUmaCondicaoPgto: CondicaoPagamento;
begin
   Result :=  umaCondicaoPgto;
end;

procedure Transportadora.setUmaCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
    umaCondicaoPgto := vCondicaoPgto;
end;

end.
