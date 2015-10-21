unit UDaoContasPagar;

interface
      uses uDao, DB, SysUtils, Messages, UContasPagar, UDaoFornecedor,
      UDaoFormaPagamento, UDaoUsuario;
      type DaoContasPagar = class(Dao)
      private

      protected
        umaContasPagar       : ContasPagar;
        umaDaoFornecedor     : DaoFornecedor;
        umaDaoUsuario        : DaoUsuario;
        umaDaoFormaPagamento : DaoFormaPagamento;
      public
        Constructor CrieObjeto;
        Destructor Destrua_se;
        function Salvar(obj:TObject): string;      override;
        function GetDS : TDataSource;              override;
        function Carrega(obj:TObject): TObject;    override;
        function Buscar(obj : TObject) : Boolean;  override;
        function Excluir(obj : TObject) : string ; override;
        function VerificarNota (obj : TObject) : Boolean;
        function VerificarContas (obj : TObject) : Boolean;
        function VerificarParcelas (obj : TObject) : Boolean;
        procedure VerificarCompra (obj : TObject);
        function ContarContasPagar(obj : TObject) : Integer;
        procedure AtualizaGrid;
        procedure Ordena(campo: string);
end;

implementation

uses UCtrlCompra, UCompra;

{ DaoContasPagar }

function DaoContasPagar.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umaContasPagar: ContasPagar;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umaContasPagar := ContasPagar(obj);
    sql := 'select * from contapagar conta';
    if umaContasPagar.getUmFornecedor.getNome_RazaoSoCial <> '' then
    begin
        //Buscar a descricao do fornecedor na tabela fornecedor
        sql := sql+' INNER JOIN fornecedor c ON conta.idfornecedor = c.idfornecedor and c.nome_razaosocial like '+quotedstr('%'+umaContasPagar.getUmFornecedor.getNome_RazaoSoCial+'%');
        if (prim) and (umaContasPagar.getStatus <> '')then
         begin
            prim := false;
            sql := sql+onde;
        end
    end;
    if umaContasPagar.getStatus <> '' then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end;
        sql := sql+' conta.status like '+quotedstr('%'+umaContasPagar.getStatus+'%'); //COLOCA CONDIÇAO NO SQL
    end;
    if (DateToStr(umaContasPagar.getDataEmissao) <> '30/12/1899') and (datetostr(umaContasPagar.getDataPagamento) <> '30/12/1899') then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' dataemissao between '+QuotedStr(DateToStr(umaContasPagar.getDataEmissao))+' and '+QuotedStr(DateToStr(umaContasPagar.getDataPagamento));
    end;

    with umDM do
    begin
        QContasPagar.Close;
        QContasPagar.sql.Text := sql+' order by numnota, serienota, numparcela';
        QContasPagar.Open;
        if QContasPagar.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoContasPagar.VerificarNota(obj: TObject): Boolean;
var sql : string;
    umaContaPagar : ContasPagar;
    i : Integer;
begin
  umaContaPagar := ContasPagar(obj);
  for i := 1 to 2 do
  begin
    if i = 1 then
      umaContaPagar.setStatus('PAGA')
    else
      umaContaPagar.setStatus('PENDENTE');

    sql := 'select * from contapagar where numnota = '+IntToStr(umaContaPagar.getNumNota)+' and serienota = '''+umaContaPagar.getSerieNota+ ''' and idfornecedor = '+IntToStr(umaContaPagar.getUmFornecedor.getId)+' and status = '''+umaContaPagar.getStatus+'''';
    with umDM do
    begin
      QContasPagar.Close;
      QContasPagar.sql.Text := sql+' order by numnota, serienota, numparcela';
      QContasPagar.Open;
      if QContasPagar.RecordCount > 0 then
      begin
        result := True;
        Self.AtualizaGrid;
        Exit;
      end
      else
        result := false;
    end;
  end;
  Self.AtualizaGrid;
end;

function DaoContasPagar.VerificarContas (obj : TObject) : Boolean;
var sql : string;
    umaContaPagar : ContasPagar;
begin
  umaContaPagar := ContasPagar(obj);
  sql := 'select * from contapagar where numnota = '+IntToStr(umaContaPagar.getNumNota)+' and serienota = '''+umaContaPagar.getSerieNota+ ''' and idfornecedor = '+IntToStr(umaContaPagar.getUmFornecedor.getId)+'';
  if(umaContaPagar.getStatus <> '')then
    sql := sql +' and status = '''+umaContaPagar.getStatus+'''';

  with umDM do
  begin
    QContasPagar.Close;
    QContasPagar.sql.Text := sql;
    QContasPagar.Open;
    if QContasPagar.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
  Self.AtualizaGrid;
end;

function DaoContasPagar.VerificarParcelas (obj : TObject) : Boolean;
var umaContaPagar : ContasPagar;
begin
  umaContaPagar := ContasPagar(obj);

  with umDM do
  begin
    QContasPagar.Close;
    QContasPagar.sql.Text := 'select * from contapagar where numnota = '+IntToStr(umaContaPagar.getNumNota)+' and serienota = '''+umaContaPagar.getSerieNota+ ''' and idfornecedor = '+IntToStr(umaContaPagar.getUmFornecedor.getId)+' order by numparcela';;
    QContasPagar.Open;

    while not QContasPagar.Eof do
    begin
      if (QContasPagarstatus.AsString = 'PENDENTE') then
        if(umaContaPagar.getNumParcela = QContasPagarnumparcela.AsInteger) then
        begin
          Result := True;
          Break;
        end
        else
        begin
          Result := False;
          Break;
        end;
        QContasPagar.Next;
    end;
    Self.AtualizaGrid;
  end;
end;

procedure DaoContasPagar.VerificarCompra (obj : TObject);
var umaCtrlCompra : CtrlCompra;
    umaCompra     : Compra;
begin
  umaContasPagar := ContasPagar(obj);
  umaCtrlCompra  := CtrlCompra.CrieObjeto;
  umaCompra      := Compra.CrieObjeto;
  umaCompra.setNumNota(umaContasPagar.getNumNota);
  umaCompra.setSerieNota(umaContasPagar.getSerieNota);
  umaCompra.getUmFornecedor.setId(umaContasPagar.getUmFornecedor.getId);
  if (umaCtrlCompra.VerificarNota(umaCompra)) then
  begin
    umaCtrlCompra.Carrega(umaCompra);
    umaCompra.setStatus('CANCELADA');
    umaCompra.setTipo(False);
    umaCtrlCompra.Salvar(umaCompra)
  end;
end;

function DaoContasPagar.ContarContasPagar(obj : TObject) : Integer;
var count : Integer;
begin
  count := 0;
  umaContasPagar := ContasPagar(obj);
  with umDM do
  begin
    QContasPagar.Close;
    QContasPagar.SQL.Text := 'select * from contapagar where numnota = '+IntToStr(umaContasPagar.getNumNota)+ ' and serienota = '''+umaContasPagar.getSerieNota+'''';
    QContasPagar.Open;
    QContasPagar.First;

    if umaContasPagar.CountParcelas <> 0 then
      umaContasPagar.LimparListaParcelas;

    while not QContasPagar.Eof do
    begin
    count := count + 1;
    umaContasPagar.CrieObjetoParcela;
    umaContasPagar.addParcelas(umaContasPagar.getUmaParcelas);
    umaContasPagar.getParcelas(count-1).setNumParcela(QContasPagarnumparcela.AsInteger);
    QContasPagar.Next;
    end;
  end;
  Result := count;
end;

procedure DaoContasPagar.AtualizaGrid;
begin
  with umDM do
  begin
    QContasPagar.Close;
    QContasPagar.sql.Text := 'select * from contapagar order by numnota, serienota, numparcela';
    QContasPagar.Open;
  end;
end;

function DaoContasPagar.Carrega(obj: TObject): TObject;
var umaContasPagar: ContasPagar;
    count : Integer;
begin
    umaContasPagar := ContasPagar(obj);
    count := 0;
    with umDM do
    begin
        if not QContasPagar.Active then
            QContasPagar.Open;
//
//        if umaContasPagar.getId <> 0 then
//          begin
//            QContasPagar.Close;
//            QContasPagar.SQL.Text := 'select * from estado where idestado = '+IntToStr(umaContasPagar.getId);
//            QContasPagar.Open;
//          end;
//
        umaContasPagar.setIdCompra(QContasPagaridcompra.AsInteger);
        umaContasPagar.setNumNota(QContasPagarnumnota.AsInteger);
        umaContasPagar.setSerieNota(QContasPagarserienota.AsString);
        umaContasPagar.setNumParcela(QContasPagarnumparcela.AsInteger);
        umaContasPagar.setDataEmissao(QContasPagardataemissao.AsDateTime);
        umaContasPagar.setDataVencimento(QContasPagardatavencimento.AsDateTime);
        umaContasPagar.setDataPagamento(QContasPagardatapagamento.AsDateTime);
        umaContasPagar.setValor(QContasPagarvalor.AsFloat);
        umaContasPagar.setMulta(QContasPagarmulta.AsFloat);
        umaContasPagar.setJuros(QContasPagarjuros.AsFloat);
        umaContasPagar.setDesconto(QContasPagardesconto.AsFloat);
        umaContasPagar.setStatus(QContasPagarstatus.AsString);
        umaContasPagar.setObservacao(QContasPagarobservacao.AsString);

        // Busca o Fornecedor referente ao ContasPagar
        umaContasPagar.getUmFornecedor.setId(QContasPagaridfornecedor.AsInteger);
        umaDaoFornecedor.Carrega(umaContasPagar.getUmFornecedor);

        // Busca o Usuario referente ao ContasPagar
        umaContasPagar.getUmUsuario.setIdUsuario(QContasPagaridusuario.AsInteger);
        umaDaoUsuario.Carrega(umaContasPagar.getUmUsuario);

        // Busca a Forma de Pagamento referente ao ContasPagar
        umaContasPagar.getUmaFormaPagamento.setId(QContasPagaridformapagamento.AsInteger);
        umaDaoFormaPagamento.Carrega(umaContasPagar.getUmaFormaPagamento);

        //Cria uma Parcela referente a que foi selecionada na grid apenas para percorrer o FOR na hora de salvar
        umaContasPagar.getUmaCondicaoPagamento.addParcela;
        umaContasPagar.addParcelas(umaContasPagar.getUmaCondicaoPagamento.getParcela);

    end;
    result := umaContasPagar;
    Self.AtualizaGrid;
end;

constructor DaoContasPagar.CrieObjeto;
begin
  inherited;
  umaDaoFornecedor     := DaoFornecedor.CrieObjeto;
  umaDaoUsuario        := DaoUsuario.CrieObjeto;
  umaDaoFormaPagamento := DaoFormaPagamento.CrieObjeto;
end;

destructor DaoContasPagar.Destrua_se;
begin
    inherited;
end;

function DaoContasPagar.Excluir(obj: TObject): string;
var
    umaContasPagar: ContasPagar;
begin
//    umaContasPagar := ContasPagar(obj);
//    with umDM do
//    begin
//        try
//            beginTrans;
//            QContasPagar.SQL := UpdateContasPagar.DeleteSQL;
//            QContasPagar.Params.ParamByName('OLD_idestado').Value := umaContasPagar.getId;
//            QContasPagar.ExecSQL;
//            Commit;
//            result := 'ContasPagar excluído com sucesso!';
//        except
//            on e:Exception do
//            begin
//                rollback;
//                if pos('chave estrangeira',e.Message)>0 then
//                    result := 'Ocorreu um erro! O ContasPagar não pode ser excluído pois ja está sendo usado pelo sistema.'
//                else
//                    result := 'Ocorreu um erro! ContasPagar não foi excluído. Erro: '+e.Message;
//            end;
//        end;
//    end;
//    Self.AtualizaGrid;
end;

function DaoContasPagar.GetDS: TDataSource;
begin
    //------Formatar Grid--------//

    (umDM.QContasPagar.FieldByName('valor') as TFloatField).DisplayFormat := '0.00'; //Formatar o campo valor do tipo Float
    (umDM.QContasPagar.FieldByName('multa') as TFloatField).DisplayFormat := '0.00';
    (umDM.QContasPagar.FieldByName('juros') as TFloatField).DisplayFormat := '0.00';
    (umDM.QContasPagar.FieldByName('desconto') as TFloatField).DisplayFormat := '0.00';

    umDM.QContasPagar.FieldByName('numnota').DisplayLabel := 'NN';
    umDM.QContasPagar.FieldByName('serienota').DisplayLabel := 'SN';
    umDM.QContasPagar.FieldByName('numparcela').DisplayLabel := 'P';

    umDM.QContasPagar.FieldByName('numnota').DisplayWidth := 5;
    umDM.QContasPagar.FieldByName('serienota').DisplayWidth := 5;
    umDM.QContasPagar.FieldByName('numparcela').DisplayWidth := 5;

    umDM.QContasPagar.FieldByName('valor').DisplayWidth := 10;
    umDM.QContasPagar.FieldByName('multa').DisplayWidth := 5;
    umDM.QContasPagar.FieldByName('juros').DisplayWidth := 5;
    umDM.QContasPagar.FieldByName('desconto').DisplayWidth := 5;

   //-----------------------------//
    AtualizaGrid;
    result := umDM.DSContasPagar;
end;

procedure DaoContasPagar.Ordena(campo: string);
begin
    umDM.QContasPagar.IndexFieldNames := campo;
end;

function DaoContasPagar.Salvar(obj: TObject): string;
var  umaContasPagar : ContasPagar;
     umaCtrlCompra  : CtrlCompra;
     i, numParcela : Integer;
     valor : Real;
     status : string;
     countParcelas : Integer;
     cancelar : Boolean;
begin
  umaContasPagar := ContasPagar(obj);
  with umDM do
  begin
    try
      beginTrans;
      QContasPagar.Close;
      if (umaContasPagar.getStatus = 'CANCELADA' ) then
      begin
        countParcelas := ContarContasPagar(umaContasPagar);
        status := umaContasPagar.getStatus;
        cancelar := True;
      end
      else
      begin
        countParcelas := umaContasPagar.CountParcelas;
        status := umaContasPagar.getStatus;
        cancelar := False;
      end;

      for i := 1 to countParcelas do
      begin
        if (cancelar) then
          numParcela := umaContasPagar.getParcelas(i-1).getNumParcela
        else
          numParcela := umaContasPagar.getNumParcela;

        if umaContasPagar.getStatus = 'PENDENTE' then
          QContasPagar.SQL := UpdateContasPagar.InsertSQL
        else
        begin
          QContasPagar.SQL := UpdateContasPagar.ModifySQL;
          QContasPagar.Params.ParamByName('OLD_numnota').Value := umaContasPagar.getNumNota;
          QContasPagar.Params.ParamByName('OLD_serienota').Value := umaContasPagar.getSerieNota;
          QContasPagar.Params.ParamByName('OLD_numparcela').Value := numParcela;
          QContasPagar.Params.ParamByName('OLD_idfornecedor').Value := umaContasPagar.getUmFornecedor.getId;
        end;
        QContasPagar.Params.ParamByName('numnota').Value := umaContasPagar.getNumNota;
        QContasPagar.Params.ParamByName('serienota').Value := umaContasPagar.getSerieNota;
        QContasPagar.Params.ParamByName('idfornecedor').Value := umaContasPagar.getUmFornecedor.getId;
        QContasPagar.Params.ParamByName('idusuario').Value := umaContasPagar.getUmUsuario.getIdUsuario;
        QContasPagar.Params.ParamByName('idformapagamento').Value := umaContasPagar.getUmaFormaPagamento.getId;
        QContasPagar.Params.ParamByName('multa').Value := umaContasPagar.getMulta;
        QContasPagar.Params.ParamByName('juros').Value := umaContasPagar.getJuros;
        QContasPagar.Params.ParamByName('desconto').Value := umaContasPagar.getDesconto;

        QContasPagar.Params.ParamByName('status').Value := status;
        QContasPagar.Params.ParamByName('observacao').Value := umaContasPagar.getObservacao;
        QContasPagar.Params.ParamByName('dataemissao').Value := umaContasPagar.getDataEmissao;
        if (umaContasPagar.getDataPagamento <> StrToDateTime('30/12/1899')) then
          QContasPagar.Params.ParamByName('datapagamento').Value := umaContasPagar.getDataPagamento;

        if umaContasPagar.getStatus = 'PENDENTE' then
        begin
          QContasPagar.Params.ParamByName('numparcela').Value := umaContasPagar.getParcelas(i-1).getNumParcela;
          valor := StrToFloat(FormatFloat('#0.00',(umaContasPagar.getParcelas(i-1).getPorcentagem/100) * umaContasPagar.getTotalAux));
          QContasPagar.Params.ParamByName('valor').Value := valor;
          QContasPagar.Params.ParamByName('datavencimento').Value := DateToStr(Date + umaContasPagar.getParcelas(i-1).getDias);
        end
        else
        begin
          QContasPagar.Params.ParamByName('numparcela').Value := numParcela;
          QContasPagar.Params.ParamByName('valor').Value := umaContasPagar.getValor;
          QContasPagar.Params.ParamByName('datavencimento').Value := umaContasPagar.getDataVencimento;
        end;
        QContasPagar.ExecSQL;
      end;
      //Chamada para o cancelamento da compra quando uma contas a pagar for cancelada pela propria tela
      if (status = 'CANCELADA') then
        Self.VerificarCompra(umaContasPagar);

      Commit;
      if umaContasPagar.getStatus = 'CANCELADA' then
        result := 'Conta Cancelada com sucesso!'
      else
        result := 'Conta Paga com sucesso!';
    except
      on e: Exception do
      begin
          rollback;
          if umaContasPagar.getStatus = 'CANCELADA' then
            Result := 'Ocorreu um erro! Essa Conta não foi cancelada. Erro: '+e.Message
          else
            Result := 'Ocorreu um erro! Essa Conta não foi salva. Erro: '+e.Message;

      end;
    end;
  end;
  Self.AtualizaGrid;
end;

end.
