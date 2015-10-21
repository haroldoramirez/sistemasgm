unit UCompra;

interface
    uses SysUtils, UCondicaoPagamento, UUsuario, UFornecedor, UProdutoCompra,
    UParcelas, UTransportadora, Classes;
    type Compra = class
    protected
        idcompra          : Integer;
        numNota           : Integer;
        serieNota         : string[2];
        umFornecedor      : Fornecedor;
        umaTransportadora : Fornecedor;
        umUsuario         : Usuario;
        umaCondicaoPgto   : CondicaoPagamento;
        baseICMS          : Real;
        valorDesconto     : Real;
        valorFrete        : Real;
        totalICMS         : Real;
        totalIPI          : Real;
        totalProduto      : Real;
        totalNota         : Real;
        tipoFrete         : Integer;
        status            : string[15];
        dataEmissao       : TDateTime;
        dataCompra        : TDateTime;
        observacao        : string[255];
        umProdutoCompra   : ProdutoCompra;
        umaParcela        : Parcelas;
        ListaProdutos     : TList;
        ListaParcelas     : TList;
        dataCadastro      : TDateTime;
        dataAlteracao     : TDateTime;
        tipo              : Boolean; //Condição para verificar quando os dados vem de uma venda ou contas a receber
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setIdCompra (vIdCompra : Integer);
        Procedure setNumNota (vNumNota : Integer);
        Procedure setSerieNota (vSerieNota : String);
        Procedure setUmFornecedor (vFornecedor : Fornecedor);
        Procedure setUmUsuario (vUsuario : Usuario);
        Procedure setUmaCondicaoPagamento (vCondicaoPagamento : CondicaoPagamento);
        Procedure setUmaTransportadora (vTransportadora : Fornecedor);
        procedure setumProdutoCompra (vProdutoCompra : ProdutoCompra);
        procedure setBaseICMS (vBaseICMS : Real);
        procedure setValorDesconto (vValorDesconto : Real);
        procedure setValorFrete (vValorFrete : Real);
        procedure setTotalICMS (vTotalICMS : Real);
        procedure setTotalIPI (vTotalIPI : Real);
        procedure setTotalProduto (vTotalProduto : Real);
        procedure setTotalNota (vTotalNota : Real);
        procedure setTipoFrete (vTipoFrete : Integer);
        Procedure setStatus (vStatus : String);
        Procedure setDataEmissao (vDataEmissao : TDateTime);
        Procedure setDataCompra (vDataCompra : TDateTime);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);
        Procedure setObservacao (vObservacao : String);
        Procedure setTipo (vTipo : Boolean);

        Function getIdCompra : Integer;
        Function getNumNota : Integer;
        Function getSerieNota : String;
        Function getUmFornecedor : Fornecedor;
        Function getUmUsuario : Usuario;
        Function getUmaCondicaoPagamento : CondicaoPagamento;
        Function getUmaTransportadora : Fornecedor;
        Function getumProdutoCompra : ProdutoCompra;
        Function getBaseICMS : Real;
        Function getValorDesconto : Real;
        Function getValorFrete : Real;
        Function getTotalICMS : Real;
        Function getTotalIPI : Real;
        Function getTotalProduto : Real;
        Function getTotalNota : Real;
        Function getTipoFrete : Integer;
        Function getStatus : String;
        Function getDataEmissao : TDateTime;
        Function getDataCompra : TDateTime;
        Function getDataCadastro : TDateTime;
        Function getDataAlteracao : TDateTime;
        Function getObservacao : String;
        Function getTipo : Boolean;


        //Produto
        procedure CrieObejtoProduto;
        procedure addProdutoCompra(vProdutoCompra : ProdutoCompra);
        function getProdutoCompra(produto:Integer):ProdutoCompra;
        procedure LimparListaProduto;
        procedure removeItemProdutoCompra(Index : Integer);
        function CountProdutos : Integer;
        //Parcelas
        procedure CrieObjetoParcela;
        procedure addParcelas(vParcelas : Parcelas);
        procedure LimparListaParcelas;
        function getParcelas(parcela:Integer):Parcelas;
        function CountParcelas : Integer;
    end;

implementation

{ Compra }

constructor Compra.CrieObjeto;
var dataAtual : TDateTime;
begin
    dataAtual         := Date;
    idcompra          := 0;
    numNota           := 0;
    serieNota         := '';
    umFornecedor      := Fornecedor.CrieObjeto;
    umUsuario         := Usuario.CrieObjeto;
    umaCondicaoPgto   := CondicaoPagamento.CrieObjeto;
    umaTransportadora := Fornecedor.CrieObjeto;
    valorDesconto     := 0.0;
    valorFrete        := 0.0;
    totalICMS         := 0.0;
    totalIPI          := 0.0;
    tipoFrete         := Integer(Nil);
    status            := '';
    observacao        := '';
    ListaProdutos     := TList.Create;
    ListaParcelas     := TList.Create;
    dataCadastro      := dataAtual;
    dataAlteracao     := dataAtual;
end;

destructor Compra.Destrua_Se;
begin
    ListaProdutos.Destroy;
    ListaParcelas.Destroy;
end;

function Compra.getBaseICMS: Real;
begin
    Result := BaseICMS;
end;

function Compra.getDataAlteracao: TDateTime;
begin
    Result := dataAlteracao;
end;

function Compra.getDataCadastro: TDateTime;
begin
    Result := dataCadastro;
end;

function Compra.getDataCompra: TDateTime;
begin
    Result := dataCompra;
end;

function Compra.getDataEmissao: TDateTime;
begin
    Result := dataEmissao;
end;

function Compra.getIdCompra: Integer;
begin
    Result := idcompra;
end;

function Compra.getNumNota: Integer;
begin
    Result := numNota;
end;

function Compra.getObservacao: String;
begin
    Result := observacao;
end;

function Compra.getSerieNota: String;
begin
    Result := serieNota;
end;

function Compra.getStatus: String;
begin
    Result := status;
end;

function Compra.getTipoFrete: Integer;
begin
    Result := tipoFrete;
end;

function Compra.getTotalICMS: Real;
begin
    Result := totalICMS;
end;

function Compra.getTotalIPI: Real;
begin
    Result := totalIPI;
end;

function Compra.getTotalNota: Real;
begin
    Result := totalNota;
end;

function Compra.getTotalProduto: Real;
begin
   Result := totalProduto;
end;

function Compra.getUmaTransportadora: Fornecedor;
begin
    Result := umaTransportadora;
end;

function Compra.getUmaCondicaoPagamento: CondicaoPagamento;
begin
    Result := umaCondicaoPgto;
end;

function Compra.getUmFornecedor: Fornecedor;
begin
    Result := umFornecedor;
end;

function Compra.getumProdutoCompra: ProdutoCompra;
begin
    Result := umProdutoCompra;
end;

function Compra.getUmUsuario: Usuario;
begin
    Result := umUsuario;
end;

function Compra.getValorDesconto: Real;
begin
    Result := valorDesconto;
end;

function Compra.getValorFrete: Real;
begin
    Result := valorFrete;
end;

procedure Compra.setBaseICMS(vBaseICMS: Real);
begin
    baseICMS := vBaseICMS;
end;

procedure Compra.setDataAlteracao(vDataAlteracao: TDateTime);
begin
    dataAlteracao := vDataAlteracao;
end;

procedure Compra.setDataCadastro(vDataCadastro: TDateTime);
begin
    dataCadastro := vDataCadastro;
end;

procedure Compra.setDataCompra(vDataCompra: TDateTime);
begin
    dataCompra := vDataCompra;
end;

procedure Compra.setDataEmissao(vDataEmissao: TDateTime);
begin
    dataEmissao := vDataEmissao;
end;

procedure Compra.setIdCompra(vIdCompra: Integer);
begin
    idcompra := vIdCompra;
end;

procedure Compra.setNumNota(vNumNota: Integer);
begin
    numNota := vNumNota;
end;

procedure Compra.setObservacao(vObservacao: String);
begin
    observacao := vObservacao;
end;

procedure Compra.setSerieNota(vSerieNota: String);
begin
    serieNota := vSerieNota;
end;

procedure Compra.setStatus(vStatus: String);
begin
    status := vStatus;
end;

procedure Compra.setTipoFrete(vTipoFrete: Integer);
begin
    tipoFrete := vTipoFrete;
end;

procedure Compra.setTotalICMS(vTotalICMS: Real);
begin
    totalICMS := vTotalICMS;
end;

procedure Compra.setTotalIPI(vTotalIPI: Real);
begin
    totalIPI := vTotalIPI;
end;

procedure Compra.setTotalNota(vTotalNota: Real);
begin
    totalNota := vTotalNota;
end;

procedure Compra.setTotalProduto(vTotalProduto: Real);
begin
    totalProduto := vTotalProduto;
end;

procedure Compra.setUmaCondicaoPagamento(vCondicaoPagamento: CondicaoPagamento);
begin
    umaCondicaoPgto := vCondicaoPagamento
end;

procedure Compra.setUmaTransportadora(vTransportadora: Fornecedor);
begin
    umaTransportadora := vTransportadora;
end;

procedure Compra.setUmFornecedor(vFornecedor: Fornecedor);
begin
    umFornecedor := vFornecedor;
end;

procedure Compra.setumProdutoCompra(vProdutoCompra: ProdutoCompra);
begin
    umProdutoCompra := vProdutoCompra;
end;

procedure Compra.setUmUsuario(vUsuario: Usuario);
begin
   umUsuario := vUsuario;
end;

procedure Compra.setValorDesconto(vValorDesconto: Real);
begin
    valorDesconto := vValorDesconto;
end;

procedure Compra.setValorFrete(vValorFrete: Real);
begin
    valorFrete := vValorFrete;
end;

//Produto
procedure Compra.CrieObejtoProduto;
begin
   umProdutoCompra := ProdutoCompra.CrieObjeto;
end;

procedure Compra.addProdutoCompra(vProdutoCompra: ProdutoCompra);
begin
   ListaProdutos.Add(vProdutoCompra);
end;

function Compra.getProdutoCompra(produto: Integer): ProdutoCompra;
begin
   Result := ListaProdutos[produto];
end;

function Compra.CountProdutos: Integer;
begin
   Result := ListaProdutos.Count;
end;

procedure Compra.LimparListaProduto;
var i : Integer;
begin
    for i := 0 to ListaProdutos.Count -1  do
      ProdutoCompra(ListaProdutos[i]).Free;
    ListaProdutos.Clear;
end;

procedure Compra.removeItemProdutoCompra(Index: Integer);
begin
    ListaProdutos.Delete(Index);
end;

//Parcelas
procedure Compra.CrieObjetoParcela;
begin
    umaParcela := Parcelas.CrieObjeto;
end;

procedure Compra.addParcelas(vParcelas: Parcelas);
begin
    ListaParcelas.Add(vParcelas);
end;

function Compra.getParcelas(parcela: Integer): Parcelas;
begin
    Result := ListaParcelas[parcela];
end;

function Compra.CountParcelas: Integer;
begin
    Result := ListaParcelas.Count;
end;

procedure Compra.LimparListaParcelas;
var i : Integer;
begin
    for i := 0 to ListaParcelas.Count -1  do
      Parcelas(ListaParcelas[i]).Free;
    ListaParcelas.Clear;
end;

//Tipo da Compra
procedure Compra.setTipo (vTipo : Boolean);
begin
    tipo := vTipo;
end;

function Compra.getTipo: Boolean;
begin
    Result := tipo
end;

end.
