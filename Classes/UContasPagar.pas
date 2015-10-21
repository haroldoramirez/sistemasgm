unit UContasPagar;

interface
    uses SysUtils, Classes, UFornecedor, UFormaPagamento, UUsuario, UParcelas,
    UCondicaoPagamento;
    type ContasPagar = class
    protected
      idcompra            : Integer;
      numNota             : Integer;
      serieNota           : string[2];
      numParcela          : Integer;
      umFornecedor        : Fornecedor;
      umUsuario           : Usuario;
      umaFormaPagamento   : FormaPagamento;
      umaCondicaoPgto     : CondicaoPagamento;
      dataEmissao         : TDateTime;
      dataVencimento      : TDateTime;
      dataPagamento       : TDateTime;
      valor               : Real;
      multa               : Real;
      juros               : Real;
      desconto            : Real;
      TotalAux            : Real;
      status              : string[15];
      observacao          : string[255];
      umaParcela          : Parcelas;
      ListaParcelas       : TList;
    public
      Constructor CrieObjeto;
      Destructor Destrua_Se;

      Procedure setIdCompra (vIdCompra : Integer);
      Procedure setNumNota (vNumNota : Integer);
      Procedure setSerieNota (vSerieNota : string);
      Procedure setNumParcela (vNumParcela : Integer);
      Procedure setUmFornecedor (vFornecedor : Fornecedor);
      Procedure setUmUsuario (vUsuario : Usuario);
      Procedure setUmaFormaPagamento (vFormaPagamento : FormaPagamento);
      Procedure setUmaCondicaoPagamento (vCondicaoPagamento : CondicaoPagamento);
      Procedure setUmaParcelas (vParcelas : Parcelas);
      Procedure setDataEmissao (vDataEmissao : TDateTime);
      Procedure setDataVencimento (vDataVencimento : TDateTime);
      Procedure setDataPagamento (vDataPagamento : TDateTime);
      Procedure setValor (vValor : Real);
      Procedure setMulta (vMulta : Real);
      Procedure setJuros (vJuros : Real);
      Procedure setDesconto (vDesconto : Real);
      Procedure setTotalAux (vTotalAux : Real);
      Procedure setStatus (vStatus : string);
      Procedure setObservacao (vObservacao : string);

      Function getIdCompra : Integer;
      Function getNumNota : Integer;
      Function getSerieNota : string;
      Function getNumParcela : Integer;
      Function getUmFornecedor : Fornecedor;
      Function getUmUsuario : Usuario;
      Function getUmaFormaPagamento : FormaPagamento;
      Function getUmaCondicaoPagamento : CondicaoPagamento;
      Function getUmaParcelas : Parcelas;
      Function getDataEmissao : TDateTime;
      Function getDataVencimento : TDateTime;
      Function getDataPagamento : TDateTime;
      Function getValor : Real;
      Function getMulta : Real;
      Function getJuros : Real;
      Function getDesconto : Real;
      Function getTotalAux : Real;
      Function getStatus : string;
      Function getObservacao : string;

      //Parcelas
      procedure CrieObjetoParcela;
      procedure addParcelas(vParcelas : Parcelas);
      procedure LimparListaParcelas;
      function getParcelas(parcela:Integer):Parcelas;
      function CountParcelas : Integer;
end;

implementation

{ ContasPagar }

constructor ContasPagar.CrieObjeto;
var dataAtual : TDateTime;
begin
  dataAtual         := Date;
  idcompra          := 0;
  numNota           := 0;
  serieNota         := '';
  numParcela        := 0;
  umFornecedor      := Fornecedor.CrieObjeto;
  umUsuario         := Usuario.CrieObjeto;
  umaFormaPagamento := FormaPagamento.CrieObjeto;
  umaCondicaoPgto   := CondicaoPagamento.CrieObjeto;
  dataEmissao       := dataAtual;
  dataVencimento    := dataAtual;
  valor             := 0.0;
  multa             := 0.0;
  juros             := 0.0;
  desconto          := 0.0;
  TotalAux          := 0.0;
  status            := '';
  observacao        := '';
  ListaParcelas     := TList.Create;
end;

destructor ContasPagar.Destrua_Se;
begin
    ListaParcelas.Destroy;
end;

function ContasPagar.getDataEmissao: TDateTime;
begin
   Result := dataEmissao;
end;

function ContasPagar.getIdCompra: Integer;
begin
    Result := idcompra;
end;

function ContasPagar.getDataPagamento: TDateTime;
begin
   Result := dataPagamento;
end;

function ContasPagar.getDataVencimento: TDateTime;
begin
   Result := dataVencimento;
end;

function ContasPagar.getDesconto: Real;
begin
    Result := desconto;
end;

function ContasPagar.getJuros: Real;
begin
    Result := juros;
end;

function ContasPagar.getMulta: Real;
begin
    Result := multa;
end;

function ContasPagar.getNumNota: Integer;
begin
    Result := numNota;
end;

function ContasPagar.getNumParcela: Integer;
begin
    Result := numParcela;
end;

function ContasPagar.getObservacao: string;
begin
    Result := observacao;
end;

function ContasPagar.getSerieNota: string;
begin
    Result := serieNota;
end;

function ContasPagar.getStatus: string;
begin
    Result := status;
end;

function ContasPagar.getTotalAux: Real;
begin
    Result := TotalAux;
end;

function ContasPagar.getUmaCondicaoPagamento: CondicaoPagamento;
begin
    Result := umaCondicaoPgto
end;

function ContasPagar.getUmaFormaPagamento: FormaPagamento;
begin
    Result := umaFormaPagamento;
end;

function ContasPagar.getUmaParcelas: Parcelas;
begin
    Result := umaParcela;
end;

function ContasPagar.getUmFornecedor: Fornecedor;
begin
    Result := umFornecedor;
end;

function ContasPagar.getUmUsuario: Usuario;
begin
    Result := umUsuario;
end;

function ContasPagar.getValor: Real;
begin
    Result := valor;
end;

procedure ContasPagar.setDataEmissao(vDataEmissao: TDateTime);
begin
    dataEmissao := vDataEmissao;
end;

procedure ContasPagar.setIdCompra(vIdCompra: Integer);
begin
    idcompra := vIdCompra;
end;

procedure ContasPagar.setDataPagamento(vDataPagamento: TDateTime);
begin
    dataPagamento := vDataPagamento;
end;

procedure ContasPagar.setDataVencimento(vDataVencimento: TDateTime);
begin
    dataVencimento:= vDataVencimento;
end;

procedure ContasPagar.setDesconto(vDesconto: Real);
begin
    desconto := vDesconto;
end;

procedure ContasPagar.setJuros(vJuros: Real);
begin
    juros := vJuros;
end;

procedure ContasPagar.setMulta(vMulta: Real);
begin
    multa := vMulta;
end;

procedure ContasPagar.setNumNota(vNumNota: Integer);
begin
    numNota := vNumNota;
end;

procedure ContasPagar.setNumParcela(vNumParcela: Integer);
begin
    numParcela := vNumParcela;
end;

procedure ContasPagar.setObservacao(vObservacao: string);
begin
    observacao := vObservacao;
end;

procedure ContasPagar.setSerieNota(vSerieNota: string);
begin
    serieNota := vSerieNota;
end;

procedure ContasPagar.setStatus(vStatus: string);
begin
    status := vStatus;
end;

procedure ContasPagar.setTotalAux(vTotalAux: Real);
begin
    TotalAux := vTotalAux;
end;

procedure ContasPagar.setUmaCondicaoPagamento(vCondicaoPagamento: CondicaoPagamento);
begin
    umaCondicaoPgto := vCondicaoPagamento;
end;

procedure ContasPagar.setUmaFormaPagamento(vFormaPagamento: FormaPagamento);
begin
    umaFormaPagamento := vFormaPagamento;
end;

procedure ContasPagar.setUmaParcelas(vParcelas: Parcelas);
begin
    umaParcela := vParcelas;
end;

procedure ContasPagar.setUmFornecedor(vFornecedor: Fornecedor);
begin
    umFornecedor := vFornecedor;
end;

procedure ContasPagar.setUmUsuario(vUsuario: Usuario);
begin
    umUsuario := vUsuario;
end;

procedure ContasPagar.setValor(vValor: Real);
begin
    valor := vValor;
end;

//Parcelas
procedure ContasPagar.CrieObjetoParcela;
begin
    umaParcela := Parcelas.CrieObjeto;
end;

procedure ContasPagar.addParcelas(vParcelas: Parcelas);
begin
    ListaParcelas.Add(vParcelas);
end;

function ContasPagar.getParcelas(parcela: Integer): Parcelas;
begin
    Result := ListaParcelas[parcela];
end;

function ContasPagar.CountParcelas: Integer;
begin
    Result := ListaParcelas.Count;
end;

procedure ContasPagar.LimparListaParcelas;
var i : Integer;
begin
    for i := 0 to ListaParcelas.Count -1  do
      Parcelas(ListaParcelas[i]).Free;
    ListaParcelas.Clear;
end;

end.
