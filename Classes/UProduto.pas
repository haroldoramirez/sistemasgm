unit UProduto;

interface
    uses UGenerico, UMarca, UCategoria, UUnidade, UNcm;
    type Produto = class(Generico)

    protected
        umaMarca       : Marca;
        umaCategoria   : Categoria;
        unidade        : string[4];
        umNcm          : Ncm;
        cst            : string[4];
        quantidade     : Real;
        icms           : Real;
        ipi            : Real;
        precoCompra    : Double;
        precoVenda     : Real;
        icmsAnterior   : Real;
        ipiAnterior    : Real;
        precoCompraAnt : Real;
        observacao     : string[255];
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setUmaMarca (vUmaMarca : Marca);
        Procedure setUmaCategoria (vUmaCategoria : Categoria);
        Procedure setUnidade (vUnidade : String);
        Procedure setUmNcm (vNcm : Ncm);
        Procedure setCst (vCst : String);
        Procedure setQuantidade (vQuantidade : Real);
        Procedure setICMS (vICMS : Real);
        Procedure setIPI (vIPI : Real);
        Procedure setPrecoCompra (vPrecoCompra : Double);
        Procedure setPrecoVenda (vPrecoVenda : Real);
        Procedure setICMSAnterior (vICMSAnterior : Real);
        Procedure setIPIAnterior (vIPIAnterior : Real);
        Procedure setPrecoCompraAnt (vPrecoCompraAnt : Real);
        Procedure setObservacao (vObservacao : String);

        Function getUmaMarca       : Marca;
        Function getUmaCategoria   : Categoria;
        Function getUnidade        : String;
        Function getUmNcm          : Ncm;
        Function getCst            : String;
        Function getQuantidade     : Real;
        Function getICMS           : Real;
        Function getIPI            : Real;
        Function getPrecoCompra    : Double;
        Function getPrecoVenda     : Real;
        Function getICMSAnterior   : Real;
        Function getIPIAnterior    : Real;
        Function getPrecoCompraAnt : Real;
        Function getObservacao     : String;
end;

implementation

{ Produto }

constructor Produto.CrieObjeto;
begin
    inherited;
    umaMarca       := Marca.CrieObjeto;
    umaCategoria   := Categoria.CrieObjeto;
    unidade        := '';
    umNcm          := Ncm.CrieObjeto;
    cst            := '';
    quantidade     := 0;
    icms           := 0;
    ipi            := 0;
    precoCompra    := 0;
    precoVenda     := 0;
    icmsAnterior   := 0;
    ipiAnterior    := 0;
    precoCompraAnt := 0;
    observacao     := '';
end;

destructor Produto.Destrua_Se;
begin

end;

function Produto.getCst: String;
begin
    Result := cst;
end;

function Produto.getICMS: Real;
begin
    Result := ICMS;
end;

function Produto.getICMSAnterior: Real;
begin
   Result := icmsAnterior;
end;

function Produto.getIPI: Real;
begin
    Result := IPI;
end;

function Produto.getIPIAnterior: Real;
begin
    Result := ipiAnterior;
end;

function Produto.getObservacao: String;
begin
    Result := Observacao;
end;

function Produto.getPrecoCompra: Double;
begin
    Result:= precoCompra;
end;

function Produto.getPrecoCompraAnt: Real;
begin
    Result := precoCompraAnt;
end;

function Produto.getPrecoVenda: Real;
begin
    Result := precoVenda;
end;

function Produto.getQuantidade: Real;
begin
    Result := Quantidade;
end;

function Produto.getUmaCategoria: Categoria;
begin
    Result := umaCategoria;
end;

function Produto.getUmaMarca: Marca;
begin
    Result := umaMarca;
end;

function Produto.getUmNcm: Ncm;
begin
    Result := umNcm;
end;

function Produto.getUnidade: String;
begin
    Result := unidade;
end;

procedure Produto.setCst(vCst: String);
begin
    cst := vCst;
end;

procedure Produto.setICMS(vICMS: Real);
begin
    ICMS := vICMS
end;

procedure Produto.setICMSAnterior(vICMSAnterior: Real);
begin
    icmsAnterior := vICMSAnterior;
end;

procedure Produto.setIPI(vIPI: Real);
begin
    IPI := vIPI;
end;

procedure Produto.setIPIAnterior(vIPIAnterior: Real);
begin
    ipiAnterior := vIPIAnterior;
end;

procedure Produto.setObservacao(vObservacao: String);
begin
    Observacao := vObservacao;
end;

procedure Produto.setPrecoCompra(vPrecoCompra: Double);
begin
    PrecoCompra := vPrecoCompra;
end;

procedure Produto.setPrecoCompraAnt(vPrecoCompraAnt: Real);
begin
    precoCompraAnt := vPrecoCompraAnt;
end;

procedure Produto.setPrecoVenda(vPrecoVenda: Real);
begin
    PrecoVenda := vPrecoVenda;
end;

procedure Produto.setQuantidade(vQuantidade: Real);
begin
    Quantidade := vQuantidade;
end;

procedure Produto.setUmaCategoria(vUmaCategoria: Categoria);
begin
    umaCategoria := vUmaCategoria;
end;

procedure Produto.setUmaMarca(vUmaMarca: Marca);
begin
    umaMarca := vUmaMarca;
end;

procedure Produto.setUmNcm(vNcm: Ncm);
begin
    umNcm := vNcm;
end;

procedure Produto.setUnidade(vUnidade: String);
begin
    unidade := vUnidade;
end;

end.
