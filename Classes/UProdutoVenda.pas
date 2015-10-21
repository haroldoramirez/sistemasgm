unit UProdutoVenda;

interface
    uses UProduto;
    type ProdutoVenda = class(Produto)

    protected
        valorUnitario : Real;
        quantidade    : Real;
        desconto      : Real;
        qtdTemp       : Real;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setValorUnitario (vValorUnitario : Real);
        Procedure setQtdProduto (vQuantidade : Real);
        Procedure setDesconto (vDesconto : Real);
        Procedure setQtdTemp (vQtdTemp : Real);

        Function getValorUnitario : Real;
        Function getQtdProduto : Real;
        Function getDesconto : Real;
        Function getQtdTemp : Real;
end;

implementation

{ ProdutoVenda }

constructor ProdutoVenda.CrieObjeto;
begin
    inherited;
    valorUnitario := 0.0;
    quantidade := 0;
    desconto := 0;
    qtdTemp  := 0;
end;

destructor ProdutoVenda.Destrua_Se;
begin

end;

function ProdutoVenda.getDesconto: Real;
begin
   Result := desconto;
end;

function ProdutoVenda.getQtdProduto: Real;
begin
    Result := quantidade;
end;

function ProdutoVenda.getQtdTemp: Real;
begin
    Result := qtdTemp;
end;

function ProdutoVenda.getValorUnitario: Real;
begin
    Result := valorUnitario;
end;

procedure ProdutoVenda.setDesconto(vDesconto: Real);
begin
    desconto := vDesconto;
end;

procedure ProdutoVenda.setQtdProduto(vQuantidade: Real);
begin
   quantidade := vQuantidade;
end;

procedure ProdutoVenda.setQtdTemp(vQtdTemp: Real);
begin
    qtdTemp := vQtdTemp;
end;

procedure ProdutoVenda.setValorUnitario(vValorUnitario: Real);
begin
    valorUnitario := vValorUnitario;
end;

end.
