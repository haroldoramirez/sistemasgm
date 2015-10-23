unit UAplicacao;

interface
    uses Dialogs, Messages, SysUtils, UInter,UGerente, UPais, UEstado, UCidade, UCliente, UFornecedor,
    UFuncionario, UMarca, UCategoria, UFormaPagamento, UProduto, UFrmConProduto,
    UCondicaoPagamento, UFrmConCondicaoPagamento, UVenda, UFrmConVenda, UCargo,
    UContasReceber, UCompra, UUsuario, UTransportadora,
    UContasPagar, UUnidade, UFrmAutenticacao,
    UVeiculo, UNcm;
    type Aplicacao = class

    private
    protected
          umaInter             : Interfaces;
          umGerente            : TGerente;
          umPais               : Pais;
          umEstado             : Estado;
          umaCidade            : Cidade;
          umCliente            : Cliente;
          umFornecedor         : Fornecedor;
          umFuncionario        : Funcionario;
          umaMarca             : Marca;
          umaCategoria         : Categoria;
          umaFormaPagamento    : FormaPagamento;
          umProduto            : Produto;
          umaCondicaoPagamento : CondicaoPagamento;
          umaVenda             : Venda;
          umCargo              : Cargo;
          umaContasReceber     : ContasReceber;
          umaContasPagar       : ContasPagar;
          umaCompra            : Compra;
          umUsuario            : Usuario;
          umaTransportadora    : Fornecedor;
          umaUnidade           : Unidade;
          umFrmAutenticacao    : TFrmAutenticacao;
          umVeiculo            : Veiculo;
          umNcm                : Ncm;
    public
          usuarioLogado : Usuario;
          constructor CrieObjeto;
          destructor Destrua_se;
          procedure Execute_se;
end;
var
  idLogado, idUserLogado   : Integer;
  nomeLogado : string[100];
  perfilUser : string[3];

implementation

{ Aplicacao }

constructor Aplicacao.CrieObjeto;
begin
     umaInter             := Interfaces.CrieObj;
     umGerente            := TGerente.create(nil);
     umPais               := Pais.CrieObjeto;
     umEstado             := Estado.CrieObjeto;
     umaCidade            := Cidade.CrieObjeto;
     umCliente            := Cliente.CrieObjeto;
     umFornecedor         := Fornecedor.CrieObjeto;
     umFuncionario        := Funcionario.CrieObjeto;
     umaMarca             := Marca.CrieObjeto;
     umaCategoria         := Categoria.CrieObjeto;
     umaFormaPagamento    := FormaPagamento.CrieObjeto;
     umProduto            := Produto.CrieObjeto;
     umaCondicaoPagamento := CondicaoPagamento.CrieObjeto;
     umaVenda             := Venda.CrieObjeto;
     umCargo              := Cargo.CrieObjeto;
     umaContasReceber     := ContasReceber.CrieObjeto;
     umaContasPagar       := ContasPagar.CrieObjeto;
     umaCompra            := Compra.CrieObjeto;
     umUsuario            := Usuario.CrieObjeto;
     umaTransportadora    := Fornecedor.CrieObjeto;
     umaUnidade           := Unidade.CrieObjeto;
     umVeiculo            := Veiculo.CrieObjeto;
     umNcm                := Ncm.CrieObjeto;
end;

destructor Aplicacao.Destrua_se;
begin
    umaInter.Destrua_se;
    umGerente.free;
    umPais.Destrua_se;
    umEstado.Destrua_Se;
    umaCidade.Destrua_Se;
    umCliente.Destrua_se;
    umFornecedor.Destrua_se;
    umFuncionario.Destrua_se;
    umaMarca.Destrua_Se;
    umaCategoria.Destrua_Se;
    umaFormaPagamento.Destrua_Se;
    umProduto.Destrua_Se;
    umaCondicaoPagamento.Destrua_Se;
    umaVenda.Destrua_Se;
    umCargo.Destrua_se;
    umaContasReceber.Destrua_Se;
    umaContasPagar.Destrua_Se;
    umaCompra.Destrua_se;
    umUsuario.Destrua_Se;
    umaTransportadora.Destrua_se;
    umaUnidade.Destrua_Se;
    umVeiculo.Destrua_Se;
    umNcm.Destrua_Se;
end;

procedure Aplicacao.Execute_se;
begin
    umFrmAutenticacao := TFrmAutenticacao.Create(nil);
    umFrmAutenticacao.conhecaObj(umUsuario);
    umFrmAutenticacao.ShowModal;
    idUserLogado  := umUsuario.getIdUsuario;
    idLogado      := umUsuario.getUmFuncionario.getId;
    nomeLogado    := umUsuario.getUmFuncionario.getNome_RazaoSoCial;
    perfilUser    := umUsuario.getPerfil;
    if umFrmAutenticacao.permitido then
    begin
      umGerente.ConhecaObj(umaInter,
                             umPais,
                             umEstado,
                             umaCidade,
                             umCliente,
                             umFornecedor,
                             umFuncionario,
                             umaMarca,
                             umaCategoria,
                             umaFormaPagamento,
                             umProduto,
                             umaCondicaoPagamento,
                             umaVenda,
                             umCargo,
                             umaContasReceber,
                             umaCompra,
                             umUsuario,
                             umaTransportadora,
                             umaContasPagar,
                             umaUnidade,
                             umVeiculo,
                             umNcm);
      umGerente.showmodal;
    end;
end;

end.
