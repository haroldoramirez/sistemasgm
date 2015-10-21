unit UContasReceber;

interface
    uses SysUtils, Classes, UCliente, UFormaPagamento, UUsuario, UParcelas,
    UCondicaoPagamento;
    type ContasReceber = class

    protected
        numNota           : Integer;
        serieNota         : string[2];
        numParcela        : Integer;
        umCliente         : Cliente;
        umUsuario         : Usuario;
        umaFormaPagamento : FormaPagamento;
        umaCondicaoPgto   : CondicaoPagamento;
        dataEmissao       : TDateTime;
        dataVencimento    : TDateTime;
        dataPagamento     : TDateTime;
        valor             : Real;
        multa             : Real;
        juros             : Real;
        desconto          : Real;
        TotalAux          : Real;
        status            : string[15];
        observacao        : string[255];
        umaParcela        : Parcelas;
        ListaParcelas     : TList;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setNumNota (vNumNota : Integer);
        Procedure setSerieNota (vSerieNota : string);
        Procedure setNumParcela (vNumParcela : Integer);
        Procedure setUmCliente (vCliente : Cliente);
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

        Function getNumNota : Integer;
        Function getSerieNota : string;
        Function getNumParcela : Integer;
        Function getUmCliente : Cliente;
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

{ ContasReceber }

constructor ContasReceber.CrieObjeto;
var dataAtual : TDateTime;
begin
  dataAtual         := Date;
  numNota           := 0;
  serieNota         := '';
  numParcela        := 0;
  umCliente         := Cliente.CrieObjeto;
  umUsuario         := Usuario.CrieObjeto;
  umaFormaPagamento := FormaPagamento.CrieObjeto;
  umaCondicaoPgto   := CondicaoPagamento.CrieObjeto;
  dataEmissao       := dataAtual;
  dataVencimento    := dataAtual;
  dataPagamento     := dataAtual;
  valor             := 0.0;
  multa             := 0.0;
  juros             := 0.0;
  desconto          := 0.0;
  TotalAux          := 0.0;
  status            := '';
  observacao        := '';
  ListaParcelas     := TList.Create;
end;

destructor ContasReceber.Destrua_Se;
begin
  ListaParcelas.Destroy;
end;

function ContasReceber.getDataEmissao: TDateTime;
begin
   Result := dataEmissao;
end;

function ContasReceber.getDataPagamento: TDateTime;
begin
   Result := dataPagamento;
end;

function ContasReceber.getDataVencimento: TDateTime;
begin
   Result := dataVencimento;
end;

function ContasReceber.getDesconto: Real;
begin
    Result := desconto;
end;

function ContasReceber.getJuros: Real;
begin
    Result := juros;
end;

function ContasReceber.getMulta: Real;
begin
    Result := multa;
end;

function ContasReceber.getNumNota: Integer;
begin
    Result := numNota;
end;

function ContasReceber.getNumParcela: Integer;
begin
    Result := numParcela;
end;

function ContasReceber.getObservacao: string;
begin
    Result := observacao;
end;

function ContasReceber.getSerieNota: string;
begin
    Result := serieNota;
end;

function ContasReceber.getStatus: string;
begin
    Result := status;
end;

function ContasReceber.getTotalAux: Real;
begin
  Result := TotalAux;
end;

function ContasReceber.getUmaCondicaoPagamento: CondicaoPagamento;
begin
  Result := umaCondicaoPgto;
end;

function ContasReceber.getUmaFormaPagamento: FormaPagamento;
begin
    Result := umaFormaPagamento;
end;

function ContasReceber.getUmaParcelas: Parcelas;
begin
    Result := umaParcela;
end;

function ContasReceber.getUmCliente: Cliente;
begin
    Result := umCliente;
end;

function ContasReceber.getUmUsuario: Usuario;
begin
    Result := umUsuario;
end;

function ContasReceber.getValor: Real;
begin
    Result := valor;
end;

procedure ContasReceber.setDataEmissao(vDataEmissao: TDateTime);
begin
    dataEmissao := vDataEmissao;
end;

procedure ContasReceber.setDataPagamento(vDataPagamento: TDateTime);
begin
    dataPagamento := vDataPagamento;
end;

procedure ContasReceber.setDataVencimento(vDataVencimento: TDateTime);
begin
    dataVencimento:= vDataVencimento;
end;

procedure ContasReceber.setDesconto(vDesconto: Real);
begin
    desconto := vDesconto;
end;

procedure ContasReceber.setJuros(vJuros: Real);
begin
    juros := vJuros;
end;

procedure ContasReceber.setMulta(vMulta: Real);
begin
    multa := vMulta;
end;

procedure ContasReceber.setNumNota(vNumNota: Integer);
begin
    numNota := vNumNota;
end;

procedure ContasReceber.setNumParcela(vNumParcela: Integer);
begin
    numParcela := vNumParcela;
end;

procedure ContasReceber.setObservacao(vObservacao: string);
begin
    observacao := vObservacao;
end;

procedure ContasReceber.setSerieNota(vSerieNota: string);
begin
    serieNota := vSerieNota;
end;

procedure ContasReceber.setStatus(vStatus: string);
begin
    status := vStatus;
end;

procedure ContasReceber.setTotalAux(vTotalAux: Real);
begin
  TotalAux := vTotalAux;
end;

procedure ContasReceber.setUmaCondicaoPagamento(vCondicaoPagamento: CondicaoPagamento);
begin
  umaCondicaoPgto := vCondicaoPagamento;
end;

procedure ContasReceber.setUmaFormaPagamento(vFormaPagamento: FormaPagamento);
begin
    umaFormaPagamento := vFormaPagamento;
end;

procedure ContasReceber.setUmaParcelas(vParcelas: Parcelas);
begin
    umaParcela := vParcelas;
end;

procedure ContasReceber.setUmCliente(vCliente: Cliente);
begin
    umCliente := vCliente;
end;

procedure ContasReceber.setUmUsuario(vUsuario: Usuario);
begin
    umUsuario := vUsuario;
end;

procedure ContasReceber.setValor(vValor: Real);
begin
    valor := vValor;
end;

//Parcelas
procedure ContasReceber.CrieObjetoParcela;
begin
  umaParcela := Parcelas.CrieObjeto;
end;
procedure ContasReceber.addParcelas(vParcelas: Parcelas);
begin
  ListaParcelas.Add(vParcelas);
end;

function ContasReceber.getParcelas(parcela: Integer): Parcelas;
begin
  Result := ListaParcelas[parcela];
end;

function ContasReceber.CountParcelas: Integer;
begin
  Result := ListaParcelas.Count;
end;

procedure ContasReceber.LimparListaParcelas;
var i : Integer;
begin
    for i := 0 to ListaParcelas.Count -1  do
      Parcelas(ListaParcelas[i]).Free;
    ListaParcelas.Clear;
end;

end.
