unit UFornecedor;

interface
    uses Classes, UPessoa, UCondicaoPagamento, UProduto;
    type Fornecedor = class(Pessoa)
    protected
      umaCondicaoPgto : CondicaoPagamento;
      TipoPessoa      : String[8];
      TipoFavorecido  : string[1];
      umProduto       : Produto;
      ListaProdutos   : TList;
    public
      verificaNome    : Boolean;
      verificaTel     : Boolean;
      constructor CrieObjeto;
      destructor destrua_se;

      Procedure setUmaCondicaoPgto (vCondicaoPgto : CondicaoPagamento);
      Procedure setTipoPessoa (vTipoPessoa : String);
      Procedure setTipoFavorecido (vTipoFavorecido : String);
      Procedure setUmProduto (vProduto : Produto);
      Function getUmaCondicaoPgto : CondicaoPagamento;
      Function getTipoPessoa : String;
      Function getTipoFavorecido : String;
      Function getUmProduto : Produto;

      //Produto
      procedure CrieObejtoProduto;
      procedure addProduto(vProduto : Produto);
      procedure LimparListaProduto;
      procedure removeItemProdutoVenda(Index : Integer);
      function getProduto(produto:Integer):Produto;
      function CountProdutos : Integer;
  end;
implementation

{ Fornecedor }

constructor Fornecedor.CrieObjeto;
begin
    inherited;
    TipoPessoa  := '';
    TipoFavorecido  := '';
    umaCondicaoPgto := CondicaoPagamento.CrieObjeto;
    ListaProdutos := TList.Create;
end;

destructor Fornecedor.destrua_se;
begin
   inherited;
end;

function Fornecedor.getTipoFavorecido: String;
begin
  Result := TipoFavorecido;
end;

function Fornecedor.getTipoPessoa: String;
begin
   Result := TipoPessoa;
end;

function Fornecedor.getUmaCondicaoPgto: CondicaoPagamento;
begin
   Result :=  umaCondicaoPgto;
end;

function Fornecedor.getUmProduto: Produto;
begin
   Result := umProduto;
end;

procedure Fornecedor.setTipoFavorecido(vTipoFavorecido: String);
begin
   TipoFavorecido := vTipoFavorecido;
end;

procedure Fornecedor.setTipoPessoa(vTipoPessoa: String);
begin
    TipoPessoa := vTipoPessoa;
end;

procedure Fornecedor.setUmaCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
    umaCondicaoPgto := vCondicaoPgto;
end;

procedure Fornecedor.setUmProduto(vProduto: Produto);
begin
   umProduto := vProduto;
end;

//Produto
procedure Fornecedor.CrieObejtoProduto;
begin
  umProduto := Produto.CrieObjeto;
end;

procedure Fornecedor.addProduto(vProduto: Produto);
begin
  ListaProdutos.Add(vProduto);
end;

function Fornecedor.CountProdutos: Integer;
begin
  Result := ListaProdutos.Count;
end;

procedure Fornecedor.LimparListaProduto;
var i : Integer;
begin
  for i := 0 to ListaProdutos.Count -1  do
    Produto(ListaProdutos[i]).Free;
  ListaProdutos.Clear;
end;

procedure Fornecedor.removeItemProdutoVenda(Index: Integer);
begin
  ListaProdutos.Delete(Index);
end;

function Fornecedor.getProduto(produto: Integer): Produto;
begin
  Result := ListaProdutos[produto];
end;

end.
