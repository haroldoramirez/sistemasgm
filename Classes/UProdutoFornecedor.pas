unit UProdutoFornecedor;

interface
    uses Classes, UFornecedor;
    type ProdutoFornecedor = class

    protected
        umFornecedor : Fornecedor;
        ListaFornecedor : TList;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        procedure setUmFornecedor (vFornecedor : Fornecedor);
        function getUmFornecedor : Fornecedor;

        //Fornecedor
        procedure CrieObejtoFornecedor;
        procedure addFornecedor(vFornecedor : Fornecedor);
        procedure LimparListaFornecedor;
        procedure removeItemFornecedor(Index : Integer);
        function getFornecedor(fornecedor:Integer):Fornecedor;
        function CountFornecedores : Integer;
end;

implementation

{ FornecedorOS }

Constructor ProdutoFornecedor.CrieObjeto;
begin
  ListaFornecedor := TList.Create;
end;

Destructor ProdutoFornecedor.Destrua_Se;
begin

end;

procedure ProdutoFornecedor.setUmFornecedor(vFornecedor: Fornecedor);
begin
   umFornecedor := vFornecedor;
end;

function ProdutoFornecedor.getUmFornecedor: Fornecedor;
begin
   Result := umFornecedor;
end;

procedure ProdutoFornecedor.CrieObejtoFornecedor;
begin
   umFornecedor := Fornecedor.CrieObjeto;
end;

procedure ProdutoFornecedor.addFornecedor(vFornecedor: Fornecedor);
begin
   ListaFornecedor.Add(vFornecedor);
end;

function ProdutoFornecedor.CountFornecedores: Integer;
begin
   Result := ListaFornecedor.Count;
end;

function ProdutoFornecedor.getFornecedor(fornecedor: Integer): Fornecedor;
begin
     Result := ListaFornecedor[fornecedor];
end;

procedure ProdutoFornecedor.LimparListaFornecedor;
var i : Integer;
begin
  for i := 0 to ListaFornecedor.Count -1  do
    Fornecedor(ListaFornecedor[i]).Free;
  ListaFornecedor.Clear;
end;

procedure ProdutoFornecedor.removeItemFornecedor(Index: Integer);
begin
   ListaFornecedor.Delete(Index);
end;

end.
