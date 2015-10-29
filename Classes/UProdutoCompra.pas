unit UProdutoCompra;

interface
    uses UProduto, UCfop;
    type ProdutoCompra = class(Produto)
    private
    protected
        umCfop               : Cfop;
        ncm_sh               : string[8];
        cst_compra           : string[3];
        unidade_compra       : string[3];
        quantidade_compra    : Real;
        valorUnitario_compra : Real;
        desconto_compra      : Real;
        icms_compra          : Real;
        ipi_compra           : Real;
        valorTotal_compra    : Real;
        baseIcms_compra      : Real;
        valorIcms_compra     : Real;
        valorIpi_compra      : Real;

    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setUmCfop (vCfop : Cfop);
        Procedure setNCMSH (vNCMSH : String);
        Procedure setCSTCompra (vCSTCompra : String);
        Procedure setUnidadeCompra (vUnidade : String);
        Procedure setQuantidadeCompra (vQuantidade : Real);
        Procedure setValorUnitarioCompra (vPrecoCusto : Real);
        Procedure setDescontoCompra (vDesconto : Real);
        Procedure setICMSCompra (vICMS : Real);
        Procedure setIPICompra (vIPI : Real);
        Procedure setValorTotalCompra (vValorTotal : Real);
        Procedure setBaseIcmsCompra (vBaseIcms : Real);
        Procedure setValorIcmsCompra (vValorIcms : Real);
        Procedure setValorIpiCompra (vValorIpi : Real);

        Function getUmCfop : Cfop;
        Function getNCMSH : String;
        Function getCSTCompra : String;
        Function getUnidadeCompra : String;
        Function getQuantidadeCompra : Real;
        Function getValorUnitarioCompra : Real;
        Function getDescontoCompra : Real;
        Function getICMSCompra : Real;
        Function getIPICompra : Real;
        Function getValorTotalCompra : Real;
        Function getBaseIcmsCompra : Real;
        Function getValorIcmsCompra : Real;
        Function getValorIpiCompra : Real;
end;

implementation

{ ProdutoCompra }

constructor ProdutoCompra.CrieObjeto;
begin
    inherited;
    umCfop            := Cfop.CrieObjeto;
    ncm_sh            := '';
    cst_compra        := '';
    unidade_compra    := '';
    quantidade_compra := 0.0;
    valorUnitario_compra := 0.0;
    desconto_compra   := 0.0;
    icms_compra       := 0.0;
    ipi_compra        := 0.0;
    valorTotal_compra := 0.0;
    baseIcms_compra   := 0.0;
    valorIcms_compra  := 0.0;
    valorIpi_compra   := 0.0;
end;

destructor ProdutoCompra.Destrua_Se;
begin

end;

function ProdutoCompra.getBaseIcmsCompra: Real;
begin
    Result := baseIcms_compra;
end;

function ProdutoCompra.getUmCfop: Cfop;
begin
   Result := umCfop;
end;

function ProdutoCompra.getCSTCompra: String;
begin
   Result := cst_compra;
end;

function ProdutoCompra.getDescontoCompra: Real;
begin
   Result := desconto_compra;
end;

function ProdutoCompra.getICMSCompra: Real;
begin
   Result := icms_compra;
end;

function ProdutoCompra.getIPICompra: Real;
begin
   Result := ipi_compra;
end;

function ProdutoCompra.getNCMSH: String;
begin
    Result := ncm_sh;
end;

function ProdutoCompra.getValorUnitarioCompra: Real;
begin
   Result := valorUnitario_compra;
end;

function ProdutoCompra.getQuantidadeCompra: Real;
begin
   Result := quantidade_compra;
end;

function ProdutoCompra.getUnidadeCompra: String;
begin
   Result := unidade_compra;
end;

function ProdutoCompra.getValorIcmsCompra: Real;
begin
   Result := valorIcms_compra;
end;

function ProdutoCompra.getValorIpiCompra: Real;
begin
   Result := valorIpi_compra
end;

function ProdutoCompra.getValorTotalCompra: Real;
begin
   Result := valorTotal_compra;
end;

procedure ProdutoCompra.setBaseIcmsCompra(vBaseIcms: Real);
begin
   baseIcms_compra := vBaseIcms;
end;

procedure ProdutoCompra.setUmCfop(vCfop: Cfop);
begin
   umCfop := vCfop;
end;

procedure ProdutoCompra.setCSTCompra(vCSTCompra: String);
begin
    cst_compra := vCSTCompra;
end;

procedure ProdutoCompra.setDescontoCompra(vDesconto: Real);
begin
   desconto_compra := vDesconto;
end;

procedure ProdutoCompra.setICMSCompra(vICMS: Real);
begin
   icms_compra := vICMS;
end;

procedure ProdutoCompra.setIPICompra(vIPI: Real);
begin
   ipi_compra := vIPI;
end;

procedure ProdutoCompra.setNCMSH(vNCMSH: String);
begin
   ncm_sh := vNCMSH;
end;

procedure ProdutoCompra.setValorUnitarioCompra(vPrecoCusto: Real);
begin
   valorUnitario_compra := vPrecoCusto;
end;

procedure ProdutoCompra.setQuantidadeCompra(vQuantidade: Real);
begin
   quantidade_compra := vQuantidade;
end;

procedure ProdutoCompra.setUnidadeCompra(vUnidade: String);
begin
   unidade_compra := vUnidade;
end;

procedure ProdutoCompra.setValorIcmsCompra(vValorIcms: Real);
begin
   valorIcms_compra := vValorIcms;
end;

procedure ProdutoCompra.setValorIpiCompra(vValorIpi: Real);
begin
   valorIpi_compra := vValorIpi;
end;

procedure ProdutoCompra.setValorTotalCompra(vValorTotal: Real);
begin
   valorTotal_compra := vValorTotal;
end;

end.
