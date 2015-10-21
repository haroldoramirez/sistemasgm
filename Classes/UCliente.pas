unit UCliente;

interface
    uses UPessoa, UCondicaoPagamento;
    type Cliente = class(Pessoa)
    protected
      umaCondicaoPgto : CondicaoPagamento;
      TipoPessoa      : String[8];
    public
      verificaNome    : Boolean;
      verificaTel     : Boolean;
      constructor CrieObjeto;
      destructor destrua_se;

      Procedure setUmaCondicaoPgto (vCondicaoPgto : CondicaoPagamento);
      Procedure setTipoPessoa (vTipoPessoa : String);
      Function getUmaCondicaoPgto : CondicaoPagamento;
      Function getTipoPessoa : String;
  end;
implementation

{ Cliente }

constructor Cliente.CrieObjeto;
begin
    inherited;
    TipoPessoa  := '';
    umaCondicaoPgto := CondicaoPagamento.CrieObjeto;
end;

destructor Cliente.destrua_se;
begin
   inherited;
end;

function Cliente.getTipoPessoa: String;
begin
   Result := TipoPessoa;
end;

function Cliente.getUmaCondicaoPgto: CondicaoPagamento;
begin
   Result :=  umaCondicaoPgto;
end;

procedure Cliente.setTipoPessoa(vTipoPessoa: String);
begin
    TipoPessoa := vTipoPessoa;
end;

procedure Cliente.setUmaCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
    umaCondicaoPgto := vCondicaoPgto;
end;

end.
