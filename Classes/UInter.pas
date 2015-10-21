unit UInter;

interface
    uses UPais, UFrmConPais, UEstado, UFrmConEstado, UCidade, UFrmConCidade,
    UCliente, UFrmConCliente, UFornecedor, UFrmConFornecedor, UFuncionario,
    UFrmConFuncionario, UMarca, UFrmConMarca, UCategoria, UFrmConCategoria,
    UFormaPagamento, UFrmConFormaPagamento, UProduto, UFrmConProduto,
    UCondicaoPagamento, UFrmConCondicaoPagamento, UVenda, UFrmConVenda,
    UCargo, UFrmConCargo, UContasReceber, UFrmConContasReceber, UCompra,
    UFrmConCompra, UUsuario, UFrmConUsuario, UTransportadora, UFrmConTransportadora, UContasPagar,
    UFrmConContasPagar, UUnidade, UFrmConUnidade;
    type Interfaces = class

    protected
        umFrmConPais              : TFrmConPais;
        umFrmConEstado            : TFrmConEstado;
        umFrmConCidade            : TFrmConCidade;
        umFrmConCliente           : TFrmConCliente;
        umFrmConFornecedor        : TFrmConFornecedor;
        umFrmConFuncionario       : TFrmConFuncionario;
        umFrmConMarca             : TFrmConMarca;
        umFrmConCategoria         : TFrmConCategoria;
        umFrmConFormaPagamento    : TFrmConFormaPagamento;
        umFrmConProduto           : TFrmConProduto;
        umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
        umFrmConVenda             : TFrmConVenda;
        umFrmConCargo             : TFrmConCargo;
        umFrmConContasReceber     : TFrmConContasReceber;
        umFrmConContasPagar       : TFrmConContasPagar;
        umFrmConCompra            : TFrmConCompra;
        umFrmConUsuario           : TFrmConUsuario;
        umFrmConTransportadora    : TFrmConTransportadora;
        umFrmConUnidade           : TFrmConUnidade;
    public
        constructor CrieObj;
        destructor  Destrua_se;

        procedure PecaDadosPais (vPais:Pais);
        procedure PecaDadosEstado (vEstado:Estado);
        procedure PecaDadosCidade (vCidade:Cidade);
        procedure PecaDadosCliente (vCliente:Cliente);
        procedure PecaDadosFornecedor (vFornecedor:Fornecedor; Tipo:String);
        procedure PecaDadosFuncionario (vFuncionario:Funcionario);
        procedure PecaDadosMarca (vMarca:Marca);
        procedure PecaDadosCategoria (vCategoria:Categoria);
        procedure PecaDadosFormaPagamento (vFormaPagamento:FormaPagamento);
        procedure PecaDadosProduto (vProduto:Produto);
        procedure PecaDadosCondicaoPagamento (vCondicaoPagamento:CondicaoPagamento);
        procedure PecaDadosVenda (vVenda:Venda);
        procedure PecaDadosCargo (vCargo:Cargo);
        procedure PecaDadosContasReceber (vContasReceber:ContasReceber);
        procedure PecaDadosContasPagar (vContasPagar:ContasPagar);
        procedure PecaDadosCompra (vCompra:Compra);
        procedure PecaDadosUsuario (vUsuario:Usuario);
        procedure PecaDadosTransportadora (vTransportadora:Transportadora);
        procedure PecaDadosUnidade (vUnidade:Unidade);
    end;

implementation

{ Interfaces }

constructor Interfaces.CrieObj;
begin
    umFrmConPais              := TFrmConPais.Create(nil);
    umFrmConEstado            := TFrmConEstado.Create(nil);
    umFrmConCidade            := TFrmConCidade.Create(nil);
    umFrmConCliente           := TFrmConCliente.Create(nil);
    umFrmConFornecedor        := TFrmConFornecedor.Create(nil);
    umFrmConFuncionario       := TFrmConFuncionario.Create(nil);
    umFrmConMarca             := TFrmConMarca.Create(nil);
    umFrmConCategoria         := TFrmConCategoria.Create(nil);
    umFrmConFormaPagamento    := TFrmConFormaPagamento.Create(nil);
    umFrmConProduto           := TFrmConProduto.Create(nil);
    umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
    umFrmConVenda             := TFrmConVenda.Create(nil);
    umFrmConCargo             := TFrmConCargo.Create(nil);
    umFrmConContasReceber     := TFrmConContasReceber.Create(nil);
    umFrmConContasPagar       := TFrmConContasPagar.Create(nil);
    umFrmConCompra            := TFrmConCompra.Create(nil);
    umFrmConUsuario           := TFrmConUsuario.Create(nil);
    umFrmConTransportadora    := TFrmConTransportadora.Create(nil);
    umFrmConUnidade           := TFrmConUnidade.Create(nil);
end;

destructor Interfaces.Destrua_se;
begin
    umFrmConPais.Free;
    umFrmConEstado.Free;
    umFrmConCidade.Free;
    umFrmConCliente.Free;
    umFrmConFornecedor.Free;
    umFrmConFuncionario.Free;
    umFrmConMarca.Free;
    umFrmConCategoria.Free;
    umFrmConFormaPagamento.Free;
    umFrmConProduto.Free;
    umFrmConCondicaoPagamento.Free;
    umFrmConVenda.Free;
    umFrmConCargo.Free;
    umFrmConContasReceber.Free;
    umFrmConContasPagar.Free;
    umFrmConCompra.Free;
    umFrmConUsuario.Free;
    umFrmConTransportadora.Free;
    umFrmConUnidade.Free;
end;

procedure Interfaces.PecaDadosCargo(vCargo: Cargo);
begin
    umFrmConCargo.ConhecaObjeto(vCargo);
    umFrmConCargo.ShowModal;
end;

procedure Interfaces.PecaDadosCategoria(vCategoria: Categoria);
begin
    umFrmConCategoria.ConhecaObj(vCategoria);
    umFrmConCategoria.showmodal;
end;

procedure Interfaces.PecaDadosCidade(vCidade: Cidade);
begin
    umFrmConCidade.ConhecaObj(vCidade);
    umFrmConCidade.showmodal;
end;

procedure Interfaces.PecaDadosCliente(vCliente: Cliente);
begin
    umFrmConCliente.ConhecaObj(vCliente);
    umFrmConCliente.showmodal;
end;

procedure Interfaces.PecaDadosCompra(vCompra: Compra);
begin
    umFrmConCompra.ConhecaObj(vCompra);
    umFrmConCompra.ShowModal;
end;

procedure Interfaces.PecaDadosCondicaoPagamento(
  vCondicaoPagamento: CondicaoPagamento);
begin
    umFrmConCondicaoPagamento.ConhecaObj(vCondicaoPagamento);
    umFrmConCondicaoPagamento.ShowModal;
end;

procedure Interfaces.PecaDadosContasPagar(vContasPagar: ContasPagar);
begin
    umFrmConContasPagar.ConhecaObj(vContasPagar);
    umFrmConContasPagar.showmodal;
end;

procedure Interfaces.PecaDadosContasReceber(vContasReceber: ContasReceber);
begin
    umFrmConContasReceber.ConhecaObj(vContasReceber);
    umFrmConContasReceber.showmodal;
end;

procedure Interfaces.PecaDadosEstado(vEstado: Estado);
begin
    umFrmConEstado.ConhecaObj(vEstado);
    umFrmConEstado.showmodal;
end;

procedure Interfaces.PecaDadosFormaPagamento(vFormaPagamento: FormaPagamento);
begin
    umFrmConFormaPagamento.ConhecaObj(vFormaPagamento);
    umFrmConFormaPagamento.showmodal
end;

procedure Interfaces.PecaDadosFornecedor(vFornecedor: Fornecedor; Tipo:String);
begin
    umFrmConFornecedor.ConhecaObj(vFornecedor, Tipo);
    umFrmConFornecedor.showmodal
end;

procedure Interfaces.PecaDadosFuncionario(vFuncionario: Funcionario);
begin
    umFrmConFuncionario.ConhecaObj(vFuncionario);
    umFrmConFuncionario.showmodal
end;

procedure Interfaces.PecaDadosMarca(vMarca: Marca);
begin
    umFrmConMarca.ConhecaObj(vMarca);
    umFrmConMarca.showmodal;
end;

procedure Interfaces.PecaDadosPais(vPais: Pais);
begin
    umFrmConPais.ConhecaObj(vPais);
    umFrmConPais.showmodal;
end;

procedure Interfaces.PecaDadosProduto(vProduto: Produto);
begin
    umFrmConProduto.ConhecaObj(vProduto);
    umFrmConProduto.ShowModal;
end;

procedure Interfaces.PecaDadosTransportadora(vTransportadora: Transportadora);
begin
    umFrmConTransportadora.ConhecaObj(vTransportadora);
    umFrmConTransportadora.ShowModal;
end;

procedure Interfaces.PecaDadosUnidade(vUnidade: Unidade);
begin
    umFrmConUnidade.ConhecaObj(vUnidade);
    umFrmConUnidade.ShowModal;
end;

procedure Interfaces.PecaDadosUsuario(vUsuario: Usuario);
begin
    umFrmConUsuario.ConhecaObj(vUsuario);
    umFrmConUsuario.ShowModal;
end;

procedure Interfaces.PecaDadosVenda(vVenda: Venda);
begin
    umFrmConVenda.ConhecaObj(vVenda);
    umFrmConVenda.ShowModal;
end;

end.
