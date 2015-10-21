unit UVenda;

interface
    uses UCliente, UUsuario, UCondicaoPagamento, UProdutoVenda,
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    UParcelas, Dialogs, UCalcProduto;
    type Venda = class
    private
    protected
        numNota         : Integer;
        serieNota       : string[2];
        idOrdemServico  : Integer;
        umCliente       : Cliente;
        umUsuario       : Usuario;
        umaCondicaoPgto : CondicaoPagamento;
        umProdutoVenda  : ProdutoVenda;
        umCalcProduto   : CalcProduto;
        umaParcela      : Parcelas;
        ListaProdutos   : TList;
        ListaParcelas   : TList;
        ListaCalcProduto: TList;
        status          : string[15];
        TotalAux        : Real;
        dataCadastro    : TDateTime;
        dataAlteracao   : TDateTime;
        dataEmissao     : TDateTime;
        dataVenda       : TDateTime;
        observacao      : string[255];
        tipo            : Boolean; //Condição para verificar quando os dados vem de uma compra ou contas a pagar
    public
        indice : Integer;
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setNumNota (vNumNota : Integer);
        Procedure setSerieNota (vSerieNota : String);
        Procedure setIdOrdemServico (vIdOrdemServico : Integer);
        Procedure setUmCliente (vCliente : Cliente);
        Procedure setUmUsuario (vUsuario : Usuario);
        Procedure setUmaCondicaoPagamento (vCondicaoPagamento : CondicaoPagamento);
        procedure setumProdutoVenda (vProdutoVenda : ProdutoVenda);
        procedure setUmCalcProduto (vCalcProduto : CalcProduto);
        Procedure setStatus (vStatus : String);
        Procedure setTotalAux (vTotalAux : Real);
        Procedure setDataEmissao (vDataEmissao : TDateTime);
        Procedure setDataVenda (vDataVenda : TDateTime);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);
        Procedure setObservacao (vObservacao : String);
        Procedure setTipo (vTipo : Boolean);

        Function getNumNota : Integer;
        Function getSerieNota : String;
        Function getIdOrdemServico : Integer;
        Function getUmCliente : Cliente;
        Function getUmUsuario : Usuario;
        Function getUmaCondicaoPagamento : CondicaoPagamento;
        Function getUmProdutoVenda : ProdutoVenda;
        Function getUmCalcProduto : CalcProduto;
        Function getStatus : String;
        Function getTotalAux : Real;
        Function getDataEmissao : TDateTime;
        Function getDataVenda : TDateTime;
        Function getDataCadastro : TDateTime;
        Function getDataAlteracao : TDateTime;
        Function getObservacao : String;
        Function getTipo : Boolean;

        //Produto
        procedure CrieObejtoProduto;
        procedure addProdutoVenda(vProdutoVenda : ProdutoVenda);
        function getProdutoVenda(produto:Integer):ProdutoVenda;
        procedure LimparListaProduto;
        procedure removeItemProdutoVenda(Index : Integer);
        function CountProdutos : Integer;
        //Parcelas
        procedure CrieObjetoParcela;
        procedure addParcelas(vParcelas : Parcelas);
        function getParcelas(parcela:Integer):Parcelas;
        procedure LimparListaParcelas;
        function CountParcelas : Integer;
        //Calcular Produto
        procedure CrieObjetoCalcProduto;
        procedure addCalcProduto(vCalcProduto : CalcProduto);
        function getCalcProduto(calc:Integer): CalcProduto;
        procedure LimparListaCalcProduto;
        function CountCalcProduto : Integer;
end;

implementation

{ Venda }

constructor Venda.CrieObjeto;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    numNota         := 0;
    serieNota       := '';
    idOrdemServico  := 0;
    umCliente       := Cliente.CrieObjeto;
    umUsuario       := Usuario.CrieObjeto;
    umaCondicaoPgto := CondicaoPagamento.CrieObjeto;
    ListaProdutos   := TList.Create;
    ListaParcelas   := TList.Create;
    ListaCalcProduto:= TList.Create;
    status          := '';
    TotalAux        := 0;
    dataCadastro    := dataAtual;
    dataAlteracao   := dataAtual;
    dataEmissao     := dataAtual;
    dataVenda       := dataAtual;
    observacao      := '';
end;

destructor Venda.Destrua_Se;
begin
    ListaProdutos.Destroy;
    ListaParcelas.Destroy;
    ListaCalcProduto.Destroy;
end;

procedure Venda.addProdutoVenda(vProdutoVenda : ProdutoVenda);
begin
   ListaProdutos.Add(vProdutoVenda);
end;

function Venda.CountProdutos: Integer;
begin
    Result := ListaProdutos.Count;
end;

function Venda.CountCalcProduto: Integer;
begin
    Result := ListaCalcProduto.Count;
end;

function Venda.CountParcelas: Integer;
begin
    Result := ListaParcelas.Count;
end;

procedure Venda.CrieObejtoProduto;
begin
    umProdutoVenda  := ProdutoVenda.CrieObjeto;
end;

procedure Venda.CrieObjetoCalcProduto;
begin
    umCalcProduto := CalcProduto.CrieObjeto;
end;

procedure Venda.CrieObjetoParcela;
begin
    umaParcela  := Parcelas.CrieObjeto;
end;

function Venda.getDataAlteracao: TDateTime;
begin
    Result := dataAlteracao;
end;

function Venda.getDataCadastro: TDateTime;
begin
    Result := dataCadastro;
end;

function Venda.getDataEmissao: TDateTime;
begin
   Result := dataEmissao;
end;

function Venda.getDataVenda: TDateTime;
begin
   Result := dataVenda;
end;

function Venda.getIdOrdemServico: Integer;
begin
   Result := idOrdemServico;
end;

function Venda.getNumNota: Integer;
begin
    Result := numNota;
end;

function Venda.getObservacao: String;
begin
   Result := observacao;
end;

//function Venda.getProdutos: ProdutoVenda;
//begin
//    Result := ListaProdutos[indice-1];
//end;
//
function Venda.getParcelas(parcela: Integer): Parcelas;
begin
    Result := ListaParcelas[parcela];
end;

function Venda.getProdutoVenda(produto: Integer): ProdutoVenda;
begin
    Result := ListaProdutos[produto];
end;

function Venda.getCalcProduto(calc: Integer): CalcProduto;
begin
    Result := ListaCalcProduto[calc];
end;

function Venda.getSerieNota: String;
begin
    Result := serieNota;
end;

function Venda.getStatus: String;
begin
   Result := status;
end;

function Venda.getTotalAux: Real;
begin
    Result := TotalAux;
end;

function Venda.getUmaCondicaoPagamento: CondicaoPagamento;
begin
   Result := umaCondicaoPgto;
end;

function Venda.getUmCalcProduto: CalcProduto;
begin
   Result := umCalcProduto;
end;

function Venda.getUmCliente: Cliente;
begin
   Result := umCliente;
end;

function Venda.getUmUsuario: Usuario;
begin
   Result := umUsuario;
end;

function Venda.getUmProdutoVenda: ProdutoVenda;
begin
    Result := umProdutoVenda;
end;

procedure Venda.LimparListaParcelas;
var i : Integer;
begin
    for i := 0 to ListaParcelas.Count -1  do
      Parcelas(ListaParcelas[i]).Free;
    ListaParcelas.Clear;
end;

procedure Venda.LimparListaProduto;
var i : Integer;
begin
    for i := 0 to ListaProdutos.Count -1  do
      ProdutoVenda(ListaProdutos[i]).Free;
    ListaProdutos.Clear;
end;

procedure Venda.LimparListaCalcProduto;
var i : Integer;
begin
    for i := 0 to ListaCalcProduto.Count -1  do
      CalcProduto(ListaCalcProduto[i]).Free;
    ListaCalcProduto.Clear;
end;

procedure Venda.addParcelas(vParcelas: Parcelas);
begin
    ListaParcelas.Add(vParcelas);
end;

procedure Venda.addCalcProduto(vCalcProduto: CalcProduto);
begin
    ListaCalcProduto.Add(vCalcProduto);
end;

procedure Venda.removeItemProdutoVenda(Index: Integer);
begin
    ListaProdutos.Delete(Index);
end;

procedure Venda.setDataAlteracao(vDataAlteracao: TDateTime);
begin
    dataAlteracao := vDataAlteracao;
end;

procedure Venda.setDataCadastro(vDataCadastro: TDateTime);
begin
    dataCadastro := vDataCadastro;
end;

procedure Venda.setDataEmissao(vDataEmissao: TDateTime);
begin
    dataEmissao := vDataEmissao;
end;

procedure Venda.setDataVenda(vDataVenda: TDateTime);
begin
    dataVenda := vDataVenda;
end;

procedure Venda.setIdOrdemServico(vIdOrdemServico: Integer);
begin
    idOrdemServico := vIdOrdemServico;
end;

procedure Venda.setNumNota(vNumNota: Integer);
begin
    numNota := vNumNota;
end;

procedure Venda.setObservacao(vObservacao: String);
begin
    observacao := vObservacao;
end;

procedure Venda.setSerieNota(vSerieNota: String);
begin
   serieNota := vSerieNota;
end;

procedure Venda.setStatus(vStatus: String);
begin
    status := vStatus;
end;

procedure Venda.setTotalAux(vTotalAux: Real);
begin
    TotalAux := vTotalAux;
end;

procedure Venda.setUmaCondicaoPagamento(
  vCondicaoPagamento: CondicaoPagamento);
begin
    umaCondicaoPgto := vCondicaoPagamento;
end;

procedure Venda.setUmCalcProduto(vCalcProduto: CalcProduto);
begin
   umCalcProduto := vCalcProduto;
end;

procedure Venda.setUmCliente(vCliente: Cliente);
begin
    umCliente := vCliente;
end;

procedure Venda.setUmUsuario(vUsuario: Usuario);
begin
    umUsuario := vUsuario;
end;

procedure Venda.setumProdutoVenda(vProdutoVenda: ProdutoVenda);
begin
    umProdutoVenda := vProdutoVenda;
end;

//Tipo da Compra
procedure Venda.setTipo (vTipo : Boolean);
begin
    tipo := vTipo;
end;

function Venda.getTipo: Boolean;
begin
    Result := tipo
end;

end.
